

#import "YHJudgeTool.h"

@implementation YHJudgeTool
/**
 *判断是否为空字符串
*/
+ (BOOL)yh_isEmptyStringWithString:(NSString *)string
{
    if ([string length] == 0){
        NSLog(@"#### string length = 0");
        return YES;
    }
    
    if (string == nil){
        NSLog(@"#### string is nil");
        return YES;
    }
    
    if (string == Nil){
        NSLog(@"#### string is Nil");
        return YES;
    }
    
    if (string == NULL){
        NSLog(@"#### string is NULL");
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]){
        NSLog(@"#### string is Null");
        return YES;
    }
    
    if ([string isEqual:@""]){
        NSLog(@"#### string is eqeal @\"\"");
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0){
        NSLog(@"#### string is space");
        return YES;
    }
    return NO;
}
/**
 *判断手机格式（包括香港手机号的判断）
 */

+(BOOL)yh_isAvailableWithMobile:(NSString *)mobile
{
    NSString * phone = @"^((13[0-9])|(15[^4])|(18[0-9])|(17[0-8])|(19[0-9])|(147))\\d{8}$|^(5|6|8|9)\\d{7}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phone];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 *密码必须包含大小写字母，数字三种,长度为6-18位，不能包含特殊字符
*/

+(BOOL)yh_isAvailableWithPassword:(NSString *)password
{
    
    NSString * regex = @"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{6,18}$";
    NSPredicate * pas= [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pas evaluateWithObject:password];
}

/**
 *判断邮箱格式
*/

+(BOOL)yh_isAvailableWithEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
/**
 *判断输入昵称
*/

+(BOOL)yh_isAvailableWithNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4E00-\u9FA5\uf900-\ufa2d·s•]{2,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}
/**
 *判断身份证号
*/
+ (BOOL)yh_isAvailableWithIdentityCardNum:(NSString *)identityCard
{
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        return [identityCardPredicate evaluateWithObject:identityCard];
}

/**
 *自定义正则判断
*/

+ (BOOL)yh_isAvailableCustomeRegulerString:(NSString *)regulerString customeString:(NSString *)customeString {
    NSPredicate *customePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regulerString];
    return [customePredicate evaluateWithObject:customeString];
}
@end
