//
//  TANDBDelete.m
//  TANDB
//
//  Created by yuhan on 2018/8/15.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import "TANDBDelete.h"

@interface TANDBDelete ()

@property (nonatomic, copy) BOOL (^executionHandler)(NSString *);
@property (nonatomic) NSMutableString *sql;

@end

@implementation TANDBDelete

- (instancetype)initWithExecutionHandler:(BOOL (^)(NSString *))handler {
    self = [super init];
    if (self) {
        _executionHandler = handler;
        _sql = [NSMutableString stringWithString:@"delete"];
    }
    return self;
}

- (TANDBDelete *(^)(id))object {
    return ^id(id object) {
        return self;
    };
}

- (TANDBDelete * (^)(NSString *))from {
    return ^id(NSString *table) {
        [self.sql appendFormat:@" from %@", table];
        return self;
    };
}

- (TANDBDelete * (^)(NSString *))where {
    return ^id(NSString *condition) {
        [self.sql appendFormat:@" where %@", condition];
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
