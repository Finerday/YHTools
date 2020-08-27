//
//  YHAPPTool.h
//  MyTest
//
//  Created by ImFine on 2020/4/10.
//  Copyright © 2020 Fine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHAPPTool : NSObject

+(NSString*)app_displayName;// app名称
+(NSString*)app_version; // app版本
+(NSString*)app_build;// app build版本
+(NSString*)userPhoneName;//手机别名： 用户定义的名称
+(NSString*)userDeviceName;//设备名称
+(NSString*)userPhoneVersion;//手机系统版本
+(NSString*)userPhoneModel;//手机型号
+(NSString*)userLocalPhoneModel;//地方型号  （国际化区域名称）
+(NSString*)uuid;//手机序列号
+ (NSString *)userAgent;
+ (NSString *)urlScheme;//scheme

+ (NSString *)wifiName;//WiFi名字
+ (NSString *)wifiMac;//WiFi mac 名字
@end

NS_ASSUME_NONNULL_END
