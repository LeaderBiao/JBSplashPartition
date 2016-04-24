//
//  ViewController.m
//  闪屏分割
//
//  Created by Biao on 16/4/24.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import "ViewController.h"
#import "JBClipImageTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"Default_image"];
    [JBClipImageTool addToCurrentView:self.view clipImage:image andBackgroundImage:@"bgImage"];
    
    
}

@end
