

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHJudgeTool : NSObject
/**
 *判断是否为空字符串
*/
+(BOOL)yh_isEmptyStringWithString:(NSString *)string;
/**
 *判断手机格式
 */

+(BOOL)yh_isAvailableWithMobile:(NSString *)mobile;

/**
 *密码必须包含大小写字母、数字三种，长度为6-18位，不能包含特殊字符
*/

+(BOOL)yh_isAvailableWithPassword:(NSString *)password;

/**
 *判断邮箱格式
*/

+(BOOL)yh_isAvailableWithEmail:(NSString *)email;

/**
 *判断输入昵称
*/

+(BOOL)yh_isAvailableWithNickname:(NSString *)nickname;

/**
 *  验证输入金额
 *
 *  @param money 金额
 *
 *  @return 是否合法
 */
+(BOOL)yh_isValidateInputMoney:(NSString *)money;
/**
 *判断身份证号
*/
+(BOOL)yh_isAvailableWithIdentityCardNum:(NSString *)identityCard;


/// 判断是否是中文名字(可用于实名认证)
/// @param chineseName 名字
+(BOOL)yh_isAvailableWithChinsesName:(NSString *)chineseName;

/// 判断银行卡号是否正确
/// @param bankNumber 银行卡号
+(BOOL)yh_isAvailableWithBankNumber:(NSString *)bankNumber;

/**
 *自定义正则判断
*/
+ (BOOL)yh_isAvailableCustomeRegulerString:(NSString *)regulerString customeString:(NSString *)customeString;


@end

NS_ASSUME_NONNULL_END
