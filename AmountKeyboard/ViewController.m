//
//  ViewController.m
//  AmountKeyboard
//
//  Created by yeyu on 16/1/26.
//  Copyright © 2016年 yeyu. All rights reserved.
//

#import "ViewController.h"
#import "AmountKeyboard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = RGBA(240, 239, 245, 1);
    
    self.amountTF.placeholder = @"输入金额";
    [self.amountTF becomeFirstResponder];
    
    [AmountKeyboard initWithTextField:self.amountTF].changeTextBlock = ^(NSString *text) {
        NSLog(@"当前输入的金钱：%@",text);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
