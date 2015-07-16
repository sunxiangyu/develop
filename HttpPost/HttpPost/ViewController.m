//
//  ViewController.m
//  HttpPost
//
//  Created by 孙翔宇 on 15/7/14.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+MJ.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *pwd;

- (IBAction)login:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (IBAction)login:(UIButton *)sender {
    
    NSString *username = self.username.text;
    if (username.length == 0) {
        [MBProgressHUD showError:@"请输入用户名"];
        return;
    }
    
    NSString *pwd = self.pwd.text;
    if (pwd.length == 0) {
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    
    [MBProgressHUD showMessage:@"正在拼命登陆中..."];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/MJServer/login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 20;
    request.HTTPMethod = @"POST";
    
    NSString *param = [NSString stringWithFormat:@"username=%@&pwd=%@",username,pwd];
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setValue:@"iphone6" forHTTPHeaderField:@"User-Agent"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [MBProgressHUD hideHUD];
        
        if (connectionError || data == nil) {
            [MBProgressHUD showError:@"请求失败"];
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *error = dict[@"error"];
        if (error) {
            [MBProgressHUD showError:error];
        } else {
            [MBProgressHUD showSuccess:dict[@"success"]];
        }
        
    }];
    
}
@end
