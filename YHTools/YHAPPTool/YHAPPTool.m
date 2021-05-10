
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

+ (NSString *)deviceName {
    static NSDictionary *deviceNamesByCode = nil;
    static NSString *deviceName = nil;

    if (deviceName) {
        return deviceName;
    }

    deviceNamesByCode = @{
                         @"i386"      :@"Simulator",
                         @"x86_64"    :@"Simulator",
                         @"iPod1,1"   :@"iPod Touch",        // (Original)
                         @"iPod2,1"   :@"iPod Touch 2G",     // (Second Generation)
                         @"iPod3,1"   :@"iPod Touch 3G",     // (Third Generation)
                         @"iPod4,1"   :@"iPod Touch 5G",     // (Fourth Generation)
                         @"iPod5,1"   :@"iPod Touch 5G",     // (Fifth Generation)
                         @"iPod7,1"   :@"iPod Touch 6G",     // (6th Generation)
                         @"iPhone1,1" :@"iPhone",            // (Original)
                         @"iPhone1,2" :@"iPhone 3G",         // (3G)
                         @"iPhone2,1" :@"iPhone 3GS",        // (3GS)
                         @"iPhone3,1" :@"iPhone 4",          // (GSM)
                         @"iPhone3,2" :@"iPhone 4",          // (GSM)
                         @"iPhone3,3" :@"iPhone 4",          // (CDMA/Verizon/Sprint)
                         @"iPhone4,1" :@"iPhone 4S",         //
                         @"iPhone5,1" :@"iPhone 5",          // (model A1428, AT&T/Canada)
                         @"iPhone5,2" :@"iPhone 5",          // (model A1429, everything else)
                         @"iPhone5,3" :@"iPhone 5c",         // (model A1456, A1532 | GSM)
                         @"iPhone5,4" :@"iPhone 5c",         // (model A1507, A1516, A1526 (China), A1529 | Global)
                         @"iPhone6,1" :@"iPhone 5s",         // (model A1433, A1533 | GSM)
                         @"iPhone6,2" :@"iPhone 5s",         // (model A1457, A1518, A1528 (China), A1530 | Global)
                         @"iPhone7,1" :@"iPhone 6 Plus",     //
                         @"iPhone7,2" :@"iPhone 6",          //
                         @"iPhone8,1" :@"iPhone 6S",         //
                         @"iPhone8,2" :@"iPhone 6S Plus",    //
                         @"iPhone8,4" :@"iPhone SE",         //
                         @"iPhone9,1" :@"iPhone 7",          //
                         @"iPhone9,2" :@"iPhone 7 Plus",     //
                         @"iPhone9,3" :@"iPhone 7",          //
                         @"iPhone9,4" :@"iPhone 7 Plus",     //
                         @"iPhone10,1" :@"iPhone 8",
                         @"iPhone10,2" :@"iPhone 8 Plus",
                         @"iPhone10,3" :@"iPhone X",
                         @"iPhone10,4" :@"iPhone 8",
                         @"iPhone10,5" :@"iPhone 8 Plus",
                         @"iPhone10,6" :@"iPhone X",
                         @"iPhone11,2" :@"iPhone Xs",
                         @"iPhone11,4" :@"iPhone Xs Max",
                         @"iPhone11,6" :@"iPhone Xs Max",
                         @"iPhone11,8" :@"iPhone XR",
                         @"iPhone12,1" :@"iPhone 11",
                         @"iPhone12,3" :@"iPhone 11 Pro",
                         @"iPhone12,5" :@"iPhone 11 Pro Max",
                         
                         @"iPad1,1"   :@"iPad",              // (Original)
                         @"iPad2,1"   :@"iPad 2",            // (2nd Generation)
                         @"iPad2,2"   :@"iPad 2",            // (2nd Generation)
                         @"iPad2,3"   :@"iPad 2",            // (2nd Generation)
                         @"iPad2,4"   :@"iPad 2",            // (2nd Generation)
                         @"iPad3,1"   :@"iPad 3",            // (3rd Generation)
                         @"iPad3,2"   :@"iPad 3",            // (3rd Generation)
                         @"iPad3,3"   :@"iPad 3",            // (3rd Generation)
                         @"iPad3,4"   :@"iPad 4",            // (4th Generation)
                         @"iPad3,5"   :@"iPad 4",            // (4th Generation)
                         @"iPad3,6"   :@"iPad 4",            // (4th Generation)
                         @"iPad4,1"   :@"iPad Air",          // 5th Generation iPad (iPad Air) - Wifi
                         @"iPad4,2"   :@"iPad Air",          // 5th Generation iPad (iPad Air) - Cellular
                         @"iPad4,3"   :@"iPad Air",          // 5th Generation iPad (iPad Air) - Cellular
                         @"iPad5,3"   :@"iPad Air 2",        // iPad Air 2
                         @"iPad5,4"   :@"iPad Air 2",        // iPad Air 2
                         @"iPad6,7"   :@"iPad Pro (12.9\")", // iPad Pro 12.9 inches - (model A1584)
                         @"iPad6,8"   :@"iPad Pro (12.9\")", // iPad Pro 12.9 inches - (model A1652)
                         @"iPad6,3"   :@"iPad Pro (9.7\")",  // iPad Pro 9.7 inches - (model A1673)
                         @"iPad6,4"   :@"iPad Pro (9.7\")",  // iPad Pro 9.7 inches - (models A1674 and A1675)
                         @"iPad2,5"   :@"iPad Mini",         // (Original)
                         @"iPad2,6"   :@"iPad Mini",         // (Original)
                         @"iPad2,7"   :@"iPad Mini",         // (Original)
                         @"iPad4,4"   :@"iPad Mini 2",       // (2nd Generation iPad Mini - Wifi)
                         @"iPad4,5"   :@"iPad Mini 2",       // (2nd Generation iPad Mini - Cellular)
                         @"iPad4,6"   :@"iPad Mini 2",       // (2nd Generation iPad Mini)
                         @"iPad4,7"   :@"iPad Mini 3",       // (3rd Generation iPad Mini - Wifi (model A1599))
                         @"iPad4,8"   :@"iPad Mini 3",       // (3rd Generation iPad Mini)
                         @"iPad4,9"   :@"iPad Mini 3",       // (3rd Generation iPad Mini)
                         @"iPad5,1"   :@"iPad Mini 4",       // (4th Generation iPad Mini)
                         @"iPad5,2"   :@"iPad Mini 4"        // (4th Generation iPad Mini)
                         };

    struct utsname systemInfo;


    uname(&systemInfo);

    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    deviceName = [deviceNamesByCode objectForKey:code];

    if (!deviceName) {   // Not found in database. At least guess main device type from string contents:
        if ([code rangeOfString:@"iPod"].location != NSNotFound) {
            deviceName = @"iPod Touch";
        } else if ([code rangeOfString:@"iPad"].location != NSNotFound) {
            deviceName = @"iPad";
        } else if ([code rangeOfString:@"iPhone"].location != NSNotFound) {
            deviceName = @"iPhone";
        } else {
            deviceName = @"Simulator";
        }
    }
 

    return deviceName;
}

@end
