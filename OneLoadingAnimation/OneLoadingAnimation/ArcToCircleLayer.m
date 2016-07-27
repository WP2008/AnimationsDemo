//
//  ArcToCircleLayer.m
//  OneLoadingAnimation
//
//  Created by WP on 16/2/18.
//  Copyright © 2016年 xianlvke. All rights reserved.
//

#import "ArcToCircleLayer.h"


static CGFloat const kLineWidth = 6;

@implementation ArcToCircleLayer

/** Property methods. **/
@dynamic progress;
@dynamic color;
@dynamic lineWidth;
/* CALayer implements the standard NSKeyValueCoding protocol for all
 * Objective C properties defined by the class and its subclasses. It
 * dynamically implements missing accessor methods for properties
 * declared by subclasses.
 */

//这样当progress的值改变的时候，CALayer会标记自己为需要重绘
//Animations changing the value of the attribute also trigger redisplay.
+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else if ([key isEqualToString:@"color"]) {
        return YES;
    } else if ([key isEqualToString:@"lineWidth"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}
//如果我们重写了drawInContext:方法，
//系统就会在适当的时候调用drawInContext:重绘Layer；
- (void)drawInContext:(CGContextRef)ctx {
    UIBezierPath *path = [UIBezierPath bezierPath];

    CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)/2 -  kLineWidth/2);
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    // 动画的起始点 位置  7PI/2 - (7PI/2 - 2PI) * progress
    CGFloat originStart = M_PI * 7 / 2;
    CGFloat originEnd = M_PI * 2;
    CGFloat currentOrigin = originStart - (originStart - originEnd) * self.progress;

    // 结束点位置
    CGFloat destStart = M_PI * 3;
    CGFloat destEnd = 0;
    CGFloat currentDest = destStart - (destStart - destEnd) * self.progress;
    [path addArcWithCenter:center
                    radius:radius
                startAngle:currentOrigin
                  endAngle:currentDest
                 clockwise:NO];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextStrokePath(ctx);
    
}

@end
