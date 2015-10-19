//
//  ExerciseViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 20..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "ExerciseTutorialViewController.h"
#import "SWRevealViewController.h"

@interface ExerciseTutorialViewController ()

@end

@implementation ExerciseTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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



@end
