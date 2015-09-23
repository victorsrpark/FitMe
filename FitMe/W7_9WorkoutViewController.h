//
//  W7_9WorkoutViewController.h
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 27..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"

@interface W7_9WorkoutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
