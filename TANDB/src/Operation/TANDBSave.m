//
//  TANDBSave.m
//  TANDB
//
//  Created by yuhan on 2018/8/20.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import "TANDBSave.h"

@interface TANDBSave ()

@property (nonatomic, copy) BOOL (^executionHandler)(NSString *);
@property (nonatomic) NSMutableString *sql;

@end

@implementation TANDBSave

- (instancetype)initWithExecutionHandler:(BOOL (^)(NSString *))handler {
    self = [super init];
    if (self) {
        _executionHandler = handler;
        _sql = [NSMutableString stringWithString:@"insert into"];
    }
    return self;
}

- (TANDBSave *(^)(id))object {
    return ^id(id object) {
        return self;
    };
}

- (BOOL)execute {
    if (self.executionHandler) {
        NSString *sql = [self.sql stringByAppendingString:@";"];
        NSLog(@"execute sql: %@", sql);
        return self.executionHandler(sql);
    }
    return NO;
}

@end
