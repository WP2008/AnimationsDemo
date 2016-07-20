//
//  ViewControllerFive.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerFive.h"
#import "UIView+Extension.h"
@interface ViewControllerFive ()
@property (nonatomic, weak)CAGradientLayer *gradientLayer;
@property (nonatomic, strong)NSArray *colors;
@property (nonatomic, strong)UILabel *unlock;
@end

@implementation ViewControllerFive

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // 渐变Layer
    
    //    1.CAGradientLayer 默认的渐变方向是从上到下，即垂直方向。
    //    2.colors 是个NSArray类型，只能存对象，所以需要将CGColor转换一下，此属性可设置多个值(1个，2个，3个等...，都行)，此Demo的滑动解锁效果只需要 两种 颜色的渐变，所以设置了三个值，实际值可根据需求设置。
    //    3.设置好 colors 要设置好与之相对应的 locations 值
    //    4.如果要改变 CAGradientLayer 的渐变方向，则要显式的给 startPoint
    //    和 endPoint 两个属性赋值。如果要改为水平方向，则需要改成
    //
    //    gradientLayer.startPoint = CGPointMake(0, 0.5);
    //    gradientLayer.endPoint = CGPointMake(1, 0.5)
    //
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0, 200, self.view.width, 64);
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,
                             ];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    
    
    // CAGradientLayer可用来处理颜色渐变，它的渐变色也可以做隐式动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
    basicAnimation.repeatCount = HUGE;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
    
    // 设置 gradientLayer  的 mask 为 unLock   有透明度的地方 就露出来了
    
    UILabel *unlock = [[UILabel alloc] initWithFrame:gradientLayer.bounds];
    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:30];
    gradientLayer.mask = unlock.layer;

}


@end
