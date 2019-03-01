//
//  NSObject+ocbase.h
//  oc-base
//
//  Created by 张超 on 2019/1/11.
//  Copyright © 2019 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ocbase)

- (NSArray *)ob_propertysWithClass:(Class)c;
- (NSArray *)ob_propertys;

- (NSArray *)ob_methodsWithClass:(Class)c;
- (NSArray *)ob_methods;

+ (NSArray*)ob_allClasses;
+ (NSArray*)ob_allClassesWithPrefix:(NSString* _Nullable)prefix;

@end

NS_ASSUME_NONNULL_END
