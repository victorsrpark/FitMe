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

@interface W10_12WorkoutViewController ()

@property (nonatomic) NSMutableArray *workouts;

@property (nonatomic) NSArray *days;

@end

@implementation W10_12WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.workouts = @[@{@"name" : @"SUPERSET STRAIGHT ARM PULL DOWNS and PULL-UPS", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 15 and 4 x 12", @"body": @"back"}, @{@"name" : @"SUPERSET ALT. DUMBBELL PRESS and DUMBBELL WIDE TO CLOSE PRESS", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 10 and 4 x 8", @"body": @"chest"}, @{@"name" : @"SUPERSET FACE PULL and PENDLAY ROW", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 12 and 4 x 12", @"body": @"back"}, @{@"name" : @"SUPERSET CHEST DIPS and PULL OVER", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"4 x 15 and 4 x 12", @"body": @"chest"}, @{@"name" : @"HANGING LEG RAISE", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"3 x 15", @"body": @"abs"}, @{@"name" : @"BAND WOOD CHOPS", @"days" : @"DAY 1 : BACK + CHEST + ABS", @"reps" : @"3 x 15", @"body": @"abs"}, @{@"name" : @"SQUATS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"15, 10, 8, 4", @"body": @"quadriceps"}, @{@"name" : @"SUPERSET WALKING LUNGES and BARBELL HACK SQUATS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"4 x 20 and 4 x 15", @"body": @"quadriceps"}, @{@"name" : @"SUPERSET BARBELL RDL and MANUAL HAMSTRING CURLS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 12 and 3 x 12", @"body": @"hamstring"}, @{@"name" : @"SEATED CALF RAISE", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 20", @"body": @"calf"}, @{@"name" : @"OTIS UPS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 15", @"body": @"abs"}, @{@"name" : @"RUSSIAN TWISTS", @"days" : @"DAY 2 : LEGS + CALVES + ABS", @"reps" : @"3 x 10", @"body": @"abs"}, @{@"name" : @"SUPERSET SEATED BARBELL SHOULDER PRESS and ALT. UPRIGHT ROW", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"12, 10, 8, 6 and 4 x 12", @"body": @"shoulders"}, @{@"name" : @"SUPERSET FACE PULLS and BENT OVER FRONT/LATERAL/REVERSE RAISE", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 10 and 3 x 5", @"body": @"shoulders"}, @{@"name" : @"SUPERSET STEERING WHEELS and LATERAL RAISE", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 10 and 3 x 15", @"body": @"shoulders"}, @{@"name" : @"REAR SHRUGS", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"4 x 15", @"body": @"traps"}, @{@"name" : @"CABLE EXTERNAL ROTATIONS", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 12", @"body": @"shoulders"}, @{@"name" : @"SUPERSET WEIGHTED PLANKS and MOUNTAIN CLIMBERS", @"days" : @"DAY 3 : SHOULDERS + TRAPS + ABS", @"reps" : @"3 x 30 SEC  and 3 x 30 SEC", @"body": @"abs"}, @{@"name" : @"SUPERSET CLOSE GRIP BARBELL PRESS and WEIGHTED CHIN UPS", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"4 x 15 and 4 x 15", @"body": @"biceps"}, @{@"name" : @"SUPERSET BILATERAL KICKBACKS and PLATE PINCH REVERSE CURL", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 15  and 3 x 15", @"body": @"triceps"}, @{@"name" : @"SUPERSET SKULLCRUSHER AND BARBELL CURL", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 10  and 3 x 3 drop set until failure", @"body": @"biceps"}, @{@"name" : @"SEATED UNILATERAL FINGER CURL", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x 15", @"body": @"fore-arms"}, @{@"name" : @"WRIST ROLLER", @"days" : @"DAY 4 : TRICEPS + BICEPS + FOREARMS", @"reps" : @"3 x FAILURE", @"body": @"fore-arms"}, @{@"name" : @"BARBELL DEADLIFT", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"12, 8, 4, 2", @"body": @"back"}, @{@"name" : @"BARBELL BENCH", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"12, 8, 4, 2", @"body": @"chest"}, @{@"name" : @"SUPERSET DUMBBELL UNILATERAL ROW and DUMBBELL UNILATERAL PRESS", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 12 and 3 x 12", @"body": @"back"}, @{@"name" : @"SUPERSET BARBELL PULLOVER and DUMBELL FLYES", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 10 and 3 x 15", @"body": @"chest"}, @{@"name" : @"SUPERSET PULL-UPS and PUSH-UPS", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x FAILURE and 3 x FAILURE", @"body": @"back"}, @{@"name" : @"DOUBLE CRUNCH", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 15", @"body": @"abs"}, @{@"name" : @"OBLIQUE CRUNCH", @"days" : @"DAY 5 : BACK + CHEST + ABS", @"reps" : @"3 x 20", @"body": @"abs"}, @{@"name" : @"SUPERSET LEG PRESS and DUMBBELL SWINGS", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"15, 12, 10, 8 and 4 x 15", @"body": @"quadriceps"}, @{@"name" : @"SUPERSET BULGARIAN SPLIT SQUATS and UNILATERAL RDL", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10 and 3 x 10", @"body": @"quadriceps"}, @{@"name" : @"SUPERSET ARNOLD PRESS and SINGLE ARM BENT OVER LATERAL RAISE", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10 and 3 x 12", @"body": @"shoulders"}, @{@"name" : @"SUPERSET FARMER SQUATS and FARMER WALKS", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10 and 3 x 1 MINUTE", @"body": @"quadriceps"}, @{@"name" : @"SUPERSET REVERSE UPRIGHT ROW and PLATE FRONT RAISE", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 12 and 3 x 12", @"body": @"shoulders"}, @{@"name" : @"WEIGHTED CRUNCH", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 10", @"body": @"abs"}, @{@"name" : @"LYING LEG RAISE W/HIP THRUST", @"days" : @"DAY 6 : LEGS + SHOULDERS + ABS", @"reps" : @"3 x 15", @"body": @"abs"}].mutableCopy;
    
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

