//
//  CustomLabel.m
//  ios-animation-sample
//
//  Created by tnaototo on 2014/10/27.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

# pragma padding
- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
