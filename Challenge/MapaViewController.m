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

@interface MapaViewController ()

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
    
	/*AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(-23.616845,-46.796265);
    Local *loc = [[Local alloc] initWithNome:@"teste" andCoordenada:coord andHora:8 andMinuto:00];

    [appDelegate.listaTableViewControler.locais addObject:loc];*/
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
    
    

@end
