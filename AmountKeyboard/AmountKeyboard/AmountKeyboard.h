//
//  AmountKeyboard.h
//  AmountKeyboard
//
//  Created by yeyu on 16/1/26.
//  Copyright © 2016年 yeyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SOUNDID                 1306
#define ScreenWidth             ([[UIScreen mainScreen] bounds].size.width)

#define RGBA(r,g,b,a)           [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define Color_Title             RGBA(34, 34, 34, 1)
#define Color_Border            RGBA(206, 206, 206, 1)

#define Font(F)                 [UIFont systemFontOfSize:(F)]
#define FontBold(F)             [UIFont boldSystemFontOfSize:(F)]

@interface AmountKeyboard : UIView

@property (nonatomic, copy) void (^changeTextBlock)(NSString *text);

+ (instancetype)initWithTextField:(UITextField *)textField;

@end
