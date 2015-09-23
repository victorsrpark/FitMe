//
//  WorkoutViewController.h
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 20..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
