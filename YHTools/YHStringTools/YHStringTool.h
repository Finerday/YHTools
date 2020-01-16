

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHStringTool : NSObject
/**
 *判断是否为空字符串
*/
+ (BOOL)yh_isEmptyStringWithString:(NSString *)string;
/**
 *判断手机格式（包括香港手机号的判断
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
 *判断身份证号
*/
- (BOOL)yh_isAvailableWithIdentityCardNum:(NSString *)identityCard;
@end

NS_ASSUME_NONNULL_END
