//
//  ResultViewController.m
//  FitMe
//
//  Created by Donald Seo on 2015. 9. 23..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "WorkoutResultViewController.h"
#import "SWRevealViewController.h"


@interface WorkoutResultViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *absImageView;
@property (weak, nonatomic) IBOutlet UIImageView *armsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *chestImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lowerbodyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shoulderImageView;
@property (nonatomic) NSMutableArray *GreenColors;
@property (nonatomic) NSMutableArray *RedColors;

@end


@implementation WorkoutResultViewController

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

    
    //creating array of color scale for red and green
    self.RedColors = [[NSMutableArray alloc] initWithObjects:
                     [UIColor colorWithRed:1.0 green:0.80 blue:0.80 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.75 blue:0.75 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.70 blue:0.70 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.65 blue:0.65 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.60 blue:0.60 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.55 blue:0.55 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.50 blue:0.50 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.45 blue:0.45 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.40 blue:0.40 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.35 blue:0.35 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.30 blue:0.30 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.25 blue:0.25 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.20 blue:0.20 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.15 blue:0.15 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.10 blue:0.10 alpha:1.0],
                     [UIColor colorWithRed:1.0 green:0.05 blue:0.05 alpha:1.0], nil];
    
    self.GreenColors = [[NSMutableArray alloc] initWithObjects:
                        [UIColor colorWithRed:0.80 green:1.0 blue:0.80 alpha:1.0],
                        [UIColor colorWithRed:0.75 green:1.0 blue:0.75 alpha:1.0],
                        [UIColor colorWithRed:0.70 green:1.0 blue:0.70 alpha:1.0],
                        [UIColor colorWithRed:0.65 green:1.0 blue:0.65 alpha:1.0],
                        [UIColor colorWithRed:0.60 green:1.0 blue:0.60 alpha:1.0],
                        [UIColor colorWithRed:0.55 green:1.0 blue:0.55 alpha:1.0],
                        [UIColor colorWithRed:0.50 green:1.0 blue:0.50 alpha:1.0],
                        [UIColor colorWithRed:0.45 green:1.0 blue:0.45 alpha:1.0],
                        [UIColor colorWithRed:0.40 green:1.0 blue:0.40 alpha:1.0],
                        [UIColor colorWithRed:0.35 green:1.0 blue:0.35 alpha:1.0],
                        [UIColor colorWithRed:0.30 green:1.0 blue:0.30 alpha:1.0],
                        [UIColor colorWithRed:0.25 green:1.0 blue:0.25 alpha:1.0],
                        [UIColor colorWithRed:0.20 green:1.0 blue:0.20 alpha:1.0],
                        [UIColor colorWithRed:0.15 green:1.0 blue:0.15 alpha:1.0],
                        [UIColor colorWithRed:0.10 green:1.0 blue:0.10 alpha:1.0],
                        [UIColor colorWithRed:0.05 green:1.0 blue:0.05 alpha:1.0], nil];
    

 
}

- (IBAction)resetButton:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
    UIImageRenderingMode renderingMode = UIImageRenderingModeAutomatic;
    _absImageView.image = [_absImageView.image imageWithRenderingMode:renderingMode];
    _armsImageView.image = [_armsImageView.image imageWithRenderingMode:renderingMode];
    _backImageView.image = [_backImageView.image imageWithRenderingMode:renderingMode];
    _chestImageView.image = [_chestImageView.image imageWithRenderingMode:renderingMode];
    _lowerbodyImageView.image = [_lowerbodyImageView.image imageWithRenderingMode:renderingMode];
    _shoulderImageView.image = [_shoulderImageView.image imageWithRenderingMode:renderingMode];

}

