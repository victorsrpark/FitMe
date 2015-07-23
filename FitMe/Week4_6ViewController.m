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
@property (nonatomic) NSArray *reps;
@property (nonatomic) NSArray *days;

@end

@implementation Week4_6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"BARBELL PRESS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"KNEELING LANDMINE PRESS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"UNDER HAND DUMBBELL FLY", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"DIPS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"SKULL CRUSHERS", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"LANDMINE 180’S", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"ABDOMINAL ROLLER", @"days" : @"DAY 1: CHEST + TRICEPS + ABS"}, @{@"name" : @"PENDLAY ROW", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"DEADLIFT", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"SINGLE ARM DUMBBELL ROW", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"GOOD MORNINGS", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"PULL UPS", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"BARBELL CURLS", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"ZOTTMAN CURLS", @"days" : @"DAY 2: BACK + BICEPS"}, @{@"name" : @"SUPERSET SQUATS with JUMPING SPLIT SQUATS", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"GLUTE BRIDGES (WEIGHTED)", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"OVERHEAD BULGARIAN SQUATS (WEIGHTED)", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"LYING HAMSTRING CURLS", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"SEATED CALF RAISES", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"DONKEY CALF RAISE", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"WEIGHTED PLANK", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"PLYOMETRIC SIT-UPS", @"days" : @"DAY 3: LEGS + CALVES + ABS"}, @{@"name" : @"CUBAN PRESS (LIGHT WEIGHT)", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"OVERHEAD PRESS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"SINGLE ARM DUMBBELL PRESS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"LYING DUMBBELL LATERAL RAISE", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"BENT OVER REVERSE FLY", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"BARBELL SHRUGS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"FINGER CURLS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}, @{@"name" : @"REVERSE CURLS", @"days" : @"DAY 4: SHOULDERS + TRAPS + FORE- ARMS"}].mutableCopy;
    
    self.reps = @[@"12, 10, 8, 6", @"4 X 12", @"4 X 12", @"3 X 20", @"3 X 10", @"3 X 20", @"3 X 15", @"4 X 12", @"12, 8, 6, 2", @"4 X 12", @"3 X 12", @"3 X FAILURE", @"3 X 10", @"3 X FAILURE", @"4 X 12 and 4 X 20", @"4 X 12", @"4 X 10", @"4 X 12", @"3 X 20", @"3 X 15", @"3 X 30 SECONDS", @"3 X 20", @"3 X 12", @"12, 10, 8, 6", @"4 X 12", @"3 X 12", @"3 X 12", @"15, 12, 10, 8", @"3 X 15", @"3 X 15"];
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
    cell.detailTextLabel.text = [_reps objectAtIndex:indexPath.row];
    //NSLog(@"cell.detailtextLabel.text %@", cell.detailTextLabel.text);
    
    
    
    return cell;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.days[section];
}





@end
