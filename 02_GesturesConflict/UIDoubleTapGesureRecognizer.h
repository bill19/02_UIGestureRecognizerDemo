//
//  UIDoubleTapGesureRecognizer.h
//  UIGestureRecognizerDemo02
//
//  Created by MS on 15-7-9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1.效果
   <1>手指:一根手指
   <2>次数:连按两次
 2.注意实现文件中,引用头文件#import <UIKit/UIGestureRecognizerSubclass.h>,类扩展方法
 3.覆写类扩展中的方法,更改手势属性｜state｜状态，枚举类型:UIGestureRecognizerState
 4.目标:掌握私人定制手势的要领
 */
@interface UIDoubleTapGesureRecognizer : UIGestureRecognizer

@end
