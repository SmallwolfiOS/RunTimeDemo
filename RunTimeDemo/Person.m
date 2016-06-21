//
//  Person.m
//  RunTimeDemo
//
//  Created by Jason on 16/6/20.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>


@implementation Person
+ (void)load{
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(study));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
}

+ (void)run{
    NSLog(@"跑");
}

+ (void)study{
    NSLog(@"学习");
}

@end
