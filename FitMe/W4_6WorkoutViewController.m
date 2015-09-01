//
//  W4_6WorkoutViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 27..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "W4_6WorkoutViewController.h"
#import "SWRevealViewController.h"
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"

@interface W4_6WorkoutViewController ()

@property (nonatomic) NSMutableArray *workouts;

@property (nonatomic) NSArray *days;

@end

@implementation W4_6WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"BARBELL PRESS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"12, 10, 8, 6"}, @{@"name" : @"KNEELING LANDMINE PRESS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"4 X 12"}, @{@"name" : @"UNDER HAND DUMBBELL FLY", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"4 X 12"}, @{@"name" : @"DIPS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"3 X 20"}, @{@"name" : @"SKULL CRUSHERS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"3 X 10"}, @{@"name" : @"LANDMINE 180’S", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"3 X 20"}, @{@"name" : @"ABDOMINAL ROLLER", @"days" : @"DAY 1: CHEST + TRICEPS + ABS", @"reps" : @"3 X 15"}, @{@"name" : @"PENDLAY ROW", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"4 X 12"}, @{@"name" : @"DEADLIFT", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"12, 8, 6, 2"}, @{@"name" : @"SINGLE ARM DUMBBELL ROW", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"4 X 12"}, @{@"name" : @"GOOD MORNINGS", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"3 X 12"}, @{@"name" : @"PULL UPS", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"3 X FAILURE"}, @{@"name" : @"BARBELL CURLS", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"3 X 10"}, @{@"name" : @"ZOTTMAN CURLS", @"days" : @"DAY 2: BACK + BICEPS", @"reps" : @"3 X FAILURE"}, @{@"name" : @"SUPERSET SQUATS with JUMPING SPLIT SQUATS", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"4 X 12 and 4 X 20"}, @{@"name" : @"GLUTE BRIDGES (WEIGHTED)", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"4 X 12"}, @{@"name" : @"OVERHEAD BULGARIAN SQUATS (WEIGHTED)", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"4 X 10"}, @{@"name" : @"LYING HAMSTRING CURLS", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"4 X 12"}, @{@"name" : @"SEATED CALF RAISES", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"3 X 20"}, @{@"name" : @"DONKEY CALF RAISE", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" :  @"3 X 15"}, @{@"name" : @"WEIGHTED PLANK", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"3 X 30 SECONDS"}, @{@"name" : @"PLYOMETRIC SIT-UPS", @"days" : @"DAY 3: LEGS + CALVES + ABS", @"reps" : @"3 X 20"}, @{@"name" : @"CUBAN PRESS (LIGHT WEIGHT)", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"3 x 12"}, @{@"name" : @"OVERHEAD PRESS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"12, 10, 8, 6"}, @{@"name" : @"SINGLE ARM DUMBBELL PRESS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"4 x 12"}, @{@"name" : @"LYING DUMBBELL LATERAL RAISE", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"3 x 12"}, @{@"name" : @"BENT OVER REVERSE FLY", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"3 x 12"}, @{@"name" : @"BARBELL SHRUGS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"15, 12, 10, 8"}, @{@"name" : @"FINGER CURLS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"3 x 15"}, @{@"name" : @"REVERSE CURLS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS", @"reps" : @"3 x 15"}].mutableCopy;
    
    
    self.days = @[@"DAY 1: CHEST + TRICEPS + ABS", @"DAY 2: BACK + BICEPS", @"DAY 3: LEGS + CALVES + ABS", @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"];
    
    
    self.title = @"WEEK 4-6, PHASE 2";
    
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
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"A" backgroundColor:[UIColor greenColor]]];
    cell.leftSwipeSettings.transition = MGSwipeTransition3D;
    
    
    
    //configure right buttons
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"X" backgroundColor:[UIColor redColor]],
                          [MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor lightGrayColor]]];
    cell.rightSwipeSettings.transition = MGSwipeTransition3D;

    
    
    
//    if ([workouts[@"completed"] boolValue]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }

    //NSLog(@"cell.detailtextLabel.text %@", cell.detailTextLabel.text);
    
    
    
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

