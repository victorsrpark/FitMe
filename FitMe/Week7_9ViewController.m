//
//  Week7-9ViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 21..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "Week7_9ViewController.h"
#import "SWRevealViewController.h"

@interface Week7_9ViewController ()

@property (nonatomic) NSMutableArray *workouts;

@property (nonatomic) NSArray *days;

@end

@implementation Week7_9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"SUPERSET SQUATS with SPLIT SQUAT TWISTS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"4 x 10 and 4 x 10 (each side)"}, @{@"name" : @"SINGLE LEG PRESS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 15"}, @{@"name" : @"SUPERSET SINGLE LEG HIP EXTENSION with GOBLET SQUATS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"4 x 10 and 4 x 15"}, @{@"name" : @"SINGLE LEG CALF RAISE", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 15(each side)"}, @{@"name" : @"ABDOMINAL ROLLER", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 20"}, @{@"name" : @"OTIS-UPS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 20"}, @{@"name" : @"SUPERSET COMMANDO ROW with PULL-UPS", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 x 10(each side) and 4 x 10"}, @{@"name" : @"SUPER SET DUMBELL FLY with BARBELL BENCH", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 x 10 and 4 x 12"}, @{@"name" : @"SUPERSET T-BAR ROW with PULLOVERS", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 X 12 and 4 X 12"}, @{@"name" : @"SUPERSET INCLINE DUMBBELL PRESS(wide to close) with UNDERHAND DUMBBELL FLY", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 X 15 and 4 X 10"}, @{@"name" : @"SEATED DUMBBELL PRESS", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"4 x 10"}, @{@"name" : @"SUPERSET ALT. STANDING ARNOLD PRESS with  CABLE REVERSE FLY", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"4 x 12 and 4 x 15"}, @{@"name" : @"SUPERSET SINGLE ARM DUMBBELL LATERAL RAISE with FACE PULLS", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 10 and 3 x 15"}, @{@"name" : @"SUPERSET DUMBBELL SHRUGS  with FARMER WALK", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 15 and 3 x FAILURE"}, @{@"name" : @"REVERSE CRUNCHES", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 20"}, @{@"name" : @"WINDMILL", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 15(each side)"}, @{@"name" : @"SUPERSET REVERSE GRIP BENCH PRESS with REVERSE GRIP BENT-OVER ROW", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"4 x 12 and 4 x 12"}, @{@"name" : @"SUPERSET BARBELL SKULL CRUSHER with PREACHER BENCH BARBELL CURL", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 12 and 3 x 12"}, @{@"name" : @"TRICEPS DIPS", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 15"}, @{@"name" : @"HAMMER CURLS", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 12"}, @{@"name" : @"STANDING BEHIND THE BACK FINGER CURLS", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"4 x 15"}, @{@"name" : @"WRIST ROLLER", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 2 COMPLETE ROLLS"}, @{@"name" : @"SUPERSET GLUTE BRIDGES (WEIGHTED) with LYING HAMSTRING CURL", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS: HAMSTRINGS + CALVES + ABS", @"reps" : @"4 x 12 and 4 x 10"}, @{@"name" : @"ROMANIAN DEADLIFT (RDL)", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"4 x 12"}, @{@"name" : @"UNILATERAL RDL", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 12(each side)"}, @{@"name" : @"WEIGHTED DONKEY CALF RAISE", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 15"}, @{@"name" : @"STANDING CALF RAISE", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 20"}, @{@"name" : @"SUPERSET MOUNTAIN CLIMBER with PLANK", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 30 SECONDS and 3 X 30 SECONDS"}].mutableCopy;
    
    
    self.days = @[@"DAY 1: QUADS + CALVES + ABS", @"DAY 2: CHEST + BACK", @"DAY 3: SHOULDERS + TRAPS + ABS", @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"DAY 5: HAMSTRINGS + CALVES + ABS"];
    
    
    self.title = @"WEEK 7-9, PHASE 3";
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *workouts = [self itemAtIndexPath:indexPath];
    
    cell.textLabel.text = workouts[@"name"];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.text = workouts[@"reps"];
    //    NSLog(@"cell.textLabel.text %@", cell.textLabel.text);
    
    
    
    return cell;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.days[section];
}





@end
