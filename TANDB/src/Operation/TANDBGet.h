//
//  TANDBGet.h
//  TANDB
//
//  Created by yuhan on 2018/8/20.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TANDBGet : NSObject

- (instancetype)initWithExecutionHandler:(NSArray * (^)(NSString *))handler;

- (TANDBGet * (^)(NSString *))from;
- (TANDBGet * (^)(NSString *))where;
- (TANDBGet * (^)(NSString *))orderBy;
- (TANDBGet * (^)(NSInteger))limit;
- (TANDBGet * (^)(NSInteger))offset;

- (NSArray *)execute;

@end
