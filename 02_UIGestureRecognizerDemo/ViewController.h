//
//  ViewController.h
//  UIGestureRecognizerDemo02
//
//  Created by MS on 15-7-7.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 1.Demo实现效果:
   <1>tap点击实现视图动画缩放，然后还原
   <2>pan拖动实现视图跟随手势移动
   <3>pinch捏合实现视图跟随手指缩放
   <4>rotation旋转实现视图跟随手指旋转
   <5>通过手势代理，实现手势同时作用于视图，例：捏合和旋转同时发生
 2.手势识别器类:抽象基类UI_***_GestureRecognizer(iOS3.2)
   <1> UI_Tap_GestureRecognizer       点击 离散型
   <2> UI_Pan_GestureRecognizer       拖动 连续型
   <3> UI_Pinch_GestureRecognizer     捏合 连续型
   <4> UI_Rotation_GestureRecognizer  旋转 连续型
   <5> UI_Swipe_GestureRecognizer     擦碰 离散型 自研
   <6> UI_LongPress_GestureRecognizer 长按 连续型 自研
 
 */
@interface ViewController : UIViewController


@end

