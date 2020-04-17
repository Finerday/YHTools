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

@property (nonatomic, copy)NSString *app_displayName;// app名称
@property (nonatomic, copy)NSString *app_version; // app版本
@property (nonatomic, copy)NSString *app_build;// app build版本
@property (nonatomic, copy)NSString *userPhoneName;//手机别名： 用户定义的名称
@property (nonatomic, copy)NSString *userDeviceName;//设备名称
@property (nonatomic, copy)NSString *userPhoneVersion;//手机系统版本
@property (nonatomic, copy)NSString *userPhoneModel;//手机型号
@property (nonatomic, copy)NSString *userLocalPhoneModel;//地方型号  （国际化区域名称）
@property (nonatomic, copy)NSString *uuid;//手机序列号

@end

NS_ASSUME_NONNULL_END
