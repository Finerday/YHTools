//
//  UILabel+YHTools.m
//  YHTools
//
//  Created by ImFine on 2020/1/14.
//  Copyright © 2020 ImFine. All rights reserved.
//

#import "UILabel+YHTools.h"

@implementation UILabel (YHTools)
//修改label行间距
-(void)yh_setLabelLineSpacingWithText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}
@end
