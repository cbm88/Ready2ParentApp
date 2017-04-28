//
//  AdoptFertilityViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 2/16/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "AdoptFertilityViewController.h"
#import "ResultsTableViewController.h"


@interface AdoptFertilityViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *matchingItems;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *detailButton;

@end

@implementation AdoptFertilityViewController


-(IBAction)searchAdoptionAgency:(id)sender{
  
    [_mapView removeAnnotations:(_mapView.annotations)];
MKLocalSearchRequest *request = 
          [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Adoption";
    request.region = _mapView.region;

    _matchingItems = [[NSMutableArray alloc] init];

    MKLocalSearch *search = 
        [[MKLocalSearch alloc]initWithRequest:request];

    [search startWithCompletionHandler:^(MKLocalSearchResponse 
       *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                [_matchingItems addObject:item];
                MKPointAnnotation *annotation = 
                     [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                annotation.subtitle = item.phoneNumber;
                [_mapView addAnnotation:annotation];
            }
    }];
}

-(IBAction)searchFertilityClinics:(id)sender{
  
    [_mapView removeAnnotations:(_mapView.annotations)];
MKLocalSearchRequest *request = 
          [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Fertility";
    request.region = _mapView.region;

    _matchingItems = [[NSMutableArray alloc] init];

    MKLocalSearch *search = 
        [[MKLocalSearch alloc]initWithRequest:request];

    [search startWithCompletionHandler:^(MKLocalSearchResponse 
       *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                [_matchingItems addObject:item];
                MKPointAnnotation *annotation = 
                     [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                annotation.subtitle = item.phoneNumber;
                [_mapView addAnnotation:annotation];
            }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    _mapView.region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,5000,5000);
    [_mapView setRegion:_mapView.region animated:YES];
    [self.mapView setShowsUserLocation:YES];
    
    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"READY2PARENT REMINDER"  message:@"Please Tap 'View Details' to Navigate to the Main Menu"  preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem*)detailButton{

         ResultsTableViewController *destination = 
               [segue destinationViewController];

    destination.mapItems = _matchingItems;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
