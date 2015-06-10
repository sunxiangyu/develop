//
//  ViewController.m
//  PickerViewDemo1
//
//  Created by 孙翔宇 on 15/6/9.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic, strong) NSArray *provinces;

@property(nonatomic, weak) UIPickerView* pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
    self.pickerView = pickerView;
}


#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinces.count;
    } else {
        NSInteger selectIndex = [pickerView selectedRowInComponent:0];
        
        Province *province = self.provinces[selectIndex];
        
        return province.cities.count;
    }
}

#pragma mark - UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        Province *province = self.provinces[row];
        return province.name;
    } else {
        NSInteger selectIndex = [pickerView selectedRowInComponent:0];
        Province *province = self.provinces[selectIndex];
        return province.cities[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

-(NSArray *)provinces
{
    if (_provinces == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dict in array) {
            [models addObject:[Province provinceWithDict:dict]];
        }
        _provinces = [models copy];
    }
    return _provinces;
}

@end
