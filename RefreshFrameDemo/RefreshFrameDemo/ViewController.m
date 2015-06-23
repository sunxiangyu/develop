//
//  ViewController.m
//  RefreshFrameDemo
//
//  Created by 孙翔宇 on 15/6/22.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()
- (IBAction)change:(UISlider *)sender;


@property (weak, nonatomic) IBOutlet View *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)change:(UISlider *)sender {
    
    self.customView.radius = sender.value;
    
    
}
@end
