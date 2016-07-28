//
//  CircleProgressView.m
//  DashLine
//
//  Created by WP on 16/3/10.
//  Copyright © 2016年 xianlvke. All rights reserved.
//

#import "CircleProgressView.h"
static const CGFloat dashLayerMargin = 20;
static const CGFloat lineWidth = 1.2f;
static const CGFloat lineSpacing = 3.0f;

@interface CircleProgressView()
// 灰色虚线
@property (nonatomic, strong)CAShapeLayer *baseLayer;
// 彩色虚线
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
// 外圈灰色大圆
@property (nonatomic, strong)CAShapeLayer *bigBaseLayer;
// 带颜色的大圆
@property (nonatomic, strong)CAShapeLayer *bigShapeLayer;


@end;

@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubViews];
    }
    return self;

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpSubViews];
    }
    return self;
}


- (void)setUpSubViews {
    
    
    self.baseLayer = [CAShapeLayer layer];
    self.baseLayer.lineWidth = lineWidth;
    self.baseLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.baseLayer.fillColor   = [UIColor clearColor].CGColor;
    self.baseLayer.lineCap =  kCALineCapRound;
    self.baseLayer.lineJoin = kCALineJoinRound;
    self.baseLayer.lineDashPhase = 10;
    self.baseLayer.lineDashPattern = @[[NSNumber numberWithFloat:lineWidth],[NSNumber numberWithFloat:lineSpacing]];
    [self.layer addSublayer:self.baseLayer];
    
    
    self.bigBaseLayer = [CAShapeLayer layer];
    self.bigBaseLayer.lineWidth =8.0f;
    self.bigBaseLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    self.bigBaseLayer.fillColor   = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.bigBaseLayer];
    
    
     self.shapeLayer = [CAShapeLayer layer];
     self.shapeLayer.lineWidth = 2.0f;
     self.shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
     self.shapeLayer.fillColor   = [UIColor clearColor].CGColor;
     self.shapeLayer.lineCap =  kCALineCapRound;
     self.shapeLayer.lineJoin = kCALineJoinRound;
     self.shapeLayer.lineDashPhase = 10;
     self.shapeLayer.lineDashPattern = @[[NSNumber numberWithFloat:lineWidth],[NSNumber numberWithFloat:lineSpacing]];
    [self.baseLayer addSublayer:self.shapeLayer];

    self.bigShapeLayer = [CAShapeLayer layer];
    self.bigShapeLayer.lineWidth =6.0f;
    self.bigShapeLayer.lineCap =  kCALineCapRound;
    self.bigShapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    self.bigShapeLayer.fillColor   = [UIColor clearColor].CGColor;
    [self.bigBaseLayer addSublayer:self.bigShapeLayer];
    
}

// 创建渐变 图层
- (void)createGradientLayer {
    CALayer *gradientLayer = [CALayer layer];
    
    // 左侧渐变
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
    leftLayer.locations = @[@0.3, @0.9, @1.0];
    leftLayer.colors = @[ (id)[UIColor redColor].CGColor, (id)[UIColor yellowColor].CGColor];
    [gradientLayer addSublayer:leftLayer];
    

    // 右侧渐变
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height);
    rightLayer.locations = @[@0.3, @0.9, @1.0];
    rightLayer.colors =  @[(id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor];
    [gradientLayer addSublayer:rightLayer];
    // 使用 bigShapeLayer 来截取 渐变层
   // gradientLayer.mask = self.bigShapeLayer;
    gradientLayer.mask = self.shapeLayer;
//    gradientLayer.masksToBounds = YES;
    
    [self.layer addSublayer:gradientLayer];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;

    self.shapeLayer.strokeEnd = progress;
    self.bigShapeLayer.strokeEnd = progress;

}

- (void)layoutSubviews {
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2 - dashLayerMargin;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:- M_PI_2 endAngle: (M_PI * 2)- M_PI_2 clockwise:YES];
    
    CGFloat bigRadius = radius + 8;
    UIBezierPath *bigPath = [UIBezierPath bezierPathWithArcCenter:center radius:bigRadius startAngle:- M_PI_2 endAngle: (M_PI * 2)- M_PI_2 clockwise:YES];
    
    self.shapeLayer.path = path.CGPath;
    self.baseLayer.path = path.CGPath;
    
    self.bigBaseLayer.path = bigPath.CGPath;
    self.bigShapeLayer.path = bigPath.CGPath;
    
    [self createGradientLayer];

}








@end
