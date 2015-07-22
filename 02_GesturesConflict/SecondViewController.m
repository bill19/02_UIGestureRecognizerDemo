//
//  SecondViewController.m
//  UIGestureRecognizerDemo02
//
//  Created by MS on 15-7-9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "SecondViewController.h"
#import "UIDoubleTapGesureRecognizer.h"

@interface SecondViewController ()
{
    //猪头图片控件
    UIImageView *_imvPig;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载猪头图片控件
    _imvPig = [[UIImageView alloc] init];
    _imvPig.frame = CGRectMake(120, 120, 100, 100);
    _imvPig.image = [UIImage imageNamed:@"pigEyeOpen0.png"];
    _imvPig.userInteractionEnabled = YES;
    [self.view addSubview:_imvPig];
    
    //创建自定义双击手势
    UIDoubleTapGesureRecognizer *doubleTap = [[UIDoubleTapGesureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [_imvPig addGestureRecognizer:doubleTap];
}


/*
  1.发散:如下编码，直接使用了图片控件全局变量来切换｜image｜
    这样写法的好处和坏处是什么？
  2.进阶:能否去除全局成员变量图片控件，实现同样效果?
 */
//轻击两次手势响应方法
- (void)doubleTap:(UIDoubleTapGesureRecognizer *)doubleTap
{
    //状态标识，双击1次换图，再双击1次，再换回原图
    static BOOL imgSign = YES;
    if (imgSign) {
        //切换捣蛋猪的睁眼图
        _imvPig.image = [UIImage imageNamed:@"pigEyeOpen1.png"];
    }else {
        //切换捣蛋猪的闭眼图
        _imvPig.image = [UIImage imageNamed:@"pigEyeOpen0.png"];
    }
    //更改状态标识
    imgSign = !imgSign;
}

@end
