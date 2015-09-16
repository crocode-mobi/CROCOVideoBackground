//
//  CROCOSplashViewController.m
//  CROCOVideoBackground
//
//  Created by Pb on 16/9/15.
//  Copyright (c) 2015 pb.ojeda. All rights reserved.
//

#import "CROCOSplashViewController.h"


// Utils
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CROCOSplashViewController ()

@end

@implementation CROCOSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColorFromRGB(0x2BAF2B)];
    [self performSelector:@selector(redirectToCorrectView) withObject:nil afterDelay:1.5];
}


- (void) redirectToCorrectView {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"CROCOViewController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:vc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
