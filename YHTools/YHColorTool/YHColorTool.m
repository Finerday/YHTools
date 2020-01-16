
#import <UIKit/UIKit.h>
#import "YHColorTool.h"

@implementation YHColorTool

+(UIColor *)yh_colorWithHex:(NSString *)hexColor
{
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 3) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"@\""]) {
        cString = [cString substringWithRange:NSMakeRange(2, cString.length-3)];
    }
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6 && [cString length] != 8 && [cString length] !=3&& [cString length] !=4)
        return [UIColor clearColor];
    
    if ([cString length] ==3 || [cString length] ==4) {//3位rgb
        NSString *a = @"";
        if (cString.length == 4) {
            a = [cString substringToIndex:1];
            cString = [cString substringFromIndex:1];
        }
        NSString *r = [cString substringToIndex:1];
        NSString *g = [cString substringWithRange:NSMakeRange(1, 1)];
        NSString *b = [cString substringFromIndex:2];
        cString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",a,a,r,r,g,g,b,b];
    }
    
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != cString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:cString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    
    CGFloat alphaValue = 1;
    if ([cString length]==8) {   //如果是8位，就那其中的alpha
        alphaValue = (float)(unsigned char)(colorCode>>24)/0xff;
    }
    
    return [UIColor colorWithRed: (float)redByte / 0xff
                           green: (float)greenByte/ 0xff
                            blue: (float)blueByte / 0xff
                           alpha:alphaValue];;
}

+(UIColor *)yh_colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha
{
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6 && [cString length] != 8)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    //a
    NSString *aString = @"ff";
    if ([cString length] == 8) {
        range.location = 6;
        aString = [cString substringWithRange:range];
    }
    // Scan values
    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+(UIColor *)yh_colorWithRGB:(float)red green:(float)green blue:(float)blue
{
    return [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:1];
}

+(UIColor *)yh_colorWithRGB:(float)red green:(float)green blue:(float)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:alpha];
}

@end
