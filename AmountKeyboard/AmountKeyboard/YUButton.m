//
//  YUButton.m
//  AmountKeyboard
//
//  Created by yeyu on 16/1/26.
//  Copyright © 2016年 yeyu. All rights reserved.
//

#import "YUButton.h"

@interface YUButton ()
{
    UIView      *blackView;
}

@end;

@implementation YUButton

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (!blackView) {
        blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        blackView.layer.cornerRadius = self.layer.cornerRadius;
        blackView.layer.masksToBounds = self.layer.masksToBounds;
        blackView.userInteractionEnabled = NO;
        blackView.backgroundColor = [UIColor blackColor];
    }
    blackView.alpha = 0.15;
    [self addSubview:blackView];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if (blackView) {
        blackView.alpha = 0;
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    
    if (blackView) {
        blackView.alpha = 0;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    float x = 60;
    if (!CGRectContainsPoint(CGRectMake(-x, -x, self.frame.size.width+2*x, self.frame.size.height+2*x), touchPoint))
    {
        if (blackView) {
            blackView.alpha = 0;
        }
        
    }else {
        if (blackView) {
            blackView.alpha = 0.15;
        }
    }
}

@end
