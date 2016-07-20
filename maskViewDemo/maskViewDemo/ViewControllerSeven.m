//
//  ViewControllerSeven.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerSeven.h"
#import "UIImage+DDF.h"
#import "UIView+Extension.h"

@interface ViewControllerSeven ()
@property (nonatomic, strong) UIView        *showView;
@property (nonatomic, strong) CAShapeLayer  *maskLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation ViewControllerSeven

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Slice"];
    [self.view addSubview:imageView];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = self.view.bounds;
    // 颜色的透明度   alpha   0.0  全透过  1.0 不透明
    gradientLayer.colors = @[
                             (__bridge id)[UIColor colorWithWhite:1 alpha:0.0].CGColor,
                             (__bridge id)[UIColor colorWithWhite:1 alpha:1.0].CGColor,
                             ];
    gradientLayer.locations = @[@0.35,@0.55];
    _gradientLayer = gradientLayer;
    
    

    UIView *blurView = [[UIView alloc] initWithFrame:self.view.bounds];
    blurView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blurView];
    blurView.layer.mask = gradientLayer;
    blurView.layer.contents = (__bridge id)([[UIImage imageNamed:@"Slice"] imgWithBlur].CGImage);
}


@end
