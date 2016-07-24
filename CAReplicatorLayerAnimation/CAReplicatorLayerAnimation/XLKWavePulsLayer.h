//
//  XLKWavePulsLayer.h
//  askLocal
//
//  Created by WP on 16/6/21.
//  Copyright © 2016年 xianlvke. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface XLKWavePulsLayer : CAReplicatorLayer
/**
 *	The default value of this property is @c 100pt.
 */
@property (nonatomic, assign) CGFloat radius;

/**
 *	The default value of this property is @c 0.0.
 */
@property (nonatomic, assign) CGFloat fromValueForRadius;

/**
 *	The default value of this property is @c 0.45.
 */
@property (nonatomic, assign) CGFloat fromValueForAlpha;

/**
 *	The value of this property should be ranging from @c 0 to @c 1 (exclusive).
 *
 *	The default value of this property is @c 0.2.
 */
@property (nonatomic, assign) CGFloat keyTimeForHalfOpacity;

/**
 *	The animation duration in seconds.
 *
 *	The default value of this property is @c 3.
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *	The animation interval in seconds.
 *
 *	The default value of this property is @c 0.
 */
@property (nonatomic, assign) NSTimeInterval pulseInterval;

/**
 *	The default value of this property is @c INFINITY.
 */
@property (nonatomic, assign) float repeatCount;

/**
 *	The default value of this property is @c YES.
 */
@property (nonatomic, assign) BOOL useTimingFunction;

/**
 *	The default value of this property is @c 5.
 */
@property (nonatomic, assign) NSInteger haloLayerNumber;

/**
 *	The animation delay in seconds.
 *
 *	The default value of this property is @c 1.
 */
@property (nonatomic, assign) NSTimeInterval startInterval;


- (void)start;

@end
