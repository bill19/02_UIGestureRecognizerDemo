//
//  ViewController.m
//  UIGestureRecognizerDemo02
//
//  Created by MS on 15-7-7.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
//蓝色图片视图，加载系统手势
@property(nonatomic,strong) UIImageView *imvBlue;
@end

@implementation ViewController

//根据图片名字，返回相应img，否则返回nil，不采用系统缓存
- (UIImage *)loadImgForImgName:(NSString *)name
{
    //初始化返回img局部变量
    UIImage *reImg = nil;
    //获取图片路径
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    //如果图片存在，则获取img
    if (imgPath) {
        //类方法读取图片文件
        reImg = [UIImage imageWithContentsOfFile:imgPath];
    }
    //返回
    return reImg;
}

- (UIImageView *)imvBlue
{
    if (!_imvBlue) {
        UIImage *imgBlue = [self loadImgForImgName:@"blue@2x"];
        _imvBlue = [[UIImageView alloc] initWithImage:imgBlue];
    }
    return _imvBlue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载蓝色imv
    self.imvBlue.frame = CGRectMake(120, 120, 100, 100);
    [self.view addSubview:self.imvBlue];
    //设置和用户为YES
    self.imvBlue.userInteractionEnabled = YES;
    
    //给蓝色imv添加点击手势
    UITapGestureRecognizer *tapBlue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBlueClicked:)];
    //需要手指的数量，默认是1，表示单指点击
    tapBlue.numberOfTouchesRequired = 1;
    //需要点击的次数，默认是1，表示单击
    tapBlue.numberOfTapsRequired = 1;
    //视图控件增加手势
    [self.imvBlue addGestureRecognizer:tapBlue];
    
    //给蓝色imv添加拖动手势
    UIPanGestureRecognizer *panBlue = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panBlueClicked:)];
    //需要拖动手指的最少数量，默认是1，表示单指拖多
    panBlue.minimumNumberOfTouches = 1;
    [self.imvBlue addGestureRecognizer:panBlue];
    
    //给蓝色imv添加捏合手势
    UIPinchGestureRecognizer *pinchBlue = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchBlueClicked:)];
    [self.imvBlue addGestureRecognizer:pinchBlue];
    
    //给蓝色imv增加旋转手势
    UIRotationGestureRecognizer *rotationBlue = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationBlueClicked:)];
    rotationBlue.delegate = self;
    [self.imvBlue addGestureRecognizer:rotationBlue];
}
#pragma mark - GestureMethod
//蓝色图片点击手势执行方法
- (void)tapBlueClicked:(UITapGestureRecognizer *)tap
{
    //执行动画，视图缩放2倍大小，动画结束后改变至原样
    [UIView animateWithDuration:0.8 animations:^{
        /*
          注意细节，手势获取view这个属性的讲解
         */
        tap.view.transform = CGAffineTransformScale(tap.view.transform, 2.0, 2.0);
    }completion:^(BOOL finished) {
        tap.view.transform = CGAffineTransformIdentity;
    }];
}

//蓝色图片拖动手势，蓝色图片和拖动手势一起移动
- (void)panBlueClicked:(UIPanGestureRecognizer *)pan
{
    //获取拖动偏移量（用点计算）
    /*
     思考： CGPoint offsetPoint = [pan translationInView:pan.view];
           会是什么效果？？
     */
    CGPoint offsetPoint = [pan translationInView:self.view];
    //从手势获取添加手势的视图view对象
    UIView *panView = pan.view;
    //重新设置视图的中心，以使视图随手势一起移动
    panView.center = CGPointMake(panView.center.x + offsetPoint.x, panView.center.y + offsetPoint.y);
    //重置偏移量(否则偏移量会一直累加)
    [pan setTranslation:CGPointZero inView:pan.view];
}

//蓝色图片捏合手势，实现视图跟随手指进行缩放
- (void)pinchBlueClicked:(UIPinchGestureRecognizer *)pinch
{
    //从手势获取添加手势的视图view对象
    UIView *pinchView = pinch.view;
    pinchView.transform = CGAffineTransformScale(pinchView.transform, pinch.scale, pinch.scale);
    //重置缩放系数（参考拖动手势理解）
    pinch.scale = 1.0;
}

//蓝色图片旋转手势，实现视图跟随手势进行旋转
- (void)rotationBlueClicked:(UIRotationGestureRecognizer *)rotation
{
    //从手势获取添加手势的视图view对象
    UIView *rotationView = rotation.view;
    rotationView.transform = CGAffineTransformRotate(rotationView.transform, rotation.rotation);
    //重置旋转角度（参考拖动手势理解）
    rotation.rotation = 0.0;
}

#pragma mark - UIGestureRecognizerDelegate
//返回YES，则两手势允许同时发生，返回NO，不允许两手势同时发生
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //可以根据具体情景返回YES或NO
    if ([gestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) {
        return YES;
    }else {
        return NO;
    }
}

@end
