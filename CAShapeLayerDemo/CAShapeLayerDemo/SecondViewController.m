//
//  SecondViewController.m
//  CAShapeLayerDemo
//
//  Created by wp on 16/7/26.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "SecondViewController.h"
#import "CircleProgressView.h"
@interface SecondViewController ()
@property (nonatomic, strong) CircleProgressView *progressView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    
    self.progressView = [[CircleProgressView alloc]init];
    self.progressView.frame = CGRectMake(100, 180, 200, 200);
    [self.view addSubview:self.progressView];
    
    self.progressView.progress = 0.7453;
}


- (IBAction)changeProgress:(UISlider *)sender {
    self.progressView.progress = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  根据  rect 绘制一个椭圆  （虚线）
 *
 *  @param rect        绘制区域
 *  @param lineLength   虚线的宽度
 *  @param lineSpacing 虚线的间距
 *  @param lineColor   虚线的颜色
 *
 *  @return 虚线椭圆的 layer
 */

- (CAShapeLayer *)drawDashEllipseInRect:(CGRect)rect lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    CAShapeLayer *shapeLayer =  [CAShapeLayer layer];
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = lineColor.CGColor;
    shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    shapeLayer.lineCap =  kCALineCapRound;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineDashPhase = 10;
    shapeLayer.lineDashPattern = @[[NSNumber numberWithInt:lineLength],[NSNumber numberWithInt:lineSpacing]];
    
    CGMutablePathRef path =  CGPathCreateMutable();
    CGPathAddEllipseInRect(path, nil, rect);
    shapeLayer.path = path;
    CGPathRelease(path);
    return shapeLayer;
}


@end
