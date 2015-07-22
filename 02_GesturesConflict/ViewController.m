//
//  ViewController.m
//  GesturesConflict
//
//  Created by MS on 15-7-9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载红色图片控件
    UIImageView *imvRed = [[UIImageView alloc] init];
    imvRed.image = [UIImage imageNamed:@"red.png"];
    imvRed.frame = CGRectMake(120, 120, 100, 100);
    [self.view addSubview:imvRed];
    imvRed.userInteractionEnabled = YES;
    
    //创建tap1次手势
    UITapGestureRecognizer *tap1Ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGes:)];
    [imvRed addGestureRecognizer:tap1Ges];
    
    //创建tap2次手势
    UITapGestureRecognizer *tap2Ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGes:)];
    tap2Ges.numberOfTapsRequired = 2;
    [imvRed addGestureRecognizer:tap2Ges];
    
    /*
     1.把代码注释掉，查看效果
     2.注意手势依赖的顺序
     3.尝试下[tap2Ges requireGestureRecognizerToFail:tap1Ges];
     4.能否把两个手势响应方法，转化成一个方法
     */
    //在tap2次失败的时候才开始监听tap1次手势
    [tap1Ges requireGestureRecognizerToFail:tap2Ges];
    
    //加载第2个页面barbtn
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nextPage)];
    self.navigationItem.rightBarButtonItem = barBtn;
}

//轻按1次相应方法
- (void)singleTapGes:(UITapGestureRecognizer *)tap
{
    NSLog(@"轻按1次响应");
}

//轻按2次相应方法
- (void)doubleTapGes:(UITapGestureRecognizer *)tap
{
    NSLog(@"轻按2次响应");
}

//push下一个页面
- (void)nextPage
{
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    secondVc.title = @"自定义双击手势";
    [self.navigationController pushViewController:secondVc animated:YES];
}

@end
