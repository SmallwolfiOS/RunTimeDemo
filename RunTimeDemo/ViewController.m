//
//  ViewController.m
//  RunTimeDemo
//
//  Created by Jason on 16/6/20.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "NSObject+Category.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    Method m1 = class_getClassMethod([Person class], @selector(run));
//    Method m2 = class_getClassMethod([Person class], @selector(study));
//    
//    method_exchangeImplementations(m1, m2);
    
    [Person run];
    [Person study];
    
    Person.name = @"1";
    
    NSLog(@"%@",Person.name);
    
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([Person class], &outCount);
    for (int i = 0 ; i < outCount; i ++) {
        Ivar  ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    // 注意释放内存！
    free(ivars);
    
    _testLabel.text = @"dasdadasd";
//    _testLabel.font = [UIFont fontWithName:@"tAmazonRegularSWFTE" size:17];
    _testLabel.font = [UIFont fontWithName:@"Amazone" size:17];
    for(NSString *familyName in [UIFont familyNames]){
        NSLog(@"Font FamilyName = %@\n\n",familyName); //*输出字体族科名字
        
        for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"t%@",fontName);         //*输出字体族科下字样名字
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
