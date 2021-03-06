//
//  UIButton+YHTool.h
//  MyTest
//
//  Created by ImFine on 2020/5/26.
//  Copyright © 2020 Fine. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, YHButtonEdgeInsetsStyle) {
    YHButtonEdgeInsetsStyleTop, // image在上，label在下
    YHButtonEdgeInsetsStyleLeft, // image在左，label在右
    YHButtonEdgeInsetsStyleBottom, // image在下，label在上
    YHButtonEdgeInsetsStyleRight // image在右，label在左
};
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YHTool)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)yh_layoutButtonWithEdgeInsetsStyle:(YHButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

//扩大button点击的相应区域
- (void)yh_setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
//扩大button点击的相应区域
- (void)yh_setEnlargeEdge:(CGFloat) size;

//设置按钮图片
- (void)yh_setNormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage;
//设置按钮title
- (void)yh_setTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;
//设置按钮选中时属性
- (void)yh_setSelectTitle:(NSString *)title titleSelectColor:(UIColor *)titleColor fontSelect:(UIFont *)font;


@end

NS_ASSUME_NONNULL_END
