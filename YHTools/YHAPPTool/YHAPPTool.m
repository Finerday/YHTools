
//
//  YHAPPTool.m
//  MyTest
//
//  Created by ImFine on 2020/4/10.
//  Copyright © 2020 Fine. All rights reserved.
//

#import "YHAPPTool.h"

@implementation YHAPPTool

- (NSString *)app_displayName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
}

- (NSString *)app_version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

- (NSString *)app_build {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_Build;
}

- (NSString *)uuid {
    NSUUID *uuidString =[[UIDevice currentDevice] identifierForVendor];
    return uuidString.UUIDString;
}

- (NSString *)userPhoneName {
    return  [[UIDevice currentDevice] name];
}

- (NSString *)userDeviceName {
    return [[UIDevice currentDevice] systemName];
}

- (NSString *)userPhoneVersion {
    return [[UIDevice currentDevice] systemVersion];
}

- (NSString *)userPhoneModel {
    return [[UIDevice currentDevice] model];
}

- (NSString *)userLocalPhoneModel {
    return [[UIDevice currentDevice] localizedModel];
}

@end
