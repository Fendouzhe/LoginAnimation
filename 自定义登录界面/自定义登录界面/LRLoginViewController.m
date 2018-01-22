//
//  ViewController.m
//  自定义登录界面
//
//  Created by apple on 16/8/10.
//  Copyright © 2016年 lurong. All rights reserved.
//

#import "LRLoginViewController.h"
#import "LRTextField.h"
#import "LRButton.h"
#import "NextViewController.h"

@interface LRLoginViewController ()

@end

@implementation LRLoginViewController

-(instancetype)init{
    if(self = [super init]){
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer addSublayer: [self backgroundLayer]];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self setUp];
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}
-(void)setUp{
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    titleLabel.center = CGPointMake(self.view.center.x, 150);
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"LRAnimations";//@"CLOVER";
    titleLabel.font = [UIFont systemFontOfSize:40.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    
    UILabel *detail = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    detail.center = CGPointMake(self.view.center.x,630);
    detail.textColor = [UIColor whiteColor];
    detail.text = @"Don`t have an account yet? Sign Up";
    detail.font = [UIFont systemFontOfSize:13.f];
    detail.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:detail];
    
    LRTextField *username = [[LRTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    username.center = CGPointMake(self.view.center.x, 350);
    username.lr_placeholder = @"Username";
    username.tag = 0;
    [self.view addSubview:username];
    
    LRTextField *password = [[LRTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    password.center = CGPointMake(self.view.center.x, username.center.y+60);
    password.lr_placeholder = @"Password";
    password.tag = 1;
    [self.view addSubview:password];
    
    LRButton *login = [[LRButton alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    login.center = CGPointMake(self.view.center.x, password.center.y+100);
    [self.view addSubview:login];
 
    login.translateBlock = ^{
        NSLog(@"跳转了哦");
        NextViewController *nextVC = [[NextViewController alloc]init];
        [self presentViewController:nextVC animated:YES completion:nil];
    };
}


-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor cyanColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.locations = @[@0.68,@1];
    return gradientLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
