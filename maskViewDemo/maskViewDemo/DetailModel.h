//
//  DetailModel.h
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) Class  detailVCClass;


+ (NSArray *)loadAllDetailModel;

@end
