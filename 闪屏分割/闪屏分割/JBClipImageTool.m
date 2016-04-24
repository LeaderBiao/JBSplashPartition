//
//  JBClipImageTool.m
//  闪屏分割
//
//  Created by Biao on 16/4/24.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import "JBClipImageTool.h"

#define Width view.frame.size.width
#define Height view.frame.size.height
#define imageW image.size.width
#define imageH image.size.height * 0.5

@implementation JBClipImageTool

+ (void)addToCurrentView:(UIView *)view clipImage:(UIImage *)image andBackgroundImage:(NSString *)backgroundImaeg
{
    /**
     *  @author Biao
     *
     *  上半部
     */
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, Height * 0.5)];
    topImageView.image = [self clipImage:image withRect:CGRectMake(0, 0, imageW, imageH)];
    
    /**
     *  @author Biao
     *
     *  下半部
     */
    UIImageView *bottomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, Height * 0.5, Width, Height * 0.5)];
    bottomImageView.image = [self clipImage:image withRect:CGRectMake(0, imageH, imageW, imageH)];
    
    /**
     *  @author Biao
     *
     *  延时操作
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //执行动画
        [UIView animateWithDuration:2.0f animations:^{
            CGRect topRect = topImageView.frame;
            topRect.origin.y -= imageH;
            topImageView.frame = topRect;
            
            CGRect bottomRect = bottomImageView.frame;
            bottomRect.origin.y += imageH;
            bottomImageView.frame = bottomRect;
        }];
    });
    
    /**
     *  @author Biao
     *
     *  背景图
     */
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:view.bounds];
    bgImage.image = [UIImage imageNamed:backgroundImaeg];
    
    /**
     *  @author Biao
     *
     *  添加到视图
     */
    [view addSubview:bgImage];
    [view addSubview:topImageView];
    [view addSubview:bottomImageView];
    
}

/**
 *  @author Biao
 *
 *  返回裁剪后的图片
 */
+ (UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect
{
    CGRect clipFrame = rect;
    CGImageRef refImage = CGImageCreateWithImageInRect(image.CGImage, clipFrame);
    UIImage *newImage = [UIImage imageWithCGImage:refImage];
    CGImageRelease(refImage);
    return newImage;
}


@end
