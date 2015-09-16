//
//  CROCOViewController.m
//  CROCOVideoBackground
//
//  Created by pb.ojeda on 09/16/2015.
//  Copyright (c) 2015 pb.ojeda. All rights reserved.
//

#import "CROCOViewController.h"

#import <CROCOVideoBackground.h>

// Utils
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CROCOViewController ()

@end

@implementation CROCOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.label setBackgroundColor:UIColorFromRGB(0x2BAF2B)];
    [self.label setTextColor:[UIColor whiteColor]];
    
    
    [self.viewBackgroundVideo setBackGroundVideo:@"video" withRepeat:YES withOverlayColor:[UIColor blackColor] andAlpha:0.6];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.viewBackgroundVideo pause];
    [self.viewBackgroundVideo stop];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
