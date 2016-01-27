//
//  YUButton.m
//  AmountKeyboard
//
//  Created by yeyu on 16/1/26.
//  Copyright © 2016年 yeyu. All rights reserved.
//

#import "YUButton.h"

@interface YUButton ()

@property (nonatomic, strong) UIView    *effectView;

@end;

@implementation YUButton

- (UIView *)effectView
{
    if (!_effectView) {
        _effectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _effectView.layer.cornerRadius = self.layer.cornerRadius;
        _effectView.layer.masksToBounds = self.layer.masksToBounds;
        _effectView.userInteractionEnabled = NO;
        _effectView.backgroundColor = [UIColor blackColor];
        [self addSubview:_effectView];
    }
    return _effectView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    self.effectView.alpha = 0.15;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    self.effectView.alpha = 0;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    
    self.effectView.alpha = 0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    float x = 60;
    if (!CGRectContainsPoint(CGRectMake(-x, -x, self.frame.size.width+2*x, self.frame.size.height+2*x), touchPoint))
    {
        self.effectView.alpha = 0;
        
    }else {
        self.effectView.alpha = 0.15;
    }
}

@end
