//
//  CALayer+CornersBorder.m
//  MyTest
//
//  Created by ImFine on 2021/5/10.
//  Copyright © 2021 Fine. All rights reserved.
//

#import "CALayer+CornersBorder.h"

@implementation CALayer (CornersBorder)
//设置layer圆角
-(void)yh_setLayerCornnerWith:(CGFloat)corners {
    self.cornerRadius = corners;
    self.masksToBounds = YES;
}
//设置layer边框颜
-(void)yh_setLayerBoardWidth:(CGFloat)width boardColor:(UIColor *)color {
    self.borderWidth = width;
    self.borderColor = color.CGColor;
}
//设置layer圆角和边框
-(void)yh_setLayerCornnerWith:(CGFloat)corners BoardWidth:(CGFloat)width boardColor:(UIColor *)color {
    [self yh_setLayerCornnerWith:corners];
    [self yh_setLayerBoardWidth:width boardColor:color];
}
@end
