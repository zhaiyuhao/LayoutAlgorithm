//
//  ViewController.h
//  frame-Demo
//
//  Created by zyh on 16/3/6.
//  Copyright © 2016年 zyh. All rights reserved.
//

/**
 * 使用方式,需要传入四个参数,就可以自动实现布局,四个参数代表的意义:
 * r : 代表第r行的小格
 * c : 代表第c列的小格
 * w : 代表将图形分成c列后,水平方向就表示分为了c个小份,w可以理解为其中一份的单位
 * h : 代表将图形分成r行后,垂直方向就表示分为了r个小份,h可以理解为其中一份的单位
 *
 * 此算法可以让服务器只返回图片的位置关系及宽高比例大小,即可实现布局.
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

