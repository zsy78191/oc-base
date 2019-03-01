//
//  oc_baseTests.m
//  oc-baseTests
//
//  Created by 张超 on 2018/12/10.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+ocbase.h"

@interface oc_baseTests : XCTestCase

@end

@implementation oc_baseTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"%@",[self ob_methods]);
    Class c = [self superclass];
    while (c) {
        NSLog(@"%@",c);
        c = [c superclass];
    }
    NSLog(@"%@", [NSObject ob_allClasses]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
