//
//  MapaViewController.h
//  Challenge
//
//  Created by Renan Cargnin on 2/6/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapaViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate> {
    CLLocationManager *locationManager;
    __weak IBOutlet MKMapView *mapView;
    __weak IBOutlet UISearchBar *txtBusca;
    MKPointAnnotation *selectedPin;
}


- (IBAction)setMapType:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(void)setPontoAtualVermelho:(NSString*)title naHora:(NSString*)horario;

@end
