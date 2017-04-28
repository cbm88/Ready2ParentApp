//
//  YourChildViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/20/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "YourChildViewController.h"

@interface YourChildViewController ()

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *uploadChildImage;

@end

@implementation YourChildViewController
- (IBAction)uploadChildPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
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
            NSString* path = [documentsDirectory stringByAppendingPathComponent:@"childImage.png" ];
            NSData* data = UIImagePNGRepresentation(chosenImage);
            [data writeToFile:path atomically:YES];
        }
     [picker dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)loadImage{
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
NSUserDomainMask, YES);
NSString *documentsDirectory = [paths objectAtIndex:0];
NSString* path = [documentsDirectory stringByAppendingPathComponent:
@"childImage.png" ];
UIImage *image = [UIImage imageWithContentsOfFile:path];
_imageView.image = image;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      @"childImage.png" ];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _imageView.image = image;
    
    [self.imageView setFrame:CGRectMake(0, 65, 320, 412)];
    
    self.imageView.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    self.uploadChildImage.layer.borderColor = [UIColor grayColor].CGColor;
    self.uploadChildImage.layer.borderWidth = 1.0f;
    self.uploadChildImage.layer.cornerRadius = (_uploadChildImage.bounds.size.height/4);

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
