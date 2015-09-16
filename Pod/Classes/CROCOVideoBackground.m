//
//  UIView+VideoBackground.m
//  veinticuatro7
//
//  Created by Pb on 11/3/15.
//  Copyright (c) 2015 crocode. All rights reserved.
//

#import "CROCOVideoBackground.h"

// Utils
#import <MediaPlayer/MediaPlayer.h>

#define CROCO_SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define CROCO_SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)

@implementation UIView (VideoBackground)

MPMoviePlayerController *moviePlayer;
BOOL shouldReplay;
BOOL wantReplay;

#pragma mark -
#pragma mark - configure methods
/*
 * FULL SCREEN Video Background with Background Mode None.
 * Apply on ViewDidLoad
 */
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha {
    
    [self setBackGroundVideo:videoPath withRepeat:repeat withOverlayColor:color andAlpha:alpha andBackgroundScalingMode:CROCOVideoBackgroundModeNone];
}

/*
 * FULL SCREEN Video Background with Background Mode Custom
 * Apply on ViewDidLoad
 */
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha andBackgroundScalingMode:(CROCOVideoBackgroundModes) backgroundMode {
    
    [self setBackGroundVideo:videoPath withRepeat:repeat withOverlayColor:color andAlpha:alpha andBackgroundScalingMode:backgroundMode andFrame:CGRectMake(0, 0, CROCO_SCREEN_WIDTH, CROCO_SCREEN_HEIGHT)];
}

/*
 * FULL SCREEN Video Background with Background Mode Custom and Custom Frame
 * IMPORTANT: Apply on ViewDidAppear
 */
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha andBackgroundScalingMode:(CROCOVideoBackgroundModes) backgroundMode andFrame:(CGRect)frame {
    
    wantReplay = repeat;
    
    // find movie file
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:videoPath ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    
    moviePlayer.view.backgroundColor = [UIColor whiteColor];
    
    // load movie
    moviePlayer                     = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    [moviePlayer prepareToPlay];
    moviePlayer.controlStyle        = MPMovieControlStyleNone;
    moviePlayer.view.frame          = frame;
    moviePlayer.fullscreen          = YES;
    moviePlayer.scalingMode         = (MPMovieScalingMode)backgroundMode;
    [self addSubview:moviePlayer.view];
    
    if (color != nil) {
        [self setImageOverlayWithColor:color andAlpha:alpha];
    }
    
    if (repeat) {
        // loop movie
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(replayMovie:)
                                                     name: MPMoviePlayerPlaybackDidFinishNotification
                                                   object: moviePlayer];
        shouldReplay = YES;
    }
}

#pragma mark -
#pragma mark - Private Methods
- (void) setImageOverlayWithColor:(UIColor *)color andAlpha:(CGFloat)alpha {

    UIImageView *imageOverlay = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CROCO_SCREEN_WIDTH, CROCO_SCREEN_HEIGHT)];
    [imageOverlay setBackgroundColor:color];
    [imageOverlay setAlpha:alpha];
    [self addSubview:imageOverlay];
}

#pragma mark -
#pragma mark - moviePlayerOptions
-(void)replayMovie:(NSNotification *)notification
{
    if (shouldReplay) {
        [moviePlayer play];
    }
}

#pragma mark -
#pragma mark - Video controls
- (void)play {
    if (wantReplay) {
        shouldReplay = YES;
    }
    [moviePlayer play];
}

- (void)stop {
    shouldReplay = NO;
    [moviePlayer stop];
}

- (void)pause {
    [moviePlayer pause];
}

- (void)restart {
    [moviePlayer stop];
    if (wantReplay) {
        shouldReplay = YES;
    }
    [moviePlayer play];
}


@end
