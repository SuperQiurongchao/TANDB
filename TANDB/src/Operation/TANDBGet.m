//
//  TANDBGet.m
//  TANDB
//
//  Created by yuhan on 2018/8/20.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import "TANDBGet.h"

@interface TANDBGet ()

@property (nonatomic, copy) NSArray * (^executionHandler)(NSString *);
@property (nonatomic) NSMutableString *sql;

@end

@implementation TANDBGet

- (instancetype)initWithExecutionHandler:(NSArray * (^)(NSString *))handler {
    self = [super init];
    if (self) {
        _executionHandler = handler;
        _sql = [NSMutableString stringWithString:@"select *"];
    }
    return self;
}

- (TANDBGet * (^)(NSString *))from {
    return ^id(NSString *table) {
        [self.sql appendFormat:@" from %@", table];
        return self;
    };
}

- (TANDBGet * (^)(NSString *))where {
    return ^id(NSString *condition) {
        [self.sql appendFormat:@" where %@", condition];
        return self;
    };
}

- (TANDBGet * (^)(NSString *))orderBy {
    return ^id(NSString *columns) {
        [self.sql appendFormat:@" order by %@", columns];
        return self;
    };
}

- (TANDBGet * (^)(NSInteger))limit {
    return ^id(NSInteger number) {
        [self.sql appendFormat:@" limit %ld", (long)number];
        return self;
    };
}

- (TANDBGet * (^)(NSInteger))offset {
    return ^id(NSInteger number) {
        [self.sql appendFormat:@" offset %ld", (long)number];
        return self;
    };
}

- (NSArray *)execute {
    if (self.executionHandler) {
        NSString *sql = [self.sql stringByAppendingString:@";"];
        NSLog(@"execute sql: %@", sql);
        return self.executionHandler(sql);
    }
    return nil;
}

@end
