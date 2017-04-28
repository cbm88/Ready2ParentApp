//
//  ReminderCentralTwoViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/21/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "ReminderCentralTwoViewController.h"

@interface ReminderCentralTwoViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIButton *appDueReminder;
@property (strong, nonatomic) IBOutlet UIButton *trainingReminder;
@property (strong, nonatomic) IBOutlet UIButton *homeStudyReminder;
@property (strong, nonatomic) IBOutlet UIButton *legalizeAdoptionReminder;

@end

@implementation ReminderCentralTwoViewController
- (IBAction)appDueNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = @"Adoption Application Due Today!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)trainingNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until Pre-Service Training!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)homeStudyNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    NSDate *thirtyMinutesBeforeDate = [NSDate dateWithTimeInterval: -30*60 sinceDate: (pickerDate)];
    localNotification.fireDate = thirtyMinutesBeforeDate;
    localNotification.alertBody = @"30 Minutes Until Home Study!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

- (IBAction)legalizeAdoptionNotification:(UIButton *)sender{

    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *pickerDate = self.datePicker.date;
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = @"Legalize Your Adoption Today!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDueReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.appDueReminder.layer.borderWidth = 1.0f;
    self.appDueReminder.layer.cornerRadius = (_appDueReminder.bounds.size.height/4);
     self.trainingReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.trainingReminder.layer.borderWidth = 1.0f;
    self.trainingReminder.layer.cornerRadius = (_trainingReminder.bounds.size.height/4);
     self.homeStudyReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.homeStudyReminder.layer.borderWidth = 1.0f;
    self.homeStudyReminder.layer.cornerRadius = (_homeStudyReminder.bounds.size.height/4);
     self.legalizeAdoptionReminder.layer.borderColor = [UIColor blackColor].CGColor;
    self.legalizeAdoptionReminder.layer.borderWidth = 1.0f;
    self.legalizeAdoptionReminder.layer.cornerRadius = (_legalizeAdoptionReminder.bounds.size.height/4);
    
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
