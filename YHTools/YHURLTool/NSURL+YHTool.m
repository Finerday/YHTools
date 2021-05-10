//
//  NSURL+YHTool.m
//  MyTest
//
//  Created by ImFine on 2020/12/10.
//  Copyright © 2020 Fine. All rights reserved.
//

#import "NSURL+YHTool.h"
#import <objc/runtime.h>

@implementation NSURL (YHTool)
/**
 *url中包含特殊字符
 */
+ (void)load {
    /*
     self:UIImage
     谁的事情,谁开头 1.发送消息(对象:objc) 2.注册方法(方法编号:sel) 3.交互方法(方法:method) 4.获取方法(类:class)
     Method:方法名
     
     获取方法,方法保存到类
     Class:获取哪个类方法
     SEL:获取哪个方法
     imageName
     */
    // 获取imageName:方法的地址
    Method URLWithStringMethod = class_getClassMethod(self, @selector(URLWithString:));
    
    // 获取sc_imageWithName:方法的地址
    Method yh_URLWithStringMethod = class_getClassMethod(self, @selector(yh_URLWithString:));
    
    // 交换方法地址，相当于交换实现方式2
    method_exchangeImplementations(URLWithStringMethod, yh_URLWithStringMethod);
    
}

//对于包含特殊字符的url进行utf8编码
+ (NSURL *)yh_URLWithString:(NSString *)URLString {
    return [NSURL yh_URLWithString:[URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
}

@end
