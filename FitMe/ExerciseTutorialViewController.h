//
//  ExerciseViewController.h
//  FitMe
//
//  Created by Donald Seo on 2015. 7. 20..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseTutorialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;
@end
