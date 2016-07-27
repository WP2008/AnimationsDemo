//
//  FiveViewController.m
//  CAShapeLayerDemo
//
//  Created by wp on 16/7/27.
//  Copyright © 2016年 wp. All rights reserved.
//
//  http://www.cocoachina.com/ios/20151231/14823.html

#import "FiveViewController.h"
#import "RYCuteView.h"
@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RYCuteView *cuteView = [[RYCuteView alloc] initWithFrame:CGRectMake(0, 64, 320, 568)];
    cuteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cuteView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
