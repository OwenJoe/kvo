//
//  ViewController.m
//  kvo
//
//  Created by owen on 16/3/25.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "ViewController.h"
#import "Pig.h"

@interface ViewController ()<UITextFieldDelegate>

//监听的属性
@property(nonatomic,strong)Pig *kvoString;

@property (nonatomic,strong) UILabel *pigLabel;

@end

@implementation ViewController
//@synthesize music;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.kvoString = [[Pig alloc] init];
    
    //添加观察者 注册当属性发生改变时候被调用
    [self.kvoString addObserver:self forKeyPath:@"pigText" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    //调用初始化
    [self initWedigeMehtod];
}

#pragma mark -- 初始化相应控件
-(void)initWedigeMehtod{

    // 显示的lable
    UILabel *pigLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 280, 21)];
    self.pigLabel = pigLabel;
    pigLabel.backgroundColor = [UIColor whiteColor];
    pigLabel.font = [UIFont systemFontOfSize:18];
    pigLabel.textColor = [UIColor redColor];
    //    musicLabel.tag = 100;
    [self.view addSubview:pigLabel];
    
    
    // 输入的TextField
    UITextField *musicTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 280, 21)];
    musicTextField.font = [UIFont systemFontOfSize:18];
    musicTextField.placeholder = @"请输入文字";
    musicTextField.backgroundColor = [UIColor whiteColor];
    
    // UITextField输入内容时候调用
    [musicTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:musicTextField];
    
    self.view.backgroundColor = [UIColor grayColor];

}

#pragma mark -- 手动输入文字
- (void)textFieldDidChange:(id)sender {
    
    UITextField *textField = (UITextField *)sender;
    NSLog(@"正在输入:%@",textField.text);
    
    // 修改正在监听的属性，将调用下面回调方法
    [self.kvoString setValue:textField.text forKey:@"pigText"];
}

#pragma mark -- 只要Pig类的"pigText"属性发生的变化都会触发到以下的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
//    UILabel *label = (UILabel *)[self.view viewWithTag:100];

    // 如果改变的属性是"pigText"
    if ([keyPath isEqualToString:@"pigText"]) {
        // 将 当前的pigText属性的值 赋值给UILabel
        self.pigLabel.text = [self.kvoString valueForKey:@"pigText"];
        // 输出改变前的值
        NSLog(@"输出改变前的值 %@",[change objectForKey:@"old"]);
        // 输出改变后的值
        NSLog(@"输出改变后的值 %@",[change objectForKey:@"new"]);
    }
}

#pragma mark - 移除观察者
- (void)dealloc {
    
    [self.kvoString removeObserver:self forKeyPath:@"pigText"];

}

@end
