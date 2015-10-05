//
//  W7_9WorkoutViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 27..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "W7_9WorkoutViewController.h"
#import "SWRevealViewController.h"
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"
#import "Singleton.h"

@interface W7_9WorkoutViewController ()

@property (nonatomic) NSMutableArray *workouts;

@property (nonatomic) NSArray *days;

@end

@implementation W7_9WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"SUPERSET SQUATS with SPLIT SQUAT TWISTS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"4 x 10 and 4 x 10 (each side)", @"body": @"quadriceps"}, @{@"name" : @"SINGLE LEG PRESS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 15", @"body": @"quadriceps"}, @{@"name" : @"SUPERSET SINGLE LEG HIP EXTENSION with GOBLET SQUATS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"4 x 10 and 4 x 15", @"body": @"quadriceps"}, @{@"name" : @"SINGLE LEG CALF RAISE", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 15(each side)", @"body": @"calf"}, @{@"name" : @"ABDOMINAL ROLLER", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 20", @"body": @"abs"}, @{@"name" : @"OTIS-UPS", @"days" : @"DAY 1: QUADS + CALVES + ABS", @"reps" : @"3 x 20", @"body": @"abs"}, @{@"name" : @"SUPERSET COMMANDO ROW with PULL-UPS", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 x 10(each side) and 4 x 10", @"body": @"back"}, @{@"name" : @"SUPER SET DUMBELL FLY with BARBELL BENCH", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 x 10 and 4 x 12", @"body": @"chest"}, @{@"name" : @"SUPERSET T-BAR ROW with PULLOVERS", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 X 12 and 4 X 12", @"body": @"back"}, @{@"name" : @"SUPERSET INCLINE DUMBBELL PRESS(wide to close) with UNDERHAND DUMBBELL FLY", @"days" : @"DAY 2: CHEST + BACK", @"reps" : @"4 X 15 and 4 X 10", @"body": @"chest"}, @{@"name" : @"SEATED DUMBBELL PRESS", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"4 x 10", @"body": @"shoulders"}, @{@"name" : @"SUPERSET ALT. STANDING ARNOLD PRESS with  CABLE REVERSE FLY", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"4 x 12 and 4 x 15", @"body": @"shoulders"}, @{@"name" : @"SUPERSET SINGLE ARM DUMBBELL LATERAL RAISE with FACE PULLS", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 10 and 3 x 15", @"body": @"shoulders"}, @{@"name" : @"SUPERSET DUMBBELL SHRUGS  with FARMER WALK", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 15 and 3 x FAILURE", @"body": @"traps"}, @{@"name" : @"REVERSE CRUNCHES", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 20", @"body": @"abs"}, @{@"name" : @"WINDMILL", @"days" : @"DAY 3: SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 15(each side)", @"body": @"abs"}, @{@"name" : @"SUPERSET REVERSE GRIP BENCH PRESS with REVERSE GRIP BENT-OVER ROW", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"4 x 12 and 4 x 12", @"body": @"biceps"}, @{@"name" : @"SUPERSET BARBELL SKULL CRUSHER with PREACHER BENCH BARBELL CURL", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 12 and 3 x 12", @"body": @"triceps"}, @{@"name" : @"TRICEPS DIPS", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 15", @"body": @"triceps"}, @{@"name" : @"HAMMER CURLS", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 12", @"body": @"biceps"}, @{@"name" : @"STANDING BEHIND THE BACK FINGER CURLS", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"4 x 15", @"body": @"fore-arms"}, @{@"name" : @"WRIST ROLLER", @"days" : @"DAY 4: TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 2 COMPLETE ROLLS", @"body": @"fore-arms"}, @{@"name" : @"SUPERSET GLUTE BRIDGES (WEIGHTED) with LYING HAMSTRING CURL", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS: HAMSTRINGS + CALVES + ABS", @"reps" : @"4 x 12 and 4 x 10", @"body": @"hamstring"}, @{@"name" : @"ROMANIAN DEADLIFT (RDL)", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"4 x 12", @"body": @"hamstring"}, @{@"name" : @"UNILATERAL RDL", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 12(each side)", @"body": @"hamstring"}, @{@"name" : @"WEIGHTED DONKEY CALF RAISE", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 15", @"body": @"calf"}, @{@"name" : @"STANDING CALF RAISE", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 20", @"body": @"calf"}, @{@"name" : @"SUPERSET MOUNTAIN CLIMBER with PLANK", @"days" : @"DAY 5: HAMSTRINGS + CALVES + ABS", @"reps" : @"3 x 30 SECONDS and 3 X 30 SECONDS", @"body": @"abs"}].mutableCopy;
    
    
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
    
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
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
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"Y" backgroundColor:[UIColor greenColor] callback:^BOOL(MGSwipeTableCell *sender) {
        if ([workouts[@"body"] isEqualToString:@"chest"]) {
            if (![standardUserDefaults integerForKey:@"chestfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"chestfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"chestfinished"] + 1 forKey:@"chestfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"shoulders"]) {
            if (![standardUserDefaults integerForKey:@"shouldersfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"shouldersfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"shouldersfinished"] + 1 forKey:@"shouldersfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"back"] || [workouts[@"body"] isEqualToString:@"traps"]) {
            if (![standardUserDefaults integerForKey:@"backfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"backfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"backfinished"] + 1 forKey:@"backfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"glute"] || [workouts[@"body"] isEqualToString:@"quadriceps"] || [workouts[@"body"] isEqualToString:@"calf"]) {
            if (![standardUserDefaults integerForKey:@"lowerbodyfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"lowerbodyfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"lowerbodyfinished"] + 1 forKey:@"lowerbodyfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"abs"]) {
            if (![standardUserDefaults integerForKey:@"absfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"absfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"absfinished"] + 1 forKey:@"absfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"biceps"] || [workouts[@"body"] isEqualToString:@"triceps"] || [workouts[@"body"] isEqualToString:@"fore-arms"]) {
            if (![standardUserDefaults integerForKey:@"armsfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"armsfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"armsfinished"] + 1 forKey:@"armsfinished"];
            }
        }
        [standardUserDefaults synchronize];
        return 0;
    }]];
    cell.leftSwipeSettings.transition = MGSwipeTransition3D;
    
    
    
    //configure right buttons
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"X" backgroundColor:[UIColor redColor] callback:^BOOL(MGSwipeTableCell *sender) {
        if ([workouts[@"body"] isEqualToString:@"chest"]) {
            if (![standardUserDefaults integerForKey:@"chestunfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"chestunfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"chestunfinished"] + 1 forKey:@"chestunfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"shoulders"]) {
            if (![standardUserDefaults integerForKey:@"shouldersunfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"shouldersunfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"shouldersunfinished"] + 1 forKey:@"shouldersunfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"back"] || [workouts[@"body"] isEqualToString:@"traps"]) {
            if (![standardUserDefaults integerForKey:@"backunfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"backunfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"backunfinished"] + 1 forKey:@"backunfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"glute"] || [workouts[@"body"] isEqualToString:@"quadriceps"] || [workouts[@"body"] isEqualToString:@"calf"]) {
            if (![standardUserDefaults integerForKey:@"lowerbodyunfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"lowerbodyunfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"lowerbodyunfinished"] + 1 forKey:@"lowerbodyunfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"abs"]) {
            if (![standardUserDefaults integerForKey:@"absunfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"absunfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"absunfinished"] + 1 forKey:@"absunfinished"];
            }
        }else if ([workouts[@"body"] isEqualToString:@"biceps"] || [workouts[@"body"] isEqualToString:@"triceps"] || [workouts[@"body"] isEqualToString:@"fore-arms"]) {
            if (![standardUserDefaults integerForKey:@"armsunfinished"]) {
                [standardUserDefaults setInteger:1  forKey:@"armsunfinished"];
            } else{
                [standardUserDefaults setInteger:[standardUserDefaults integerForKey:@"armsunfinished"] + 1 forKey:@"armsunfinished"];
            }
        }
        [standardUserDefaults synchronize];
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

//
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

