//
//  UILabel+YHTools.h
//  YHTools
//
//  Created by ImFine on 2020/1/14.
//  Copyright © 2020 ImFine. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YHTool)
/// 设置文字间距
-(void)yh_setLabelTextSpacing:(CGFloat)spacing;
//修改label行间距
-(void)yh_setLabelLineSpacing:(CGFloat)lineSpacing;
//设置label默认属性
- (void)yh_setDefaultPerportysWith:(NSString *)title textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
