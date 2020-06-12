//
//  NSDate+YHTool.h
//  MyTest
//
//  Created by ImFine on 2020/6/2.
//  Copyright © 2020 Fine. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YHTool)
#pragma mark - 获取日
+ (NSInteger)yh_day:(NSDate *)date;
#pragma mark - 获取月
+ (NSInteger)yh_month:(NSDate *)date;
#pragma mark - 获取年
+ (NSInteger)yh_year:(NSDate *)date;
#pragma mark - 获取当月第一天周几
+ (NSInteger)yh_firstWeekdayInThisMonth:(NSDate *)date ;
#pragma mark - 获取当前月有多少天
+ (NSInteger)yh_totaldaysInMonth:(NSDate *)date;
#pragma mark -- 获取date农历信息
+ (NSDictionary*)yh_getChineseCalendarWithDate:(NSDate*)dateTemp Year:(NSInteger)myYear Month:(NSInteger)myMonth Day:(NSInteger)myDay;
#pragma mark -- 是否属于同一天判断
+ (BOOL)yh_isInSameDay:(NSDate*)date1 time2:(NSDate*)date2;
#pragma mark -- 比较两个时间的大小
+ (int)yh_compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay formatter:(NSString *)formatter;


/// 获取其他时间的现在时间日期
+ (NSString *)yh_getCurrentDate:(NSDate *)date isAdvance:(BOOL )isAdvance;

#pragma mark -- 获取时间戳
+ (NSString *)yh_getNowTimeTimestamp:(NSDate *)date;
+ (NSString *)yh_getweekDayStringWithDate:(NSDate *) date;
@end

NS_ASSUME_NONNULL_END
