//
//  ViewController.h
//  kvo
//
//  Created by owen on 16/3/25.
//  Copyright © 2016年 owen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

/**
 * 
 KVO概述:
 KVO,即：Key-Value Observing，它提供一种机制，当指定的对象的属性被修改后，则对象就会接受到通知。
 简单的说就是每次指定的被观察的对象的属性被修改后，KVO就会自动通知相应的观察者了。
 
 KVO的优点:
 当有属性改变，KVO会提供自动的消息通知。这样开发人员不需要自己去实现这样的方案：每次属性改变了就发送消息通知。
 这是KVO机制提供的最大的优点。因为这个方案已经被明确定义，获得框架级支持，可以方便地采用。
 开发人员不需要添加任何代码，不需要设计自己的观察者模型，直接可以在工程里使用。
 其次，KVO的架构非常的强大，可以很容易的支持多个观察者观察同 一个属性，以及相关的值。
 
 使用步骤如下：
 1. 注册，指定被观察者的属性，
 2. 实现回调方法
 3. 触发回调方法
 4. 移除观察
 */

@end

