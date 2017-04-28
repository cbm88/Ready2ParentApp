//
//  InformParentsViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/5/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "InformParentsViewController.h"

@interface InformParentsViewController ()

@property (strong, nonatomic) IBOutlet UITextField *parentOne;
@property (strong, nonatomic) IBOutlet UITextField *parentTwo;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *takePicture;
@property (strong, nonatomic) IBOutlet UIButton *emailNotification;

@end

@implementation InformParentsViewController

- (IBAction)takePicture:(id)sender{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = chosenImage;
    UIImageWriteToSavedPhotosAlbum(chosenImage, nil, nil, nil);
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)emailNotification:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
         
        mailer.mailComposeDelegate = self;

        NSString *emailTitle = @"";
        [mailer setSubject: emailTitle];
        NSArray *toRecipients = [NSArray arrayWithObjects:_parentOne.text,_parentTwo.text, nil];
        [mailer setToRecipients:toRecipients];
        
        UIImage *myImage = [UIImage imageNamed:@"embryoImage.png"];
        NSData *imageData = UIImagePNGRepresentation(myImage);
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"embryoImage"]
      ;
         
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
         
        [self presentViewController:mailer animated:YES completion:NULL];

    }
    else
    {
        nil ;   }
 
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

- (IBAction)hideKeyboard:(id)sender{
    [_parentOne endEditing:YES];
    [_parentTwo endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.layer.borderColor = [UIColor cyanColor].CGColor;
    self.imageView.layer.borderWidth = 3.0f;
    self.parentOne.layer.cornerRadius = (_parentOne.bounds.size.height/4);
    self.parentOne.layer.borderColor = [UIColor blackColor].CGColor;
    self.parentOne.layer.borderWidth = 1.5f;
    self.parentTwo.layer.cornerRadius = (_parentTwo.bounds.size.height/4);
    self.parentTwo.layer.borderColor = [UIColor blackColor].CGColor;
    self.parentTwo.layer.borderWidth = 1.5f;

    
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
