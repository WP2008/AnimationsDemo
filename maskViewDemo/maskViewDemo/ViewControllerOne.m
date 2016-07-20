//
//  ViewControllerOne.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerOne.h"
#import "UIView+Extension.h"
@interface ViewControllerOne ()

@end

@implementation ViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 演示 maskView效果
    // 原始view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 60, 200, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    // maskView
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    maskView.backgroundColor = [UIColor redColor];
    view.maskView = maskView;
    
    /**
     当一个view设置了maskView后，那么它只会显示与maskView重叠部分，即在此图中只会显示maskView部分(maskView跟view没有层次，可以理解maskView嵌在View里)
     
     可以这样理解，是将maskView每个point的alpha赋值给View的重叠部分相对应的point，这样view的重叠每个point都有个alpha值了，view重叠部分就可能显示多种透明色。
     */
    
    
    
    // 演示 subView的效果
    UIView *otherView = [[UIView alloc] initWithFrame:CGRectMake(50, view.maxY + 30, 200, 200)];
    otherView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:otherView];
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    subView.backgroundColor = [UIColor redColor];
    [otherView addSubview:subView];




}




@end
