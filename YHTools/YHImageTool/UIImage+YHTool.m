//
//  UIImage+YHTool.m
//  MyTest
//
//  Created by ImFine on 2020/4/17.
//  Copyright © 2020 Fine. All rights reserved.
//

#import "UIImage+YHTool.h"
static CGFloat pro = 5.0;

@implementation UIImage (YHTool)
+ (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colors percentage:(NSArray *)percents gradientType:(GradientType)gradientType {
    
    NSAssert(percents.count <= 5, @"输入颜色数量过多，如果需求数量过大，请修改locations[]数组的个数");
    
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    
//    NSUInteger capacity = percents.count;
//    CGFloat locations[capacity];
    CGFloat locations[5];
    for (int i = 0; i < percents.count; i++) {
        locations[i] = [percents[i] floatValue];
    }

    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, locations);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientFromTopToBottom:
            start = CGPointMake(imageSize.width/2, 0.0);
            end = CGPointMake(imageSize.width/2, imageSize.height);
            break;
        case GradientFromLeftToRight:
            start = CGPointMake(0.0, imageSize.height/2);
            end = CGPointMake(imageSize.width, imageSize.height/2);
            break;
        case GradientFromLeftTopToRightBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, imageSize.height);
            break;
        case GradientFromLeftBottomToRightTop:
            start = CGPointMake(0.0, imageSize.height);
            end = CGPointMake(imageSize.width, 0.0);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}



#pragma mark- 对图片进行压缩
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize targetKB: (NSInteger)KB
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    NSData *data = UIImageJPEGRepresentation(newImage, 1);
    
    //kb为0时没有设定图片必须小于某个数
    if (KB != 0) {
        while (data.length/1024 > KB) {
            
            //1.改变size的方法压缩
            // Create a graphics image context
            newSize = CGSizeMake(newSize.width*.8, newSize.height*.8);
            UIGraphicsBeginImageContext(newSize);
            
            // Tell the old image to draw in this new context, with the desired
            // new size
            [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            
            // Get the new image from the context
            newImage = UIGraphicsGetImageFromCurrentImageContext();
            
            // End the context
            UIGraphicsEndImageContext();
            
            data = UIImageJPEGRepresentation(newImage, 1);
            
        }
    }
    
    return newImage;
}


+(UIImage *)codeWidthDataString:(NSString *)TargetString size:(CGFloat)size logo:(NSString *)logoName{
    //1、创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //2、过滤器恢复默认
    [filter setDefaults];
    //3、给过滤器添加数据（数据要转化成UTF8）
    NSData *data = [TargetString dataUsingEncoding:NSUTF8StringEncoding];
    //4、通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    //5、获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    
    UIImage *targeImage = [self createNonInterpolatedUIimaegFormCIImage:outputImage withSize:size logo:(logoName != nil ? logoName : nil)];
    
    return targeImage;
}


+ (UIImage *)createNonInterpolatedUIimaegFormCIImage:(CIImage *)image withSize:(CGFloat)size logo:(NSString *)logoName{
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));
    
    //1、创建bitMap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    //2、保存bitImage图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    //生成logo
    BOOL logo = logoName != nil ? YES : NO;
    if (logo) {
        UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
        [outputImage drawInRect:CGRectMake(0, 0, size, size)];
//        UIImage *waterImage = [UIImage imageNamed:logoName];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
//        [imageView sd_setImageWithURL:[NSURL URLWithString:logoName]];
//        UIImage *waterImage = [UIImage imageNamed:logoName];
          UIImage *waterImage = imageView.image;

        //注意：logo不能太大（最大不能超过二维码图片的30%），否则扫描不出来
        [waterImage drawInRect:CGRectMake((size - size / pro) / 2., (size - size / pro) / 2., size / pro, size / pro)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        outputImage = newImage;
    }
    
    return outputImage;
}

@end
