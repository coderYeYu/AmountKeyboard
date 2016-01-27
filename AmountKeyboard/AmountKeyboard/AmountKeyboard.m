//
//  AmountKeyboard.m
//  AmountKeyboard
//
//  Created by yeyu on 16/1/26.
//  Copyright © 2016年 yeyu. All rights reserved.
//

#import "AmountKeyboard.h"
#import <AudioToolbox/AudioToolbox.h>
#import "YUButton.h"

@interface AmountKeyboard ()

@property (nonatomic, assign) UITextField *textField;

@end

@implementation AmountKeyboard

+ (instancetype)initWithTextField:(UITextField *)textField
{
    AmountKeyboard *numberKeyboard = [[AmountKeyboard alloc] init];
    numberKeyboard.textField = textField;
    textField.inputView = numberKeyboard;
    
    return numberKeyboard;
}

- (instancetype)init
{
    self = [super init];
    
    self.frame = CGRectMake(0, 0, ScreenWidth, 200);
    
    NSArray *numbers = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"删除"];
    
    CGFloat width = ScreenWidth/3.;
    CGFloat height = self.frame.size.height/4.;
    
    for (NSInteger i=0; i<numbers.count; i++) {
        YUButton *button = [[YUButton alloc] initWithFrame:CGRectMake(width*(i%3), height*(i/3), width, height)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitle:numbers[i] forState:UIControlStateNormal];
        [button setTitleColor:Color_Title forState:UIControlStateNormal];
        if (i == numbers.count-1) {
            button.titleLabel.font = Font(15);
            [button addTarget:self action:@selector(deleteDidClick:) forControlEvents:UIControlEventTouchUpInside];
            
            UILongPressGestureRecognizer *deleteLPGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(deleteByLongPress:)];
            deleteLPGR.minimumPressDuration = 1.0;
            [button addGestureRecognizer:deleteLPGR];
            
        }else {
            button.titleLabel.font = FontBold(25);
            [button addTarget:self action:@selector(numberDidClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:button];
    }
    
    //横线
    for (NSInteger i=0; i<4; i++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, i*height, self.frame.size.width, 0.5)];
        line.backgroundColor = Color_Border;
        [self addSubview:line];
    }
    
    //竖线
    for (NSInteger i=0; i<2; i++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake((i+1)*width, 0, 0.5, self.frame.size.height)];
        line.backgroundColor = Color_Border;
        [self addSubview:line];
    }
    
    return self;
}

/**
 *  点击删除键删除
 */
- (void)deleteDidClick:(id)sender {
    AudioServicesPlaySystemSound(SOUNDID);
    
    NSInteger length = self.textField.text.length;
    if (length != 0) {
        NSString *substring = [self.textField.text substringWithRange:NSMakeRange(0, length - 1)];
        self.textField.text = substring;
    }
    
    self.changeTextBlock(self.textField.text);
}

/**
 *  长按删除键删除
 */
- (void)deleteByLongPress:(UILongPressGestureRecognizer *)recognizer {
    
    self.textField.text = @"";
    self.changeTextBlock(self.textField.text);
}

/**
 *  数字被点击
 */
- (void)numberDidClick:(id)sender {
    AudioServicesPlaySystemSound(SOUNDID);
    
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.titleLabel.text;
    
    //输入"."
    if ([title isEqualToString:@"."]) {
        //当前输入框文本为""
        if ([self.textField.text isEqualToString:@""]) {
            self.textField.text = @"0.";
        }
        else if(self.textField.text.length != 0 && [self.textField.text rangeOfString:@"."].location == NSNotFound) {
            self.textField.text = [NSString stringWithFormat:@"%@%@", self.textField.text, @"."];
        }
    }
    else {
        //如果输入框文本不为"",首字符为"0",并且不包含"."
        if (self.textField.text.length != 0 && [[self.textField.text substringToIndex:1] isEqualToString:@"0"] && [self.textField.text rangeOfString:@"."].location == NSNotFound) {
            self.textField.text = [NSString stringWithFormat:@"%@", title];
        }
        else {
            self.textField.text = [NSString stringWithFormat:@"%@%@", self.textField.text, title];
            
            if ([self.textField.text rangeOfString:@"."].location != NSNotFound) {
                NSRange range = [self.textField.text rangeOfString:@"."];
                NSString *substring = [self.textField.text substringFromIndex:range.location];
                if (substring.length > 3) {
                    self.textField.text = [self.textField.text substringWithRange:NSMakeRange(0, range.location+3)];
                }
            }
        }
    }
    
    self.changeTextBlock(self.textField.text);
}

@end
