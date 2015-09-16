//
//  UIView+VideoBackground.h
//
//
//  Created by Pablo Ojeda y Roberto Marco on 11/3/15.
//  Copyright (c) 2015 crocode. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, CROCOVideoBackgroundModes) {
    CROCOVideoBackgroundModeNone,       // No scaling
    CROCOVideoBackgroundModeAspectFit,  // Uniform scale until one dimension fits
    CROCOVideoBackgroundModeAspectFill, // Uniform scale until the movie fills the visible bounds. One dimension may have clipped contents
    CROCOVideoBackgroundModeFill        // Non-uniform scale. Both render dimensions will exactly match the visible bounds
};


@interface UIView (VideoBackground)


// Setup methods
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha;
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha andBackgroundScalingMode:(CROCOVideoBackgroundModes) backgroundMode;
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha andBackgroundScalingMode:(CROCOVideoBackgroundModes) backgroundMode andFrame:(CGRect)frame;

// Interaction methods if needed
- (void)play;
- (void)stop;
- (void)pause;
- (void)restart;

@end
