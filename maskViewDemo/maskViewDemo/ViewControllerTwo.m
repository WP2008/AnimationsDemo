//
//  ViewControllerTwo.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerTwo.h"
#import "UIView+Extension.h"
@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    // 原始图
    UIImage *image = [UIImage imageNamed:@"head"];
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.origin = CGPointMake(30, 40);
    [self.view addSubview:imageView];
    
    
    // 加入 mask 的效果
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image];
    imageView1.origin = CGPointMake(30, imageView.maxY + 20);
    // mask 的左面一半是纯灰色，右面一半是 alpha = 0.5 的绿
    UIImageView *maskImage = [[UIImageView alloc] initWithFrame:imageView1.bounds];
    maskImage.image = [UIImage imageNamed:@"gray_green"];
    
    imageView1.layer.mask = maskImage.layer;
    [self.view.layer addSublayer:imageView1.layer];
    // 所以 imageView1的左半面不变，右半面的alpha变成了 0.5
    
    
    // 直接设置 alpha 的效果  与 imageView1 的右半面的效果是一样的
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image];
    imageView2.alpha = 0.5;
    imageView2.origin = CGPointMake(30, imageView1.maxY + 20);
    [self.view.layer addSublayer:imageView2.layer];
    
    
    /**
     maskView每个point的alpha  赋值给View的重叠部分相对应的point，
     这样view的重叠每个point都有个alpha值了 ，view重叠部分就可能显示多种透明色。
     */
    
   
    
}




@end
