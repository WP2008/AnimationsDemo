//
//  ViewControllerSix.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerSix.h"
#import "UIImage+DDF.h"
#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)

@interface ViewControllerSix ()
@property (nonatomic, strong) UIView        *showView;
@property (nonatomic, strong) CAShapeLayer  *maskLayer;
@end

@implementation ViewControllerSix

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 最底层的view  显示图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Slice"];
    [self.view addSubview:imageView];
   
    
    
    // 创建mask
    // 贝塞尔曲线(创建一个圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0)
                                                        radius:100
                                                    startAngle:DEGREES(0)
                                                      endAngle:DEGREES(360)
                                                     clockwise:YES];

    _maskLayer = [CAShapeLayer layer];
    _maskLayer.path     = path.CGPath;
    _maskLayer.position = CGPointMake(_showView.bounds.size.width/2.f,
                                      _showView.bounds.size.height/2.f);
    _maskLayer.fillColor = [UIColor whiteColor].CGColor;
    _maskLayer.position = self.view.center;
    
    
    
    // 创建覆盖在最底层imageView上的模糊图片， 添加mask   注意mask为一个圆形（模糊图片只会显示一个圆，其他地方会变成透明）
    UIView *blurView = [[UIView alloc] initWithFrame:self.view.bounds];
    blurView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blurView];
    blurView.layer.mask = _maskLayer;
    blurView.layer.contents = (__bridge id)([[UIImage imageNamed:@"Slice"] imgWithBlur].CGImage);
    
    
    
    /*
     透明的View,用于maskView中的ShapeLayer的参考View(用于拖拽)
     */
    _showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _showView.backgroundColor = [UIColor clearColor];
    _showView.center = self.view.center;
    [self.view addSubview:_showView];
    
    UIPanGestureRecognizer *recognizer =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handlePan:)];
    [_showView addGestureRecognizer:recognizer];
}



- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    // 拖拽
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // 关闭CoreAnimation实时动画绘制(核心)
    [CATransaction setDisableActions:YES];
    _maskLayer.position = recognizer.view.center;
}


@end
