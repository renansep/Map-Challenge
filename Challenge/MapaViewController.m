//
//  MapaViewController.m
//  Challenge
//
//  Created by Renan Cargnin on 2/6/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import "MapaViewController.h"
#import "AppDelegate.h"
#import "Local.h"
#import "CadastroLocalViewController.h"

@interface MapaViewController () {
    BOOL pinVermelho;
}

@end


@implementation MapaViewController
@synthesize mapView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 50.0;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    txtBusca.delegate = self;
    
    UILongPressGestureRecognizer *toqueLongoMapa =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(adicionaPino:)];
    toqueLongoMapa.minimumPressDuration = 0.5;
    [mapView addGestureRecognizer:toqueLongoMapa];
    
    pinVermelho = false;
    
	/*AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(-23.616845,-46.796265);
    Local *loc = [[Local alloc] initWithNome:@"teste" andCoordenada:coord andHora:8 andMinuto:00];

    [appDelegate.listaTableViewControler.locais addObject:loc];*/
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *myLocation = (CLLocation*)[locations lastObject];
    CLLocationCoordinate2D loc = [myLocation coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [mapView setRegion:region animated:true];
    [locationManager stopUpdatingLocation];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    MKLocalSearchRequest *searchRequest = [[MKLocalSearchRequest alloc] init];
    searchRequest.naturalLanguageQuery = searchBar.text;
    searchRequest.region = [mapView region];
    [mapView removeAnnotations:[mapView annotations]];
    
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:searchRequest];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if (response.mapItems.count > 0) {
            for (MKMapItem *item in response.mapItems) {
                MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                point.coordinate = item.placemark.coordinate;
                [self buscaEnderecoPino:point];
            }
        }
    }];
}

-(void) adicionaPino:(UIGestureRecognizer *) gesto {
    if (gesto.state == UIGestureRecognizerStateBegan) {
        
        MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
        if (selectedPin == nil) {
            CGPoint ponto = [gesto locationInView:self.view];
            CLLocationCoordinate2D coordenadas = [mapView convertPoint:ponto toCoordinateFromView:mapView];
            pino.coordinate = coordenadas;
        }
        else
        {
            pino = selectedPin;
            selectedPin = nil;
        }
        
        [self buscaEnderecoPino:pino];
        
    }
}

-(void)buscaEnderecoPino:(MKPointAnnotation*)pino
{
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:[pino coordinate] addressDictionary:nil];
    //MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo  reverseGeocodeLocation:destinationPlacemark.location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            //String to hold address
//            placemark.location.coordinate;
            NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
            pino.title = locatedAt;
        }
        
        [mapView addAnnotation:pino];
        
    }];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView
             viewForAnnotation:(id <MKAnnotation>) annotation {
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc]
                                  initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    if(pinVermelho)
    {
        annView.pinColor = MKPinAnnotationColorRed;
        pinVermelho = false;
    }
    else
    {
        annView.pinColor = MKPinAnnotationColorGreen;
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [rightButton addTarget:self
                        action:@selector(cadastraLocal:)
              forControlEvents:(UIControlEvents)UIControlEventTouchDown];
        annView.rightCalloutAccessoryView = rightButton;
    }
    
    annView.animatesDrop = YES;
    annView.canShowCallout = YES;
    return annView;
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    selectedPin = (MKPointAnnotation*)view.annotation;
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    selectedPin = nil;
}

-(void)cadastraLocal:(id)sender
{
    CadastroLocalViewController *secondViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"localViewController"];
    
    secondViewController.descricao = selectedPin.title;
    secondViewController.coordenadas = selectedPin.coordinate;
    [self presentViewController:secondViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapView.mapType = MKMapTypeHybrid;
            break;
    }
}

-(void)setPontoAtualVermelho:(NSString*)title naHora:(NSString*)horario
{
    if(selectedPin != nil)
    {
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.title = title;
        point.subtitle = horario;
        point.coordinate = selectedPin.coordinate;
        [mapView removeAnnotation:selectedPin];
        pinVermelho = true;
        [mapView addAnnotation:point];
    }
}
    
- (void)setMapRegion:(CLLocationCoordinate2D) coordinate
{
    [mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, 500, 500) animated:YES];
}

@end
