//
//  ViewController.m
//  OneLoadingAnimation
//
//  Created by WP on 16/2/18.
//  Copyright © 2016年 xianlvke. All rights reserved.
//

#import "ViewController.h"
#import "OneLoadingAnimationView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet OneLoadingAnimationView *animationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - user event
- (IBAction)onTapStartAnimation:(id)sender {
    [self.animationView startSuccess];
}

- (IBAction)startFail:(id)sender {
    [self.animationView startFail];
    
}

@end
