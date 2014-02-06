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
#import <UIKit/UIKit.h>

@interface MapaViewController : UIViewController


- (IBAction)setMapType:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
