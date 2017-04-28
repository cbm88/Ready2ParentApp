//
//  ContactInfoViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/4/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "ContactInfoViewController.h"

@interface ContactInfoViewController ()

@property (strong, nonatomic) IBOutlet UITextField *doctorName;
@property (strong, nonatomic) IBOutlet UITextField *clinicPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *clinicEmail;
@property (strong, nonatomic) IBOutlet UITextField *insurancePhoneNumber;
@property (strong, nonatomic) IBOutlet UIButton *sendEmailToClinic;
@property (strong, nonatomic) IBOutlet UIButton *callClinic;
@property (strong, nonatomic) IBOutlet UIButton *callInsurance;
@property (strong, nonatomic) IBOutlet UIButton *save;

@end

@implementation ContactInfoViewController

-(IBAction)saveButtonPressed:(id)sender{
    NSString *saveString5 = _doctorName.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveString5 forKey:@"saveString5"];
    NSString *saveString6 = _clinicPhoneNumber.text;
    [defaults setObject:saveString6 forKey:@"saveString6"];
    NSString *saveString7 = _clinicEmail.text;
    [defaults setObject:saveString7 forKey:@"saveString7"];
    NSString *saveString8 = _insurancePhoneNumber.text;
    [defaults setObject:saveString8 forKey:@"saveString8"];
}

- (IBAction)callTheClinic:(id)sender{
    NSString *phoneNumber = [@"tel:" stringByAppendingString:_clinicPhoneNumber.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callInsuranceProvider:(id)sender{
    NSString *phoneNumber = [@"tel:" stringByAppendingString:_insurancePhoneNumber.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}


- (IBAction)sendEmailToClinic:(id)sender {
    NSString *emailTitle = @"";
    NSString *messageBody = @"";
    NSArray *toRecipents = [NSArray arrayWithObject: _clinicEmail.text];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];

    NSString *file;
    NSArray *filepart = [file componentsSeparatedByString:@"."];
    NSString *filename = [filepart objectAtIndex:0];
    NSString *extension = [filepart objectAtIndex:1];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:extension];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    NSString *mimeType;
    if ([extension isEqualToString:@"jpg"]) {
        mimeType = @"image/jpeg";
    } else if ([extension isEqualToString:@"png"]) {
        mimeType = @"image/png";
    } else if ([extension isEqualToString:@"doc"]) {
        mimeType = @"application/msword";
    } else if ([extension isEqualToString:@"ppt"]) {
        mimeType = @"application/vnd.ms-powerpoint";
    } else if ([extension isEqualToString:@"html"]) {
        mimeType = @"text/html";
    } else if ([extension isEqualToString:@"pdf"]) {
        mimeType = @"application/pdf";
    }

    [mc addAttachmentData:fileData mimeType:mimeType fileName:filename];

    [self presentViewController:mc animated:YES completion:NULL];

}

- (IBAction)hideKeyboard:(id)sender{
    [_doctorName endEditing:YES];
    [_clinicPhoneNumber endEditing:YES];
    [_clinicEmail endEditing:YES];
    [_insurancePhoneNumber endEditing:YES];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Send Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Draft Saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail Sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Send Failed: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.save.layer.cornerRadius = (_save.bounds.size.height/4);
    self.save.layer.borderColor = [UIColor blackColor].CGColor;
    self.save.layer.borderWidth = 1.5f;
    self.sendEmailToClinic.layer.cornerRadius = (_sendEmailToClinic.bounds.size.height/4);
    self.sendEmailToClinic.layer.borderColor = [UIColor blackColor].CGColor;
    self.sendEmailToClinic.layer.borderWidth = 1.5f;
    self.callClinic.layer.cornerRadius = (_callClinic.bounds.size.height/4);
    self.callClinic.layer.borderColor = [UIColor blackColor].CGColor;
    self.callClinic.layer.borderWidth = 1.5f;
    self.callInsurance.layer.cornerRadius = (_callInsurance.bounds.size.height/4);
    self.callInsurance.layer.borderColor = [UIColor blackColor].CGColor;
    self.callInsurance.layer.borderWidth = 1.5f;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString5 = [defaults objectForKey:@"saveString5"];
    [_doctorName setText:loadString5];
    NSString *loadString6 = [defaults objectForKey:@"saveString6"];
    [_clinicPhoneNumber setText:loadString6];
    NSString *loadString7 = [defaults objectForKey:@"saveString7"];
    [_clinicEmail setText:loadString7];
    NSString *loadString8 = [defaults objectForKey:@"saveString8"];
    [_insurancePhoneNumber setText:loadString8];

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