- (IBAction)resultButton:(id)sender
{
//    float INCREMENT = 0.05;
////    for (CGFloat greenblue = 0.80; greenblue > 0.0f; greenblue -= INCREMENT) {
////        UIColor *Redcolor = [UIColor colorWithRed:1.00 green:greenblue blue:greenblue alpha:1.0];
////        
////        [self.RedColors addObject:Redcolor];
////        NSLog(@"green blue float value: %@", [self.RedColors objectAtIndex:0]);
////    }
//    
//    
//    
//    for (CGFloat redblue = 0.80; redblue > 0.0f; redblue -= INCREMENT) {
//        UIColor *Greencolor = [UIColor colorWithRed:redblue
//                                              green:1.00
//                                               blue:redblue
//                                              alpha:1.0];
//        [self.GreenColors addObject:Greencolor];
//    }
//    
    
    
    
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
    if ((absfinished - absunfinished) >= 16) {
        [_absImageView setTintColor:[UIColor greenColor]];
    }else if ((absfinished - absunfinished) > 0 && (absfinished - absunfinished) < 16) {
        [_absImageView setTintColor:[self.GreenColors objectAtIndex:(absfinished - absunfinished)]];
    }else if ((absfinished - absunfinished) == 0){
        [_absImageView setTintColor:[UIColor yellowColor]];
    }else if ((absfinished - absunfinished) < 0 && (absfinished - absunfinished) > -16){
        [_absImageView setTintColor:[self.RedColors objectAtIndex:(absfinished - absunfinished) * -1]];
    }else {
        [_absImageView setTintColor:[UIColor redColor]];
    }
//arms image tint
    if ((armsfinished - armsunfinished) >= 16) {
        [_armsImageView setTintColor:[UIColor greenColor]];
    }else if ((armsfinished - armsunfinished) > 0 && (armsfinished - armsunfinished) < 16) {
        [_armsImageView setTintColor:[self.GreenColors objectAtIndex:(backfinished - armsunfinished)]];
    }else if ((armsfinished - armsunfinished) == 0){
        [_armsImageView setTintColor:[UIColor yellowColor]];
    }else if ((armsfinished - armsunfinished) < 0 && (armsfinished - armsunfinished) > -16){
        [_armsImageView setTintColor:[self.RedColors objectAtIndex:(armsfinished - armsunfinished) * -1]];
    }else {
        [_armsImageView setTintColor:[UIColor redColor]];
    }
//back image tint
    if ((backfinished - backunfinished) >= 16) {
        [_backImageView setTintColor:[UIColor greenColor]];
    }else if ((backfinished - backunfinished) > 0 && (backfinished - backunfinished) < 16) {
        [_backImageView setTintColor:[self.GreenColors objectAtIndex:(backfinished - backunfinished)]];
    }else if ((backfinished - backunfinished) == 0){
        [_backImageView setTintColor:[UIColor yellowColor]];
    }else if ((backfinished - backunfinished) < 0 && (backfinished - backunfinished) > -16){
        [_backImageView setTintColor:[self.RedColors objectAtIndex:(backfinished - backunfinished) * -1]];
    }else {
        [_backImageView setTintColor:[UIColor redColor]];
    }
//chest image tint
    if ((chestfinished - chestunfinished) >= 16) {
        [_chestImageView setTintColor:[UIColor greenColor]];
    }else if ((chestfinished - chestunfinished) > 0 && (chestfinished - chestunfinished) < 16) {
        [_chestImageView setTintColor:[self.GreenColors objectAtIndex:(chestfinished - chestunfinished)]];
    }else if ((chestfinished - chestunfinished) == 0){
        [_chestImageView setTintColor:[UIColor yellowColor]];
    }else if ((chestfinished - chestunfinished) < 0 && (chestfinished - chestunfinished) > -16){
        [_chestImageView setTintColor:[self.RedColors objectAtIndex:(chestfinished - chestunfinished) * -1]];
    }else {
        [_chestImageView setTintColor:[UIColor redColor]];
    }
//lowerbody image tint
    if ((lowerbodyfinished - lowerbodyunfinished) >= 16) {
        [_lowerbodyImageView setTintColor:[UIColor greenColor]];
    }else if ((lowerbodyfinished - lowerbodyunfinished) > 0 && (lowerbodyfinished - lowerbodyunfinished) < 16) {
        [_lowerbodyImageView setTintColor:[self.GreenColors objectAtIndex:(lowerbodyfinished - lowerbodyunfinished)]];
    }else if ((lowerbodyfinished - lowerbodyunfinished) == 0){
        [_lowerbodyImageView setTintColor:[UIColor yellowColor]];
    }else if ((lowerbodyfinished - lowerbodyunfinished) < 0 && (lowerbodyfinished - lowerbodyunfinished) > -16){
        [_lowerbodyImageView setTintColor:[self.RedColors objectAtIndex:(lowerbodyfinished - lowerbodyunfinished) * -1]];
    }else {
        [_lowerbodyImageView setTintColor:[UIColor redColor]];
    }
//shoulders image tint
    if ((shouldersfinished - shouldersunfinished) >= 16) {
        [_shoulderImageView setTintColor:[UIColor greenColor]];
    }else if ((shouldersfinished - shouldersunfinished) > 0 && (shouldersfinished - shouldersunfinished) < 16) {
        [_shoulderImageView setTintColor:[self.GreenColors objectAtIndex:(shouldersfinished - shouldersunfinished)]];
    }else if ((shouldersfinished - shouldersunfinished) == 0){
        [_shoulderImageView setTintColor:[UIColor yellowColor]];
    }else if ((shouldersfinished - shouldersunfinished) < 0 && (shouldersfinished - shouldersunfinished) > -16){
        [_shoulderImageView setTintColor:[self.RedColors objectAtIndex:(shouldersfinished - shouldersunfinished) * -1]];
    }else {
        [_shoulderImageView setTintColor:[UIColor redColor]];
    }
    



       

}

@end