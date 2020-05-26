//
//  UIImage+YHTool.m
//  MyTest
//
//  Created by ImFine on 2020/4/17.
//  Copyright © 2020 Fine. All rights reserved.
//

#import "UIImage+YHTool.h"

@implementation UIImage (YHTool)
+ (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colors percentage:(NSArray *)percents gradientType:(YHImageGradientType)gradientType {
    
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

//生成二维码
+(UIImage *)codeWidthDataString:(NSString *)TargetString size:(CGFloat)size{
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
    
    UIImage *targeImage = [self createNonInterpolatedUIimaegFormCIImage:outputImage withSize:size];
    
    return targeImage;
}

/**
* 根据CIImage生成指定大小的UIImage
*
* @param image CIImage
* @param size 图片宽度
*/
+ (UIImage *)createNonInterpolatedUIimaegFormCIImage:(CIImage *)image withSize:(CGFloat)size{
    
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
    return outputImage;
}
//根据某个视图,生成图片
+ (UIImage *)creatImageWith:(UIView *)view toSize:(CGSize)size {
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
