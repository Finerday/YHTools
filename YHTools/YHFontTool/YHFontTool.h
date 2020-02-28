
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *字体的枚举类
 *
 */
typedef enum : NSUInteger {
    PingFangSCFontRegular,
    PingFangSCFontMedium,
    PingFangSCFontSemibold,
    PingFangSCFontLight,
    PingFangSCFontUltralight,
    PingFangSCFontThin,
} PingFangSCFont;

@interface YHFontTool : NSObject

+(UIFont *)yh_DefaultSize:(float)size;

+(UIFont *)yh_MediumSize:(float)size;

+(UIFont *)yh_fontWithPingFangSCWithWeight:(PingFangSCFont)weight size:(float)size;

+(UIFont *)yh_CustomeFont:(NSString *)fontname size:(float)size;

@end

NS_ASSUME_NONNULL_END
