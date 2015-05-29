//
//  ViewController.m
//  Car-Brand DisplayDemo
//
//  Created by 孙翔宇 on 15/5/27.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarGroup.h"

@interface ViewController ()<UITableViewDataSource>
@property(nonatomic,strong) NSArray *carGroups;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSArray *)carGroups
{
    if (_carGroups == nil) {
        _carGroups = [CarGroup carGroups];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
}

#pragma mark - 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    CarGroup *group = self.carGroups[indexPath.section];
    Car *car = group.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarGroup *group = self.carGroups[section];
    return group.title;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.carGroups valueForKeyPath:@"title"];
}

@end
