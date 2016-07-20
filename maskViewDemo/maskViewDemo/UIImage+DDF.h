//
//  UIImage+DDF.h
//  DaiDaiFa
//
//  Created by coder.j on 14-10-17.
//  Copyright (c) 2014年 com.daidaifa. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XYCropImageStyle){
    XYCropImageStyleRight               =0,      // 右半部分
    XYCropImageStyleCenter              =1,      // 中间部分
    XYCropImageStyleLeft                =2,      // 左半部分
    XYCropImageStyleRightOneOfThird     =3,      // 右侧三分之一部分
    XYCropImageStyleCenterOneOfThird    =4,      // 中间三分之一部分
    XYCropImageStyleLeftOneOfThird      =5,      // 左侧三分之一部分
    XYCropImageStyleRightQuarter        =6,      // 右侧四分之一部分
    XYCropImageStyleCenterRightQuarter  =7,      // 中间右侧四分之一部分
    XYCropImageStyleCenterLeftQuarter   =8,      // 中间左侧四分之一部分
    XYCropImageStyleLeftQuarter         =9,      // 左侧四分之一部分
};


@interface UIImage (DDF)

+ (instancetype)circleImageWithName:(NSString *)name orImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIImage *)resizableImageWithName:(NSString *)name;

+ (UIImage *)strenchImageWithName:(NSString *)name;

+ (UIImage *)strenchImage:(UIImage *)image;
// 毛玻璃
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

+ (UIImage *)imageWithName:(NSString *)name;

+ (UIImage *)createImageWithColor:(UIColor *)color;

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)sizie;

+ (UIImage *)createRoundRectangleImageWithColor:(UIColor *)color size:(CGSize)size cornerRaddius:(int)radius;

/*
 1.白色,参数:
 透明度 0~1,  0为白,   1为深灰色
 半径:默认30,推荐值 3   半径值越大越模糊 ,值越小越清楚
 色彩饱和度(浓度)因子:  0是黑白灰, 9是浓彩色, 1是原色  默认1.8
 “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。
 */
- (UIImage *)imgWithLightAlpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor;
// 2.封装好,供外界调用的
- (UIImage *)imgWithBlur;
/**
 *  截取指定区域的image
 *
 *  @param style 截取那些部分
 *
 *  @return 截取后的图片
 */
- (UIImage *)imageByCroppingWithStyle:(XYCropImageStyle)style;

/**
 *  将图片缩放到指定大小
 *
 *  @param image 要被缩放的图片
 *  @param size  缩放大小
 *
 *  @return 被缩放后的图片
 */
- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size;

/**
 *  通过缩放系数缩放图片
 */
- (UIImage*)imageCompressWithSimple:(UIImage*)image scale:(float)scale;
/**
 *  通过计算得到缩放系数，进行缩放
 *
 *  @param targetSize 缩放后的图片大小
 *
 *  @return 被缩放后的图片
 */
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end
