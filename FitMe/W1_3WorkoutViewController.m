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
    self.workouts = @[@{@"name" : @"SQUATS", @"days" : @"DAY 1", @"reps": @"15, 12, 10, 8, 6", @"body": @"quadriceps"}, @{@"name" : @"BENT OVER ROWS", @"days" : @"DAY 1", @"reps": @"12, 10, 8, 6, 6", @"body": @"back"}, @{@"name" : @"BENCH PRESS", @"days" : @"DAY 1", @"reps": @"15, 12, 10, 8, 6", @"body": @"chest"}, @{@"name" : @"OVERHEAD PRESS", @"days" : @"DAY 1", @"reps": @"12, 10, 8, 6, 6", @"body": @"shoulders"}, @{@"name" : @"EXTERNAL ROTATIONS", @"days" : @"DAY 1", @"reps": @"3 x 12", @"body": @"shoulders"}, @{@"name" : @"SEATED CALF RAISES", @"days" : @"DAY 1", @"reps": @"3 x 15", @"body": @"calf"}, @{@"name" : @"MOUNTAIN CLIMBERS", @"days" : @"DAY 1", @"reps": @"3 x 30 SECONDS", @"body": @"abs"}, @{@"name" : @"PLANKS", @"days" : @"DAY 1", @"reps": @"3 x 30 SECONDS", @"body": @"abs"}, @{@"name" : @"DEADLIFT", @"days" : @"DAY 2", @"reps": @"15, 12, 10, 8, 6", @"body": @"back"}, @{@"name" : @"KNEELING LANDMINE PRESS", @"days" : @"DAY 2", @"reps": @"15, 12, 10, 8, 8", @"body": @"chest"}, @{@"name" : @"ALT. ARNOLD PRESS", @"days" : @"DAY 2", @"reps": @"12, 10, 8, 8, 6", @"body": @"shoulders"}, @{@"name" : @"ALT. FRONT LUNGE", @"days" : @"DAY 2", @"reps": @"5 x 10", @"body": @"quadriceps"}, @{@"name" : @"PULL OVER", @"days" : @"DAY 2", @"reps": @"3 x 15", @"body": @"chest"}, @{@"name" : @"WEIGHTED CRUNCHES", @"days" : @"DAY 2", @"reps": @"3 x 15", @"body": @"abs"}, @{@"name" : @"SIDE PLANKS", @"days" : @"DAY 2", @"reps": @"3 x 30 SECONDS", @"body": @"abs"}, @{@"name" : @"FRONT SQUAT", @"days" : @"DAY 3", @"reps": @"15, 12, 10, 8, 6", @"body": @"quadriceps"}, @{@"name" : @"T-BAR ROW", @"days" : @"DAY 3", @"reps": @"12, 10, 8, 8, 6", @"body": @"back"}, @{@"name" : @"DIPS", @"days" : @"DAY 3", @"reps": @"5 x 15", @"body": @"chest"}, @{@"name" : @"UPRIGHT ROW", @"days" : @"DAY 3", @"reps": @"15, 12, 10, 8, 8", @"body": @"shoulers"}, @{@"name" : @"GLUTE BRIDGES (WEIGHTED)", @"days" : @"DAY 3", @"reps": @"3 x 10", @"body": @"glute"}, @{@"name" : @"STANDING CALF RAISES", @"days" : @"DAY 3", @"reps": @"3 x 15", @"body": @"calf"}, @{@"name" : @"RUSSIAN TWIST", @"days" : @"DAY 3", @"reps": @"3 x 30 (15 EACH SIDE)", @"body": @"abs"}].mutableCopy;
    
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
        NSInteger finishedchest = [standardUserDefaults integerForKey:@"chestfinished"];
        NSInteger finishedabs = [standardUserDefaults integerForKey:@"absfinished"];
        NSInteger finishedarm = [standardUserDefaults integerForKey:@"armsfinished"];
        NSInteger finishedback = [standardUserDefaults integerForKey:@"backfinished"];
        
        NSLog(@"chest count = %li", (long)finishedchest);
        NSLog(@"abs count = %li", (long)finishedabs);
        NSLog(@"arms count = %li", (long)finishedarm);
        NSLog(@"back count = %li", (long)finishedback);
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

    
    //cell.leftExpansion.buttonIndex = leftExpandableIndex;
    
    
    
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

