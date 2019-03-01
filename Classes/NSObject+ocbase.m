//
//  NSObject+ocbase.m
//  oc-base
//
//  Created by 张超 on 2019/1/11.
//  Copyright © 2019 orzer. All rights reserved.
//

#import "NSObject+ocbase.h"
#import <ObjC/Runtime.h>
@implementation NSObject (ocbase)

- (NSArray *)ob_propertysWithClass:(Class)c
{
    unsigned int count = 0;
    //获取属性的列表
    objc_property_t *propertyList =  class_copyPropertyList(c, &count);
    NSMutableArray *propertyArray = [NSMutableArray array];
    for(int i=0;i<count;i++)
    {
        //取出每一个属性
        objc_property_t property = propertyList[i];
        //获取每一个属性的变量名
        const char* propertyName = property_getName(property);
        NSString *proName = [[NSString alloc] initWithCString:propertyName encoding:NSUTF8StringEncoding];
        [propertyArray addObject:proName];
    }
    //c语言的函数，所以要去手动的去释放内存
    free(propertyList);
    return propertyArray.copy;
}

- (NSArray *)ob_propertys
{
    return [self ob_propertysWithClass:[self class]];
}

#pragma mark - 获取类的所有方法
- (NSArray *)ob_methodsWithClass:(Class)c
{
    NSMutableArray *mutArr = [NSMutableArray array];
    unsigned int outCount;
    /** 第一个参数：要获取哪个类的方法
     * 第二个参数：获取到该类的方法的数量
     */
    Method *methodList = class_copyMethodList(c, &outCount);
    // 遍历所有属性列表
    for (int i = 0; i<outCount; i++) {
        SEL name = method_getName(methodList[i]);
        [mutArr addObject:NSStringFromSelector(name)];
    }
    return [NSArray arrayWithArray:mutArr];
}

- (NSArray *)ob_methods
{
    return [self ob_methodsWithClass:[self class]];
}

+ (NSArray*)ob_allClasses
{
    return [[self class] ob_allClassesWithPrefix:nil];
}


+ (NSArray*)ob_allClassesWithPrefix:(NSString* _Nullable)prefix
{
    int numClasses;
    Class *classes = NULL;
    
    classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    //    NSLog(@"Number of classes: %d", numClasses);
    NSMutableArray* a = [[NSMutableArray alloc] initWithCapacity:numClasses];
    if (numClasses > 0 )
    {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            //            NSLog(@"Class name: %s", class_getName(classes[i]));
            NSString* name = NSStringFromClass(classes[i]);
            if (prefix && [name hasPrefix:prefix]) {
                [a addObject:name];
            }
            else {
                [a addObject:name];
            }
        }
        free(classes);
    }
    return [a copy];
}


@end
