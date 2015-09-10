//
//  W10_12WorkoutViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 27..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "W10_12WorkoutViewController.h"
#import "SWRevealViewController.h"
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"
#import "Singleton.h"

@interface W10_12WorkoutViewController ()

@property (nonatomic) NSMutableArray *workouts;

@property (nonatomic) NSArray *days;

@end

@implementation W10_12WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"SUPERSET STRAIGHT ARM PULL DOWNS and PULL-UPS", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 15 and 4 x 12"}, @{@"name" : @"SUPERSET ALT. DUMBBELL PRESS and DUMBBELL WIDE TO CLOSE PRESS", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 10 and 4 x 8"}, @{@"name" : @"SUPERSET FACE PULL and PENDLAY ROW", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 12 and 4 x 12"}, @{@"name" : @"SUPERSET CHEST DIPS and PULL OVER", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 15 and 4 x 12"}, @{@"name" : @"HANGING LEG RAISE", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"3 x 15"}, @{@"name" : @"BAND WOOD CHOPS", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"3 x 15"}, @{@"name" : @"SQUATS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"15, 10, 8, 4"}, @{@"name" : @"SUPERSET WALKING LUNGES and BARBELL HACK SQUATS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"4 x 20 and 4 x 15"}, @{@"name" : @"SUPERSET BARBELL RDL and MANUAL HAMSTRING CURLS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 12 and 3 x 12"}, @{@"name" : @"SEATED CALF RAISE", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 20"}, @{@"name" : @"OTIS UPS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 15"}, @{@"name" : @"RUSSIAN TWISTS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 10"}, @{@"name" : @"SUPERSET SEATED BARBELL SHOULDER PRESS and ALT. UPRIGHT ROW", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"12, 10, 8, 6 and 4 x 12"}, @{@"name" : @"SUPERSET FACE PULLS and BENT OVER FRONT/LATERAL/REVERSE RAISE", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 10 and 3 x 5"}, @{@"name" : @"SUPERSET STEERING WHEELS and LATERAL RAISE", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 10 and 3 x 15"}, @{@"name" : @"REAR SHRUGS", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"4 x 15"}, @{@"name" : @"CABLE EXTERNAL ROTATIONS", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 12"}, @{@"name" : @"SUPERSET WEIGHTED PLANKS and MOUNTAIN CLIMBERS", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 30 SEC  and 3 x 30 SEC"}, @{@"name" : @"SUPERSET CLOSE GRIP BARBELL PRESS and WEIGHTED CHIN UPS", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"4 x 15 and 4 x 15"}, @{@"name" : @"SUPERSET BILATERAL KICKBACKS and PLATE PINCH REVERSE CURL", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 15  and 3 x 15"}, @{@"name" : @"SUPERSET SKULLCRUSHER AND BARBELL CURL", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 10  and 3 x 3 drop set until failure"}, @{@"name" : @"SEATED UNILATERAL FINGER CURL", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 15"}, @{@"name" : @"WRIST ROLLER", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x FAILURE"}, @{@"name" : @"BARBELL DEADLIFT", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"12, 8, 4, 2"}, @{@"name" : @"BARBELL BENCH", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"12, 8, 4, 2"}, @{@"name" : @"SUPERSET DUMBBELL UNILATERAL ROW and DUMBBELL UNILATERAL PRESS", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 12 and 3 x 12"}, @{@"name" : @"SUPERSET BARBELL PULLOVER and DUMBELL FLYES", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 10 and 3 x 15"}, @{@"name" : @"SUPERSET PULL-UPS and PUSH-UPS TWIST", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x FAILURE and 3 x FAILURE"}, @{@"name" : @"DOUBLE CRUNCH", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 15"}, @{@"name" : @"OBLIQUE CRUNCH", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 20"}, @{@"name" : @"SUPERSET LEG PRESS and DUMBBELL SWINGS", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"15, 12, 10, 8 and 4 x 15"}, @{@"name" : @"SUPERSET BULGARIAN SPLIT SQUATS and UNILATERAL RDL", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10 and 3 x 10"}, @{@"name" : @"SUPERSET ARNOLD PRESS and SINGLE ARM BENT OVER LATERAL RAISE", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10 and 3 x 12"}, @{@"name" : @"SUPERSET FARMER SQUATS and FARMER WALKS", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10 and 3 x 1 MINUTE"}, @{@"name" : @"SUPERSET REVERSE UPRIGHT ROW and PLATE FRONT RAISE", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 12 and 3 x 12"}, @{@"name" : @"WEIGHTED CRUNCH", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10"}, @{@"name" : @"LYING LEG RAISE W/HIP THRUST", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 15"}].mutableCopy;
    
    self.days = @[@"DAY 1 : BACK + CHEST + ABS", @"DAY 2 : LEGS + CALVES + ABS", @"DAY 3 : SHOULDERS + TRAPS + ABS", @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"DAY 5 : BACK + CHEST + ABS", @"DAY 6 : LEGS + SHOULDERS + ABS"];
    
    
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
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }

    //    NSLog(@"cell.textLabel.text %@", cell.textLabel.text);
    
    
    
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

