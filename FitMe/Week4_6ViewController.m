//
//  Week4-6ViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 21..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "Week4_6ViewController.h"
#import "SWRevealViewController.h"

@interface Week4_6ViewController ()

@property (nonatomic) NSMutableArray *workouts;

@property (nonatomic) NSArray *days;

@end

@implementation Week4_6ViewController

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *workouts = [self itemAtIndexPath:indexPath];
    
    cell.textLabel.text = workouts[@"name"];
    cell.detailTextLabel.text = workouts[@"reps"];
    //NSLog(@"cell.detailtextLabel.text %@", cell.detailTextLabel.text);
    
    
    
    return cell;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.days[section];
}





@end
