//
//  JBClipImageTool.h
//  闪屏分割
//
//  Created by Biao on 16/4/24.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBClipImageTool : UIImageView

/**
 *  @author Biao
 *
 *  @param view            要添加到当前view
 *  @param image           要进行裁剪的图片
 *  @param backgroundImaeg 可以设置背景图片
 */
+ (void)addToCurrentView:(UIView *)view clipImage:(UIImage *)image andBackgroundImage:(NSString *)backgroundImaeg;

@end
