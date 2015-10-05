//
//  ResultViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 9. 23..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "ResultViewController.h"
#import "SWRevealViewController.h"


@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *absImageView;
@property (weak, nonatomic) IBOutlet UIImageView *armsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *chestImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lowerbodyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shoulderImageView;

@end


@implementation ResultViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    _absImageView.image = [[UIImage imageNamed:@"abs.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    _armsImageView.image = [[UIImage imageNamed:@"arms.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    _backImageView.image = [[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    _chestImageView.image = [[UIImage imageNamed:@"chest.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    _lowerbodyImageView.image = [[UIImage imageNamed:@"lowerbody.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    _shoulderImageView.image = [[UIImage imageNamed:@"shoulders.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    
}

- (IBAction)resultButton:(id)sender
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger absfinished = [standardUserDefaults integerForKey:@"absfinished"];
    NSInteger absunfinished = [standardUserDefaults integerForKey:@"absunfinished"];
    
    NSInteger armsfinished = [standardUserDefaults integerForKey:@"armsfinished"];
    NSInteger armsunfinished = [standardUserDefaults integerForKey:@"armsunfinished"];
    
    NSInteger backfinished = [standardUserDefaults integerForKey:@"backfinished"];
    NSInteger backunfinished = [standardUserDefaults integerForKey:@"backunfinished"];
    
    NSInteger chestfinished = [standardUserDefaults integerForKey:@"chestfinished"];
    NSInteger chestunfinished = [standardUserDefaults integerForKey:@"chestunfinished"];
    
    NSInteger lowerbodyfinished = [standardUserDefaults integerForKey:@"lowerbodyfinished"];
    NSInteger lowerbodyunfinished = [standardUserDefaults integerForKey:@"lowerbodyunfinished"];
    
    NSInteger shouldersfinished = [standardUserDefaults integerForKey:@"shouldersfinished"];
    NSInteger shouldersunfinished = [standardUserDefaults integerForKey:@"shouldersunfinished"];
    

    UIImageRenderingMode renderingMode = UIImageRenderingModeAlwaysTemplate;
    
    _absImageView.image = [_absImageView.image imageWithRenderingMode:renderingMode];
    _armsImageView.image = [_armsImageView.image imageWithRenderingMode:renderingMode];
    _backImageView.image = [_backImageView.image imageWithRenderingMode:renderingMode];
    _chestImageView.image = [_chestImageView.image imageWithRenderingMode:renderingMode];
    _lowerbodyImageView.image = [_lowerbodyImageView.image imageWithRenderingMode:renderingMode];
    _shoulderImageView.image = [_shoulderImageView.image imageWithRenderingMode:renderingMode];
    
//abs image tint
    if (absfinished > absunfinished + 2) {
        [_absImageView setTintColor:[UIColor greenColor]];
    }else if (absfinished <= absunfinished + 2){
        [_absImageView setTintColor:[UIColor yellowColor]];
    }else if (absfinished <= absunfinished + 5){
        [_absImageView setTintColor:[UIColor redColor]];
    }
//arms image tint
    if (armsfinished > armsunfinished + 2) {
        [_armsImageView setTintColor:[UIColor greenColor]];
    }else if (absfinished <= absunfinished + 2){
        [_armsImageView setTintColor:[UIColor yellowColor]];
    }else if (absfinished <= absunfinished + 5){
        [_armsImageView setTintColor:[UIColor redColor]];
    }
//back image tint
    if (backfinished > backunfinished + 2) {
        [_backImageView setTintColor:[UIColor greenColor]];
    }else if (absfinished <= absunfinished + 2){
        [_backImageView setTintColor:[UIColor yellowColor]];
    }else if (absfinished <= absunfinished + 5){
        [_backImageView setTintColor:[UIColor redColor]];
    }
//chest image tint
    if (chestfinished > chestunfinished + 2) {
        [_chestImageView setTintColor:[UIColor greenColor]];
    }else if (absfinished <= absunfinished + 2){
        [_chestImageView setTintColor:[UIColor yellowColor]];
    }else if (absfinished <= absunfinished + 5){
        [_chestImageView setTintColor:[UIColor redColor]];
    }
//lowerbody image tint
    if (lowerbodyfinished > lowerbodyunfinished + 2) {
        [_lowerbodyImageView setTintColor:[UIColor greenColor]];
    }else if (absfinished <= absunfinished + 2){
        [_lowerbodyImageView setTintColor:[UIColor yellowColor]];
    }else if (absfinished <= absunfinished + 5){
        [_lowerbodyImageView setTintColor:[UIColor redColor]];
    }
//shoulders image tint
    if (shouldersfinished > shouldersunfinished + 2) {
        [_shoulderImageView setTintColor:[UIColor greenColor]];
    }else if (absfinished <= absunfinished + 2){
        [_shoulderImageView setTintColor:[UIColor yellowColor]];
    }else if (absfinished <= absunfinished + 5){
        [_shoulderImageView setTintColor:[UIColor redColor]];
    }
       

}

@end