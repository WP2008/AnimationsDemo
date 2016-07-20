//
//  TableViewController.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "TableViewController.h"
#import "DetailModel.h"

NSString * const cellID = @"reuseIdentifier";

@interface TableViewController ()

@property (nonatomic, strong) NSArray <DetailModel *>*dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"maskView";
    
    self.dataSource = [DetailModel loadAllDetailModel];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell  =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    
    cell.textLabel.text = self.dataSource[indexPath.row].title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[self.dataSource[indexPath.row].detailVCClass alloc] init];
    vc.title = self.dataSource[indexPath.row].title;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
