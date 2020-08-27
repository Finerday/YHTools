//
//  YHNSStringTool.h
//  MyTest
//
//  Created by ImFine on 2020/6/3.
//  Copyright © 2020 Fine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHStringTool : NSObject
///生成特定长度随机字符串
+(NSString *)yh_randomStringWithLength:(NSInteger)length;
///生成32位的md5加字符串
+(NSString *)yh_MD5ForUpper32BateWith:(NSString *)sourceString;
///计算文字高度
+(CGSize )yh_calculateText:(NSString *)text Width:(CGFloat)width font:(UIFont *)font;
///对字符串进行encode编码
+ (NSString *)encodeString:(NSString *)unencodedString;
@end

NS_ASSUME_NONNULL_END
