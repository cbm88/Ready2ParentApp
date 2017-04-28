//
//  ResultsTableViewController.h
//  Fertility Connect
//
//  Created by Mark Rustad on 2/16/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ResultsTableCell.h"
#import "AdoptFertilityViewController.h"

@interface ResultsTableViewController : UITableViewController <MKMapViewDelegate>
@property (strong, nonatomic) NSArray *mapItems;

@end
