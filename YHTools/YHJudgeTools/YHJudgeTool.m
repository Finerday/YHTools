

#import "YHJudgeTool.h"

@implementation YHJudgeTool
/**
 *判断是否为空字符串
*/
+(BOOL)yh_isEmptyStringWithString:(NSString *)string
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
 *判断输入昵称,中英文数字昵称
*/

+(BOOL)yh_isAvailableWithNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}
/**
 *判断身份证号
*/
+(BOOL)yh_isAvailableWithIdentityCardNum:(NSString *)identityCard
{
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        return [identityCardPredicate evaluateWithObject:identityCard];
}
/// 判断是否是中文名字(可用于实名认证)
/// @param chineseName 名字
+(BOOL)yh_isAvailableWithChinsesName:(NSString *)chineseName {
    // 必须得是汉字
    NSString *regexString = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    
    return [predicate evaluateWithObject:chineseName];
}

/// 判断银行卡号是否正确
/// @param bankNumber 银行卡号
+(BOOL)yh_isAvailableWithBankNumber:(NSString *)bankNumber {
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[bankNumber length];
    int lastNum = [[bankNumber substringFromIndex:cardNoLength-1] intValue];
    
    bankNumber = [bankNumber substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankNumber substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
    
}

/**
 *自定义正则判断
*/

+(BOOL)yh_isAvailableCustomeRegulerString:(NSString *)regulerString customeString:(NSString *)customeString {
    NSPredicate *customePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regulerString];
    return [customePredicate evaluateWithObject:customeString];
}
@end
