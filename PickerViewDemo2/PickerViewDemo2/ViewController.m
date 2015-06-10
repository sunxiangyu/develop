//
//  ViewController.m
//  PickerViewDemo2
//
//  Created by 孙翔宇 on 15/6/9.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic, strong) NSArray *foods;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)randomFood:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;

@property (weak, nonatomic) IBOutlet UILabel *stapleLabel;

@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int component = 0; component < self.foods.count; component++) {
        [self pickerView:nil didSelectRow:0 inComponent:component];
    }
}

- (NSArray *)foods
{
    if (_foods == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];
        _foods = array;
    }
    return _foods;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foods[component] count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *subFoods = self.foods[component];
    
    return subFoods[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *name = self.foods[component][row];
    
    if (component == 0) {
        self.fruitLabel.text = name;
    }
    else if (component == 1) {
        self.stapleLabel.text = name;
    }
    else {
        self.drinkLabel.text = name;
    }
}


- (IBAction)randomFood:(UIButton *)sender {
    
    for (int component = 0; component < self.foods.count; component++) {
        int total = [self.foods[component] count];
        int randomNumber = arc4random() % total;
        int oldRow = [self.pickerView selectedRowInComponent:component];
        
        while (oldRow == randomNumber) {
            randomNumber = arc4random() % total;
        }
        
        [self.pickerView selectRow:randomNumber inComponent:component animated:YES];
        
        [self pickerView:nil didSelectRow:randomNumber inComponent:component];
        
    }
    
}
@end
