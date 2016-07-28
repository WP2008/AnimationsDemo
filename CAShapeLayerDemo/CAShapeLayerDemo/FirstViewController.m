//
//  FirstViewController.m
//  CAShapeLayerDemo
//
//  Created by wp on 16/7/26.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRectLayer];
    [self createCurveLayer];
    [self createBottomCurveLayer];

    
}

- (void)createRectLayer {
    // CAShapeLayer 有一个神奇的属性 path 用这个属性配合上 UIBezierPath 这个类就可以达到超神的效果

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 80, 150, 100)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
    // 注意不要使用 backgroundColor 这个属性了，而要使用 fillColor 和 strokeColor
    layer.fillColor = [UIColor orangeColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;

}

- (void)createCurveLayer {
    // 创建曲线的控制点
    CGPoint startPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint1 = CGPointMake(170, 200);
    CGPoint controlPoint2 = CGPointMake(230, 400);
    
    CALayer *layer1 =[[CALayer alloc]init];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer1];
    
    CALayer *layer2 =[[CALayer alloc]init];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer2];
    
    CALayer *layer3 =[[CALayer alloc]init];
    layer3.frame = CGRectMake(controlPoint1.x, controlPoint1.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer3];
    
    CALayer *layer4 =[[CALayer alloc]init];
    layer4.frame = CGRectMake(controlPoint2.x, controlPoint2.y, 5, 5);
    layer4.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer4];
    
    
    // 创建 path
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    // 创建 shapeLayer
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    [self.view.layer addSublayer:shapeLayer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.lineWidth = 5;
    

}


- (void)createBottomCurveLayer {
    
    CGSize finalSize = CGSizeMake(CGRectGetWidth(self.view.frame), 600);
    CGFloat layerHeight = finalSize.height * 0.2;
    CAShapeLayer *bottomCurveLayer = [[CAShapeLayer alloc]init];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
    [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
    [path addQuadCurveToPoint:CGPointMake(0, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];

    
    bottomCurveLayer.path = path.CGPath;
    bottomCurveLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:bottomCurveLayer];
    
}


@end
