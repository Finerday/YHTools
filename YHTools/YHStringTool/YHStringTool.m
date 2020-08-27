//
//  YHNSStringTool.m
//  MyTest
//
//  Created by ImFine on 2020/6/3.
//  Copyright © 2020 Fine. All rights reserved.
//

#import "YHStringTool.h"
#import <CommonCrypto/CommonDigest.h>


@implementation YHStringTool
///生成特定长度随机字符串
+(NSString *)yh_randomStringWithLength:(NSInteger)length {
    //3.随机字符串kRandomLength位
    static const NSString *kRandomAlphabet = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [randomString appendFormat: @"%C", [kRandomAlphabet characterAtIndex:arc4random_uniform((u_int32_t)[kRandomAlphabet length])]];
    }
    return randomString;
}
///生成32位的md5加字符串
+(NSString *)yh_MD5ForUpper32BateWith:(NSString *)sourceString {
    //要进行UTF8的转码
       const char* input = [sourceString UTF8String];
       unsigned char result[CC_MD5_DIGEST_LENGTH];
       CC_MD5(input, (CC_LONG)strlen(input), result);

       NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
       for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
           [digest appendFormat:@"%02X", result[i]];
       }

       return digest;
}
///计算文字高度
+(CGSize )yh_calculateText:(NSString *)text Width:(CGFloat)width font:(UIFont *)font
{
    CGSize size =  [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName : font}
                                      context:nil].size;
    size.height = size.height + 1.5;
    return size;
}

///字符串encode
+ (NSString *)encodeString:(NSString *)unencodedString
{
       if([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
       {

           return[unencodedString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

       }
       
       NSString*encodedString = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)unencodedString,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));

       return encodedString;

}
@end
