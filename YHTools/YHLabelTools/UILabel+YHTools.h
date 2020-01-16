//
//  UILabel+YHTools.h
//  YHTools
//
//  Created by ImFine on 2020/1/14.
//  Copyright © 2020 ImFine. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YHTools)
//修改label行间距
-(void)yh_setLabelLineSpacingWithText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;
@end

NS_ASSUME_NONNULL_END
