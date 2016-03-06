//
//  ViewController.m
//  frame-Demo
//
//  Created by zyh on 16/3/6.
//  Copyright © 2016年 zyh. All rights reserved.
//

//小格之间的间距
#define MARGIN 5
//最大行数
#define MAXROW 5
//最大列数
#define MAXCOL 4

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *rTextField;
@property (weak, nonatomic) IBOutlet UITextField *cTextField;
@property (weak, nonatomic) IBOutlet UITextField *wTextField;
@property (weak, nonatomic) IBOutlet UITextField *hTextField;

//最后需要显示的view
@property (nonatomic, strong) UIView *image;
//每个小方格的宽
@property (nonatomic, assign) CGFloat W;
//每个小方格的高
@property (nonatomic, assign) CGFloat H;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景view
    UIView *bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    bigView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bigView];
    
    //竖着的分割线的宽度
    CGFloat marginRW = MARGIN;
    //竖着的分割线的高度
    CGFloat marginRH = bigView.frame.size.height;
    //横着的分割线的宽度
    CGFloat marginCW = bigView.frame.size.width;
    //横着的分割线的高度
    CGFloat marginCH = MARGIN;
    
    //每个小方格的宽度
    self.W = (bigView.frame.size.width - (MAXCOL - 1)*marginRW) / MAXCOL;
    //每个小方格的高度
    self.H = (bigView.frame.size.height - (MAXROW - 1)*marginCH) / MAXROW;
    
    //设置横的分割线
    for (NSInteger i = 0; i < MAXROW-1; i++) {
        UIView *marginHView = [[UIView alloc] initWithFrame:CGRectMake(0, (self.H*(i+1) + i*marginCH), marginCW, marginCH)];
        marginHView.backgroundColor = [UIColor blackColor];
        [bigView addSubview:marginHView];
    }

    //设置竖的分割线
    for (NSInteger i = 0; i < MAXCOL-1; i++) {
        
        UIView *marginWView = [[UIView alloc] initWithFrame:CGRectMake(self.W*(i+1) + i*marginRW, 0, marginRW, marginRH)];
        marginWView.backgroundColor = [UIColor blackColor];
        [bigView addSubview:marginWView];
    }
    
    //创建需要绘制的view
    self.image = [[UIView alloc] initWithFrame:CGRectZero];
    self.image.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.image];

}

/**
 * 点击刷新按钮后根据设置的值重新对显示的view进行布局
 */
- (IBAction)drawImage{
    NSInteger r = self.rTextField.text.integerValue;
    NSInteger c = self.cTextField.text.integerValue;
    NSInteger w = self.wTextField.text.integerValue;
    NSInteger h = self.hTextField.text.integerValue;
    
    if (r > MAXROW || c > MAXCOL || w > (MAXCOL + 1 - c) || h > (MAXROW + 1 - r)) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你输入的数字不在显示范围内" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return;
    }
    //图像改变后的x坐标
    CGFloat newX = (c - 1) * (self.W + MARGIN);
    //图像改变后的y坐标
    CGFloat newY = (r - 1) * (self.H + MARGIN);
    //图像改变后的w宽度
    CGFloat newW = self.W * w + (w - 1) * MARGIN;
    //图像改变后的h高度
    CGFloat newH = self.H * h + (h - 1) * MARGIN;

    //重新设置frame
    self.image.frame = CGRectMake(newX, newY, newW, newH);
    
}
@end
