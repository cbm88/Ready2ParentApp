//
//  AdoptFertilityViewController.h
//  Fertility Connect
//
//  Created by Mark Rustad on 2/16/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface AdoptFertilityViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate, UINavigationControllerDelegate, UINavigationBarDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D *userLocation;
}


@end
