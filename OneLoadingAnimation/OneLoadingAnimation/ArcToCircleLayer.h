//
//  ArcToCircleLayer.h
//  OneLoadingAnimation
//
//  Created by WP on 16/2/18.
//  Copyright © 2016年 xianlvke. All rights reserved.
/*
 CA动画来修改progress的值
 self.arcToCircleLayer.progress = 1; // end status
 
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
 animation.duration = 5;
 animation.fromValue = @0.0;
 animation.toValue = @1.0;
 [self.arcToCircleLayer addAnimation:animation forKey:nil];
 
 这样当CA动画执行时，progress值会不断变化，从而触发drawInContext:重绘，实现动画。
 （第一句代码是为了让动画结束时，停留在动画结束时的状态。
 简单的说，动画执行时改变的是presentation Layer的值，model Layer的值不会变化，
 动画结束后会显示model Layer的值，因为model Layer的值没有变化，看上去就是直接跳回了动画开始时的值，上面第一句代码的作用就是将model Layer的值修改为动画结束时的值。
 */

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface ArcToCircleLayer : CALayer

@property (nonatomic, assign)CGFloat progress;

// 第4 步中加入
@property (nonatomic) UIColor *color;
@property (nonatomic) CGFloat lineWidth;

@end
