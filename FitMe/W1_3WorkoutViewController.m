//
//  W1_3WorkoutViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 27..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "W1_3WorkoutViewController.h"
#import "SWRevealViewController.h"
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"
#import "Singleton.h"

@interface W1_3WorkoutViewController ()

@property (nonatomic) NSMutableArray *workouts;
@property (nonatomic) NSArray *days;
@property (nonatomic) NSMutableArray *finishedExercises;
@property (nonatomic) NSMutableArray *NonfinishedExercises;



@end

@implementation W1_3WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    //self.finishedExercises = [[NSMutableArray alloc] init];
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
    MGSwipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *workouts = [self itemAtIndexPath:indexPath];
    
    
    
    cell.textLabel.text = workouts[@"name"];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    cell.detailTextLabel.text = workouts[@"reps"];
    
    //configure left buttons
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"A" backgroundColor:[UIColor greenColor] callback:^BOOL(MGSwipeTableCell *sender) {
        NSLog(@"place holder for storing finished workout");
        return 0;
    }]];
    cell.leftSwipeSettings.transition = MGSwipeTransition3D;
    
    
    
    //configure right buttons
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"X" backgroundColor:[UIColor redColor] callback:^BOOL(MGSwipeTableCell *sender) {
        NSLog(@"place holder for storing finished workout");
        return 0;
    }],[MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor lightGrayColor]callback:^BOOL(MGSwipeTableCell *sender) {
        NSLog(@"place holder for storing finished workout");
        return 0;
    }]];
    cell.rightSwipeSettings.transition = MGSwipeTransition3D;
    
    
//    if ([workouts[@"completed"] boolValue]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    //NSLog(@"completed items%@", workouts[@"completed"]);

    
    
    
    
    [cell layoutIfNeeded];
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.days[section];
}



#pragma mark - Table View delegate


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSInteger index = [self itemIndexForIndexPath:indexPath];
//    
//    
//    NSMutableDictionary *item = [self.workouts[index] mutableCopy];
//    BOOL completed = [item[@"completed"] boolValue];
//    item[@"completed"] = @(!completed);
//    
//    self.workouts[indexPath.row] = item;
//    
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = ([item[@"completed"] boolValue]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//}





@end

