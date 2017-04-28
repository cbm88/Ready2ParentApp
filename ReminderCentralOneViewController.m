//
//  ReminderCentralOneViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/20/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "ReminderCentralOneViewController.h"

@interface ReminderCentralOneViewController ()

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIButton *lupronReminder;
@property (strong, nonatomic) IBOutlet UIButton *fshReminder;
@property (strong, nonatomic) IBOutlet UIButton *hcgReminder;
@property (strong, nonatomic) IBOutlet UIButton *retrievalReminder;
@property (strong, nonatomic) IBOutlet UIButton *transferReminder;
@property (strong, nonatomic) IBOutlet UIButton *pregnancyTestReminder;

@end

@implementation ReminderCentralOneViewController
- (IBAction)lupronNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until Lupron Appointment!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)fshNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until FSH Treatment Appointment!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)hcgNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until HCG Induction Appointment!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)retrievalNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until Retrieval Appointment!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)embryoTransferNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until Embryo Transfer Appointment!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)pregnancyTestNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until Pregnancy Test Appointment!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lupronReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.lupronReminder.layer.borderWidth = 1.0f;
    self.lupronReminder.layer.cornerRadius = (_lupronReminder.bounds.size.height/4);
     self.fshReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.fshReminder.layer.borderWidth = 1.0f;
    self.fshReminder.layer.cornerRadius = (_fshReminder.bounds.size.height/4);
     self.hcgReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.hcgReminder.layer.borderWidth = 1.0f;
    self.hcgReminder.layer.cornerRadius = (_hcgReminder.bounds.size.height/4);
     self.retrievalReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.retrievalReminder.layer.borderWidth = 1.0f;
    self.retrievalReminder.layer.cornerRadius = (_retrievalReminder.bounds.size.height/4);
     self.transferReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.transferReminder.layer.borderWidth = 1.0f;
    self.transferReminder.layer.cornerRadius = (_transferReminder.bounds.size.height/4);
    self.pregnancyTestReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.pregnancyTestReminder.layer.borderWidth = 1.0f;
    self.pregnancyTestReminder.layer.cornerRadius = (_pregnancyTestReminder.bounds.size.height/4);
    
    self.datePicker.layer.borderWidth = 2.0f;
    self.datePicker.layer.borderColor = [UIColor cyanColor].CGColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
