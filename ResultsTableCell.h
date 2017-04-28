//
//  ResultsTableCell.h
//  Fertility Connect
//
//  Created by Mark Rustad on 2/16/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextView *phoneNumberView;
@end
