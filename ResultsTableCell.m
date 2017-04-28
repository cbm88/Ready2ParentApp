//
//  ResultsTableCell.m
//  Fertility Connect
//
//  Created by Mark Rustad on 2/16/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "ResultsTableCell.h"

@implementation ResultsTableCell

- (void)awakeFromNib {
    _phoneNumberView.userInteractionEnabled = YES;
    _phoneNumberView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    _phoneNumberView.scrollEnabled = NO;
    _phoneNumberView.editable = NO;
    _phoneNumberView.selectable = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
