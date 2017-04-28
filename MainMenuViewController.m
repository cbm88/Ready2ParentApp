//
//  MainMenuViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/7/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()
@property (strong, nonatomic) IBOutlet UIButton *ivf;
@property (strong, nonatomic) IBOutlet UIButton *findAClinic;
@property (strong, nonatomic) IBOutlet UIButton *reminderCentral;
@property (strong, nonatomic) IBOutlet UIButton *contactInfo;
@property (strong, nonatomic) IBOutlet UIButton *babyDetails;

@property (strong, nonatomic) IBOutlet UIImageView *adoptionImage;
@property (strong, nonatomic) IBOutlet UIImageView *fertilityImage;

@property (strong, nonatomic) IBOutlet UIButton *adoptionChecklist;
@property (strong, nonatomic) IBOutlet UIButton *agencyFinder;
@property (strong, nonatomic) IBOutlet UIButton *rCentral;
@property (strong, nonatomic) IBOutlet UIButton *cInfo;
@property (strong, nonatomic) IBOutlet UIButton *childDetails;
@property (strong, nonatomic) IBOutlet UIButton *notifyParents;

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.findAClinic.layer.borderColor = [UIColor blackColor].CGColor;
    self.findAClinic.layer.borderWidth = 1.0f;
    self.findAClinic.layer.cornerRadius = (_findAClinic.bounds.size.height/4);
     self.ivf.layer.borderColor = [UIColor blackColor].CGColor;
    self.ivf.layer.borderWidth = 1.0f;
    self.ivf.layer.cornerRadius = (_ivf.bounds.size.height/4);
     self.reminderCentral.layer.borderColor = [UIColor blackColor].CGColor;
    self.reminderCentral.layer.borderWidth = 1.0f;
    self.reminderCentral.layer.cornerRadius = (_reminderCentral.bounds.size.height/4);
     self.contactInfo.layer.borderColor = [UIColor blackColor].CGColor;
    self.contactInfo.layer.borderWidth = 1.0f;
    self.contactInfo.layer.cornerRadius = (_contactInfo.bounds.size.height/4);
     self.babyDetails.layer.borderColor = [UIColor blackColor].CGColor;
    self.babyDetails.layer.borderWidth = 1.0f;
    self.babyDetails.layer.cornerRadius = (_babyDetails.bounds.size.height/4);
    
    self.adoptionImage.layer.borderWidth = 2.0f;
    self.adoptionImage.layer.borderColor = [UIColor blueColor].CGColor;
    self.fertilityImage.layer.borderWidth = 2.0f;
    self.fertilityImage.layer.borderColor = [UIColor redColor].CGColor;
    
    self.adoptionChecklist.layer.borderColor = [UIColor blackColor].CGColor;
    self.adoptionChecklist.layer.borderWidth = 1.0f;
    self.adoptionChecklist.layer.cornerRadius = (_adoptionChecklist.bounds.size.height/4);
     self.agencyFinder.layer.borderColor = [UIColor blackColor].CGColor;
    self.agencyFinder.layer.borderWidth = 1.0f;
    self.agencyFinder.layer.cornerRadius = (_agencyFinder.bounds.size.height/4);
     self.rCentral.layer.borderColor = [UIColor blackColor].CGColor;
    self.rCentral.layer.borderWidth = 1.0f;
    self.rCentral.layer.cornerRadius = (_rCentral.bounds.size.height/4);
     self.cInfo.layer.borderColor = [UIColor blackColor].CGColor;
    self.cInfo.layer.borderWidth = 1.0f;
    self.cInfo.layer.cornerRadius = (_cInfo.bounds.size.height/4);
     self.childDetails.layer.borderColor = [UIColor blackColor].CGColor;
    self.childDetails.layer.borderWidth = 1.0f;
    self.childDetails.layer.cornerRadius = (_childDetails.bounds.size.height/4);
    
    self.notifyParents.layer.borderColor = [UIColor blackColor].CGColor;
    self.notifyParents.layer.borderWidth = 1.0f;
    self.notifyParents.layer.cornerRadius = (_notifyParents.bounds.size.height/4);



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
