
//
//  YHAPPTool.m
//  MyTest
//
//  Created by ImFine on 2020/4/10.
//  Copyright © 2020 Fine. All rights reserved.
//

#import "YHAPPTool.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreTelephony/CTCarrier.h>
#import <objc/message.h>
#import <sys/utsname.h>

@implementation YHAPPTool

+ (NSString *)app_displayName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
}

+ (NSString *)app_version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSString *)app_build {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_Build;
}

+ (NSString *)uuid {
    NSUUID *uuidString =[[UIDevice currentDevice] identifierForVendor];
    return uuidString.UUIDString;
}

+ (NSString *)userPhoneName {
    return  [[UIDevice currentDevice] name];
}

+ (NSString *)userDeviceName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)userPhoneVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)userPhoneModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)userLocalPhoneModel {
    return [[UIDevice currentDevice] localizedModel];
}

+ (NSString *)userAgent {
    static NSString *userAgent = nil;

    if (!userAgent) {
    }
    return userAgent;
}

+ (NSString *)urlScheme {
    static NSString *scheme = nil;

    if (!scheme) {
        NSBundle *bundle = [NSBundle mainBundle];
        scheme = [bundle objectForInfoDictionaryKey:@"CFBundleURLTypes"][0][@"CFBundleURLSchemes"][0];
    }
    return scheme;
}

+ (NSString *)wifiName
{
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef) ifname);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dic = (NSDictionary *)info;
    NSString *ssid = [[dic objectForKey:@"SSID"] lowercaseString];
    
    return ssid;
}

+ (NSString *)wifiMac
{
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef) ifname);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary * dic = (NSDictionary *)info;
    NSString * bssid = [dic objectForKey:@"BSSID"];
    
    return bssid;
}


@end
