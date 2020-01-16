
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHColorTool : NSObject

/**
 *  通过十六进制字符串来确定颜色
 *
 *  @param hexColor 十六进制字符串，比如：#2f87b9、0x2f87b9和2f87b9
 *
 *  @return 对应的颜色值
 */
+ (UIColor *) yh_colorWithHex:(NSString*) hexColor;

+ (UIColor *) yh_colorWithHex:(NSString*) hexColor alpha:(CGFloat)alpha;

+ (UIColor *) yh_colorWithRGB:(float)red green:(float)green blue:(float)blue;

+ (UIColor *) yh_colorWithRGB:(float)red green:(float)green blue:(float)blue alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
