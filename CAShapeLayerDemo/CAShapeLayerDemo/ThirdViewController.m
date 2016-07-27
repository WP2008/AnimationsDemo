//
//  ThirdViewController.m
//  CAShapeLayerDemo
//
//  Created by wp on 16/7/26.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ThirdViewController.h"
#import "EyeRefreshView.h"
@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)EyeRefreshView *refreshView;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self tableView];
    [self refreshView];
    
}

- (void)dealloc {
    
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:_tableView];
        _tableView.frame = self.view.bounds;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.backgroundColor = [UIColor grayColor];
        
        [_tableView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)  context:nil];
        
    }
    return _tableView;
}

- (EyeRefreshView *)refreshView {
    if (_refreshView == nil) {
        _refreshView = [[EyeRefreshView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 420)];
        _refreshView.backgroundColor = [UIColor orangeColor];
        self.tableView.tableHeaderView = _refreshView;
    }
    return _refreshView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc]init];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"   %f",      self.tableView.contentOffset.y);
    [self.refreshView animationWithProgres:self.tableView.contentOffset.y];
    
}


@end
