//
//  WPShapedImageView.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "WPShapedImageView.h"

@implementation WPShapedImageView
{
    CALayer      *_contentLayer;
    CAShapeLayer *_maskLayer;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup
{

    /**
     *   第一种方法   设置  layer.path 实现遮罩
     */
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint origin = self.bounds.origin;
    CGFloat radius = CGRectGetWidth(self.bounds) / 2;
    CGPathMoveToPoint(path, NULL, origin.x, origin.y + 2 *radius);
    CGPathMoveToPoint(path, NULL, origin.x, origin.y + radius);
    CGPathAddArcToPoint(path, NULL, origin.x, origin.y, origin.x + radius, origin.y, radius);
    CGPathAddArcToPoint(path, NULL, origin.x + 2 * radius, origin.y, origin.x + 2 * radius, origin.y + radius, radius);
    CGPathAddArcToPoint(path, NULL, origin.x + 2 * radius, origin.y + 2 * radius, origin.x + radius, origin.y + 2  * radius, radius);
    CGPathAddLineToPoint(path, NULL, origin.x, origin.y + 2 * radius);
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.path = path;
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor clearColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;  //非常关键设置自动拉伸的效果且不变形
    
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    [self.layer addSublayer:_contentLayer];
    
}

- (void)setImage:(UIImage *)image
{
    _contentLayer.contents = (id)image.CGImage;
}


@end
