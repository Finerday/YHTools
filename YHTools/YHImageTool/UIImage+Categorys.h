//
//  UIImage+Categorys.h
//  MyTest
//
//  Created by ImFine on 2020/3/26.
//  Copyright © 2020 Fine. All rights reserved.
//




#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom = 1,            //从上到下
    GradientFromLeftToRight,                //从左到右
    GradientFromLeftTopToRightBottom,       //从上到下
    GradientFromLeftBottomToRightTop        //从上到下
};
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Categorys)
/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colorArr         渐变颜色的数组
 *  @param percents          渐变颜色的占比数组
 *  @param gradientType     渐变色的类型
 */
- (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colorArr percentage:(NSArray *)percents gradientType:(GradientType)gradientType;


/// 压缩图片
/// @param image 原图片
/// @param newSize 压缩到的图片尺寸
/// @param KB 压缩的图片大小kb
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize targetKB: (NSInteger)KB;


/**
    创建二维码
    参数1：二维码目标字符串
    参数2：指定生成的大小size - 建议size的大小传imageView的大小
    参数3：添加的logo（可以为nil） - 其中logo的大小为size的5.0（默认， 也可以去修改pro）
 */
+ (UIImage *)codeWidthDataString:(NSString *)TargetString size:(CGFloat)size logo:(NSString *)logoName;


@end

NS_ASSUME_NONNULL_END
