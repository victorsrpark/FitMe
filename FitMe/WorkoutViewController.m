//
//  WorkoutViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 20..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "WorkoutViewController.h"
#import "SWRevealViewController.h"

@interface WorkoutViewController ()

@property (nonatomic) NSMutableArray *plans;
@property (nonatomic) NSArray *categories;

@end

@implementation WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.plans = @[@{@"name" : @"Week 1-3", @"category" : @"Buff Dudes Workout"}, @{@"name" : @"Week 4-6", @"category" : @"Buff Dudes Workout"}, @{@"name" : @"Week 7-9", @"category" : @"Buff Dudes Workout"}, @{@"name" : @"Week 10-12", @"category" : @"Buff Dudes Workout"}].mutableCopy;
    self.categories = @[@"Buff Dudes Workout"];
    
    
    self.title = @"Workout Programs";
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource helper methods

- (NSArray *) itemsInCategory:(NSString *)targetCategory {
    NSPredicate *matchingPredicate = [NSPredicate predicateWithFormat:@"category == %@", targetCategory];
    NSArray *categoryItems = [self.plans filteredArrayUsingPredicate:matchingPredicate];
    
    return categoryItems;
}

- (NSInteger)numberOfItemsInCategory:(NSString *)targetCategory {
    return [self itemsInCategory:targetCategory].count;
}

- (NSDictionary *)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *category = self.categories[indexPath.section];
    NSArray *categoryItems = [self itemsInCategory:category];
    NSDictionary *item = categoryItems[indexPath.row];
    
    return item;
}

- (NSInteger)itemIndexForIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = [self itemAtIndexPath:indexPath];
    
    NSInteger index = [self.plans indexOfObjectIdenticalTo:item];
    
    return index;
}

//- (void)removeitemsAtindexPath:(NSIndexPath *)indexPath {
//    NSInteger index = [self itemIndexForIndexPath:indexPath];
//    [self.items removeObjectAtIndex:index];


#pragma mark - table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self numberOfItemsInCategory:self.categories[section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"workoutplanrow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *plans = [self itemAtIndexPath:indexPath];
    
    cell.textLabel.text = plans[@"name"];
//    NSLog(@"cell.textLabel.text %@", cell.textLabel.text);
    
    
    
    return cell;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.categories[section];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSInteger index = [self itemIndexForIndexPath:indexPath];
//    
//    switch (index) {
//        case 0:
//            [self performSegueWithIdentifier:@"week1-3" sender:nil];
//            break;
//        case 1:
//            [self performSegueWithIdentifier:@"week4-6" sender:nil];
//            break;
//        case 2:
//            [self performSegueWithIdentifier:@"week7-9" sender:nil];
//            break;
//        case 3:
//            [self performSegueWithIdentifier:@"week10-12" sender:nil];
//            break;
//       
//        default:
//            break;
//    }
//}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
