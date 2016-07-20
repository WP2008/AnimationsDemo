//
//  ViewControllerThree.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerThree.h"
#import "WPShapedImageView.h"
#import "UIView+Extension.h"

#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)
@interface ViewControllerThree ()
@property (nonatomic, strong)CAShapeLayer *maskLayer;

@end

@implementation ViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    /**
     * 方法1: 设置 layer.contents 实现遮罩色做mask  (或者是张带图的imageView 做maskView效果是一样的）
     *        view 就只留下了 有透明度的区域
     */
    CGRect frame = CGRectMake(0,0,self.view.width,self.view.height/2);
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:frame];
    bgView.image = [UIImage imageNamed:@"base"];
    [self.view addSubview:bgView];
    
    UIImageView *maskView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble"]];
    maskView.frame = bgView.bounds;
    maskView.contentMode = UIViewContentModeCenter;
    bgView.maskView = maskView;
    
    
    /**
      方法2: 设置  layer.path 实现遮罩
     */
    CGRect frame2 = CGRectMake(80,bgView.maxY,self.view.width-160,self.view.height/2);

    WPShapedImageView *shapedImageView = [[WPShapedImageView alloc] initWithFrame:frame2];
    shapedImageView.image = [UIImage imageNamed:@"base"];
    [self.view addSubview:shapedImageView];
    
}




@end
