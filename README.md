# CROCOVideoBackground

# Introduction

Simple Objective C category for Video Backgrounds.
CROCOVideoBackground class is a Objective C category that expand from UIView. It provides a simple way to put a video Background into UIView. The class is designed to make it quick and easy show videos, play and stop it. Videos should be .mp4 formats.

# Installation

## Cocoapods

Install Cocoapods if need it

```bash
$ gem install cocoapods
```

Add CROCOValidationForms in your `Podfile`

```bash
pod 'CROCOVideoBackground'
```

Then, run the following command

```bash
$ pod install
```

## Manual

Copy CROCOVideoBackground.h and CROCOVideoBackground.m to your project. That's it.

# Usage

It's is very easy. Just use it like a new feature of a UIView.

## Methods

```objective-c

// Setup methods
/*
 * FULL SCREEN Video Background with Background Mode None.
 * Apply on ViewDidLoad
 */
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha;

/*
 * FULL SCREEN Video Background with Background Mode Custom
 * Apply on ViewDidLoad
 */
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha andBackgroundScalingMode:(CROCOVideoBackgroundModes) backgroundMode;

/*
 * FULL SCREEN Video Background with Background Mode Custom and Custom Frame
 * IMPORTANT: Apply on ViewDidAppear
 */
- (void) setBackGroundVideo:(NSString *)videoPath withRepeat:(BOOL)repeat withOverlayColor:(UIColor *)color andAlpha:(CGFloat)alpha andBackgroundScalingMode:(CROCOVideoBackgroundModes) backgroundMode andFrame:(CGRect)frame;

// Interaction methods if needed
- (void)play;
- (void)stop;
- (void)pause;
- (void)restart;

```

## Example Code

```objective-c

[self.viewVideoBackground setBackGroundVideo:@"CrocoVideo" withRepeat:YES withOverlayColor:[UIColor blackColor] andAlpha:0.7 andBackgroundScalingMode:CROCOVideoBackgroundModeAspectFill];

```
## Tipe of scaling


```objective-c
typedef NS_ENUM(NSInteger, CROCOVideoBackgroundModes) {
    CROCOVideoBackgroundModeNone,       // No scaling
    CROCOVideoBackgroundModeAspectFit,  // Uniform scale until one dimension fits
    CROCOVideoBackgroundModeAspectFill, // Uniform scale until the movie fills the visible bounds. One dimension may have clipped contents
    CROCOVideoBackgroundModeFill        // Non-uniform scale. Both render dimensions will exactly match the visible bounds
};
```


