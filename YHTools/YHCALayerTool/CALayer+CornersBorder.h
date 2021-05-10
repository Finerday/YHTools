//
//  CALayer+CornersBorder.h
//  MyTest
//
//  Created by ImFine on 2021/5/10.
//  Copyright © 2021 Fine. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (CornersBorder)
//设置layer圆角
-(void)yh_setLayerCornnerWith:(CGFloat)corners;
//设置layer边框颜
-(void)yh_setLayerBoardWidth:(CGFloat)width boardColor:(UIColor *)color;
//设置layer圆角和边框
-(void)yh_setLayerCornnerWith:(CGFloat)corners BoardWidth:(CGFloat)width boardColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
