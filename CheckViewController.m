//
//  CheckViewController.m
//  Fertility Connect
//
//  Created by Mark Rustad on 1/17/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "CheckViewController.h"

@interface CheckViewController ()
{
    NSArray *tableData;
    NSMutableArray *selectedRows;
}

@end

@implementation CheckViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = tableData[indexPath.row];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    NSNumber *obj = [NSNumber numberWithInteger:indexPath.row];
    if ([selectedRows containsObject:obj])
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
    NSNumber *obj = [NSNumber numberWithInteger:indexPath.row];
    if ([selectedRows containsObject:obj])
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [selectedRows removeObject:obj];
        [tableView reloadData];
    }else{
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [selectedRows addObject:obj];
        [tableView reloadData];
    }

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:selectedRows forKey:@"SelectedRows"];
    [defaults synchronize];
}
- (void)viewDidLoad {
    [super viewDidLoad];


    tableData = [NSArray arrayWithObjects: @"DAY 1: Begin Lupron Protocol on Day 21 of Menstruation",@"DAY 8: Menstrual Period Occurs",@"DAY 9: Follicle Stimulating Hormone (FSH) Injections Begin",@"DAYS 9,12,14,16: Blood and Ultrasound Tests Conducted",@"DAY 16: Lupron Protocol Typically Ends",@"DAY 16: HCG Ovulation Induction Injection Received",@"DAY 16: Last Day of FSH Injections",@"DAY 18: Egg Retrieval",@"DAY 19: Progresterone Injections/Cream treatment starts",@"DAY 21: Embryo Transfer Process (Day Three Option)",@"DAY 23: Embryo 'Blastocyst' Transfer (5-7 day old embryo)",@"DAY 30-32: Pregnancy Test with Blood Levels", nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    selectedRows = [NSMutableArray arrayWithArray:[defaults objectForKey:@"SelectedRows"]];
    
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
