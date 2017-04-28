//
//  AdoptionCheckViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/19/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "AdoptionCheckViewController.h"

@interface AdoptionCheckViewController ()
{
    NSArray *adoptionData;
    NSMutableArray *selRows;
}

@end

@implementation AdoptionCheckViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [adoptionData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = adoptionData[indexPath.row];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    NSNumber *obj = [NSNumber numberWithInteger:indexPath.row];
    if ([selRows containsObject:obj])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;

    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *obj2 = [NSNumber numberWithInteger:indexPath.row];
    if ([selRows containsObject:obj2])
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [selRows removeObject:obj2];
        [tableView reloadData];
    }else{
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [selRows addObject:obj2];
        [tableView reloadData];
    }

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:selRows forKey:@"SelectedRows2"];
    [defaults synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    adoptionData = [NSArray arrayWithObjects: @"Step 1: Find An Agency",@"Step 2: Establish Strong Relationship With Caseworker",@"Step 3: Obtain At Least Three Personal References",@"Step 4: Complete Local, State, and Federal Background Checks",@"Step 5: Complete Minimum Income Verification",@"Step 6: Meet Minimum State Age Requirement",@"Step 7: Go to Pre-Service Training",@"Step 8: Finalize and Complete Paper Applications",@"Step 9: Complete Home Study",@"Step 10: Get Matched with a Child",@"Step 11: Receive Adoptive Placement",@"Step 12: Legalize Adoption with Attorney", nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    selRows = [NSMutableArray arrayWithArray:[defaults objectForKey:@"SelectedRows2"]];
    

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
