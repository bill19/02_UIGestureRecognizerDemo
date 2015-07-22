//
//  UIDoubleTapGesureRecognizer.m
//  UIGestureRecognizerDemo02
//
//  Created by MS on 15-7-9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "UIDoubleTapGesureRecognizer.h"
//注意头文件引用
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation UIDoubleTapGesureRecognizer
//双击结束后触发操作，如下方法不需要重写
//请尝试在里面更改属性，看外界方法是否响应
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__FUNCTION__);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__FUNCTION__);
}
 */


//利用UITouch对象中的属性，实现快捷定义双击
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    /*
     1.touches.count  确定手指的数量
     2.touch.tapCount 确定在短时间内点击屏幕的次数（系统封装了计算方法，和双击时间）
     3.touch.phase    注意区分touch的状态和手势的状态
     */
    if (touches.count == 1 && touch.tapCount == 2 && touch.phase == UITouchPhaseEnded) {
        //切换手势状态，触发外界响应的手势方法
        self.state = UIGestureRecognizerStateEnded;
    }
}
//要注意考虑具体情况，考虑是否需要处理
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.state = UIGestureRecognizerStateCancelled;
    NSLog(@"%s",__FUNCTION__);
}
@end
