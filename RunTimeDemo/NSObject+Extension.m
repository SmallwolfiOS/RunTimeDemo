//
//  NSObject+Extension.m
//  RunTimeDemo
//
//  Created by Jason on 16/6/20.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
@implementation NSObject (Extension)

// 设置不需要归解档的属性
- (NSArray *)ignoredNames {
    return @[@"_aaa",@"_bbb",@"_ccc"];
}


@end
