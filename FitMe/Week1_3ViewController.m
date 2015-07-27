//
//  Week1-3ViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 21..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "Week1_3ViewController.h"
#import "SWRevealViewController.h"

@interface Week1_3ViewController ()

@property (nonatomic) NSMutableArray *workouts;
@property (nonatomic) NSArray *days;


@end

@implementation Week1_3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"SQUATS", @"days" : @"DAY 1", @"reps": @"15, 12, 10, 8, 6"}, @{@"name" : @"BENT OVER ROWS", @"days" : @"DAY 1", @"reps": @"12, 10, 8, 6, 6"}, @{@"name" : @"BENCH PRESS", @"days" : @"DAY 1", @"reps": @"15, 12, 10, 8, 6"}, @{@"name" : @"OVERHEAD PRESS", @"days" : @"DAY 1", @"reps": @"12, 10, 8, 6, 6"}, @{@"name" : @"EXTERNAL ROTATIONS", @"days" : @"DAY 1", @"reps": @"3 x 12"}, @{@"name" : @"SEATED CALF RAISES", @"days" : @"DAY 1", @"reps": @"3 x 15"}, @{@"name" : @"MOUNTAIN CLIMBERS", @"days" : @"DAY 1", @"reps": @"3 x 30 SECONDS"}, @{@"name" : @"PLANKS", @"days" : @"DAY 1", @"reps": @"3 x 30 SECONDS"}, @{@"name" : @"DEADLIFT", @"days" : @"DAY 2", @"reps": @"15, 12, 10, 8, 6"}, @{@"name" : @"KNEELING LANDMINE PRESS", @"days" : @"DAY 2", @"reps": @"15, 12, 10, 8, 8"}, @{@"name" : @"ALT. ARNOLD PRESS", @"days" : @"DAY 2", @"reps": @"12, 10, 8, 8, 6"}, @{@"name" : @"ALT. FRONT LUNGE", @"days" : @"DAY 2", @"reps": @"5 x 10"}, @{@"name" : @"PULL OVER", @"days" : @"DAY 2", @"reps": @"3 x 15"}, @{@"name" : @"WEIGHTED CRUNCHES", @"days" : @"DAY 2", @"reps": @"3 x 15"}, @{@"name" : @"SIDE PLANKS", @"days" : @"DAY 2", @"reps": @"3 x 30 SECONDS"}, @{@"name" : @"FRONT SQUAT", @"days" : @"DAY 3", @"reps": @"15, 12, 10, 8, 6"}, @{@"name" : @"T-BAR ROW", @"days" : @"DAY 3", @"reps": @"12, 10, 8, 8, 6"}, @{@"name" : @"DIPS", @"days" : @"DAY 3", @"reps": @"5 x 15"}, @{@"name" : @"UPRIGHT ROW", @"days" : @"DAY 3", @"reps": @"15, 12, 10, 8, 8"}, @{@"name" : @"GLUTE BRIDGES (WEIGHTED)", @"days" : @"DAY 3", @"reps": @"3 x 10"}, @{@"name" : @"STANDING CALF RAISES", @"days" : @"DAY 3", @"reps": @"3 x 15"}, @{@"name" : @"RUSSIAN TWIST", @"days" : @"DAY 3", @"reps": @"3 x 30 (15 EACH SIDE)"}].mutableCopy;
    
//    self.reps = @[@"15, 12, 10, 8, 6", @"12, 10, 8, 6, 6", , @"12, 10, 8, 6, 6", @"3 x 12", @"3 x 15", @"3 x 30 SECONDS", @"3 x 30 SECONDS", @"15, 12, 10, 8, 6", @"15, 12, 10, 8, 8", @"12, 10, 8, 8, 6", @"5 x 10", @"3 x 15", @"3 x 15", @"3 x 30 SECONDS", @"15, 12, 10, 8, 6", @"12, 10, 8, 8, 6", @"5 x 15", @"15, 12, 10, 8, 8", @"3 x 10", @"3 x 15", @"3 x 30 (15 EACH SIDE)"];
    self.days = @[@"DAY 1", @"DAY 2", @"DAY 3"];
    
    
    self.title = @"WEEK 1-3, PHASE 1";
    

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

- (NSArray *) itemsInDays:(NSString *)targetDays {
    NSPredicate *matchingPredicate = [NSPredicate predicateWithFormat:@"days == %@", targetDays];
    NSArray *daysItems = [self.workouts filteredArrayUsingPredicate:matchingPredicate];
    
    //NSLog(@"itemsInDays method returns%@", daysItems);
    return daysItems;
}

- (NSInteger)numberOfItemsInDays:(NSString *)targetDays {
    return [self itemsInDays:targetDays].count;
}

- (NSDictionary *)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *days = self.days[indexPath.section];
    NSArray *daysItems = [self itemsInDays:days];
    NSDictionary *item = daysItems[indexPath.row];
    
    return item;
}

- (NSInteger)itemIndexForIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = [self itemAtIndexPath:indexPath];
    
    NSInteger index = [self.workouts indexOfObjectIdenticalTo:item];
    
    return index;
}

#pragma mark - table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.days.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self numberOfItemsInDays:self.days[section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"workoutrow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *workouts = [self itemAtIndexPath:indexPath];
    
    cell.textLabel.text = workouts[@"name"];

    cell.detailTextLabel.text = workouts[@"reps"];
    
      
    [cell layoutIfNeeded];
    return cell;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.days[section];
}





@end
