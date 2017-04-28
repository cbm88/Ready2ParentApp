//
//  ViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/2/16.
//  Copyright (c) 2016 Mark Rustad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutlet UITextField* babyNameTextField;
@property (retain, nonatomic) IBOutlet UITextField* dueDateTextField;
@property (retain, nonatomic) IBOutlet UITextField* pregnancyDate;
@property (retain, nonatomic) IBOutlet UITextField* actualBirthDate;
@property (strong, nonatomic) IBOutlet UIButton* saveDetailsButton;
@property (strong, nonatomic) IBOutlet UIButton* uploadPhoto;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;
- (IBAction)genderIndexChanged:(UISegmentedControl *)sender;

@end

@implementation ViewController

-(IBAction)saveDetails:(id)sender{
    NSString *saveString = _babyNameTextField.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveString forKey:@"saveString1"];
    NSString *saveString2 = _dueDateTextField.text;
    [defaults setObject:saveString2 forKey:@"saveString2"];
    NSString *saveString3 = _pregnancyDate.text;
    [defaults setObject:saveString3 forKey:@"saveString3"];
    NSString *saveString4 = _actualBirthDate.text;
    [defaults setObject:saveString4 forKey:@"saveString4"];
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"FERTILITY CONNECT MESSAGE"
        message:@"CONGRATULATIONS ON YOUR BABY!"
            delegate:self cancelButtonTitle:@"Thank You" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)uploadPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)genderIndexChanged:(UISegmentedControl *)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (sender.selectedSegmentIndex == 0) {
        [defaults setObject:@"BOY" forKey:@"genderIndexChangedKey"];
    } else if (sender.selectedSegmentIndex == 1) {
        [defaults setObject:@"GIRL" forKey:@"genderIndexChangedKey"];
    }
    [defaults synchronize];
}

- (IBAction)hideKeyboard:(id)sender{
    [_babyNameTextField endEditing:YES];
    [_dueDateTextField endEditing:YES];
    [_pregnancyDate endEditing:YES];
    [_actualBirthDate endEditing:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    {
        if (chosenImage != nil)
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString* path = [documentsDirectory stringByAppendingPathComponent:@"babyImage.png" ];
            NSData* data = UIImagePNGRepresentation(chosenImage);
            [data writeToFile:path atomically:YES];
        }
     [picker dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)loadImage{
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
NSUserDomainMask, YES);
NSString *documentsDirectory = [paths objectAtIndex:0];
NSString* path = [documentsDirectory stringByAppendingPathComponent:
@"babyImage.png" ];
UIImage *image = [UIImage imageWithContentsOfFile:path];
_imageView.image = image;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.imageView.layer.borderColor = [UIColor cyanColor].CGColor;
    self.imageView.layer.borderWidth = 1.5f;
    self.saveDetailsButton.layer.cornerRadius = (_saveDetailsButton.bounds.size.height/4);
    self.saveDetailsButton.layer.borderColor = [UIColor purpleColor].CGColor;
    self.saveDetailsButton.layer.borderWidth = 1.5f;
    self.uploadPhoto.layer.cornerRadius = (_uploadPhoto.bounds.size.height/4);
    self.uploadPhoto.layer.borderColor = [UIColor purpleColor].CGColor;
    self.uploadPhoto.layer.borderWidth = 1.5f;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey:@"saveString1"];
    [_babyNameTextField setText:loadString];
    NSString *loadString2 = [defaults objectForKey:@"saveString2"];
    [_dueDateTextField setText:loadString2];
    NSString *loadString3 = [defaults objectForKey:@"saveString3"];
    [_pregnancyDate setText:loadString3];
    NSString *loadString4 = [defaults objectForKey:@"saveString4"];
    [_actualBirthDate setText:loadString4];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      @"babyImage.png" ];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _imageView.image = image;
    
    [self.imageView setFrame:CGRectMake(40, 306, 240, 168)];
    
    self.genderSegmentedControl.selectedSegmentIndex = ([[defaults stringForKey:@"genderIndexChangedKey"] isEqualToString:@"GIRL"]) ? (1):(0);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
