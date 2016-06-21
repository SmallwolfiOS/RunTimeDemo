//
//  NSObject+Category.m
//  RunTimeDemo
//
//  Created by Jason on 16/6/20.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>





@implementation NSObject (Category)

char nameKey;

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)name{
    return objc_getAssociatedObject(self, &nameKey);
}


@end
