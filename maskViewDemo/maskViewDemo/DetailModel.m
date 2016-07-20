//
//  DetailModel.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "DetailModel.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
#import "ViewControllerFour.h"
#import "ViewControllerFive.h"
#import "ViewControllerSix.h"
#import "ViewControllerSeven.h"

@implementation DetailModel

- (instancetype)initWithTitle:(NSString *)title class:(Class)detailVCClass {
    self = [super init];
    if (self) {
        self.title = title;
        self.detailVCClass = detailVCClass;
    }
    return self;
}

+ (instancetype)detailModelWithTitle:(NSString *)title class:(Class)detailVCClass {
   
    return [[self alloc]initWithTitle:title class:detailVCClass];
}

+ (NSArray *)loadAllDetailModel {
    
    DetailModel *demo01 = [DetailModel detailModelWithTitle:@"原理讲解1" class:[ViewControllerOne class]];
    DetailModel *demo02 = [DetailModel detailModelWithTitle:@"原理讲解2" class:[ViewControllerTwo class]];
    DetailModel *demo03 = [DetailModel detailModelWithTitle:@"基本使用" class:[ViewControllerThree class]];
    DetailModel *demo04 = [DetailModel detailModelWithTitle:@"多张图片动画" class:[ViewControllerFour class]];
    DetailModel *demo05 = [DetailModel detailModelWithTitle:@"配合CAGradientLayer" class:[ViewControllerFive class]];
    DetailModel *demo06 = [DetailModel detailModelWithTitle:@"配合CAShapeLayer" class:[ViewControllerSix class]];
    DetailModel *demo07 = [DetailModel detailModelWithTitle:@"毛玻璃渐变效果" class:[ViewControllerSeven class]];

    return @[demo01,demo02,demo03,demo04,demo05,demo06,demo07];
    
}

@end
