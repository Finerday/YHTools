//
//  UILabel+YHTools.m
//  YHTools
//
//  Created by ImFine on 2020/1/14.
//  Copyright © 2020 ImFine. All rights reserved.
//

#import "UILabel+YHTool.h"

@implementation UILabel (YHTool)

/// 設置文字間距
-(void)yh_setLabelTextSpacing:(CGFloat)spacing {
    // 設置文字間距原理是在每一個字符串後面添加一個空白的間距,這樣會使得居中出現問題
       // text = [NSString stringWithFormat:@" %@",text]; 錯誤方式,就算空白字符串,也會佔用寬度,居中有偏差
       // 正確解決辦法就是在xib中設置居中偏移量為 + spacing/2.0
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSKernAttributeName:@(spacing)}];
       NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
       [paragraphStyle setAlignment:self.textAlignment];
       [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length]-1)];
    self.attributedText = attributedString;
}


//修改label行间距
-(void)yh_setLabelLineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01) {
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}
@end
