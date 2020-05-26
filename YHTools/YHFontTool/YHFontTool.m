
#import "YHFontTool.h"
#import <UIKit/UIKit.h>

@implementation YHFontTool

+(UIFont *)yh_DefaultSize:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+(UIFont *)yh_MediumSize:(float)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

+(UIFont *)yh_fontWithPingFangSCWithWeight:(YHPingFangSCFont)weight size:(float)size {
    if (weight == PingFangSCFontRegular) {
        return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    } else if (weight==PingFangSCFontMedium) {
        return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    }else if (weight==PingFangSCFontSemibold) {
        return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    }else if (weight==PingFangSCFontLight) {
        return [UIFont fontWithName:@"PingFangSC-Light" size:size];
    }else if (weight==PingFangSCFontUltralight) {
        return [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
    }else if (weight==PingFangSCFontThin) {
        return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
    }else{
        return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    }
}

+(UIFont *)yh_CustomeFont:(NSString *)fontname size:(float)size {
    return [UIFont fontWithName:fontname size:size];
}

@end
