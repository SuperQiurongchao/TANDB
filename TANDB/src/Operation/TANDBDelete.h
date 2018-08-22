//
//  TANDBDelete.h
//  TANDB
//
//  Created by yuhan on 2018/8/15.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TANDBDelete : NSObject

- (instancetype)initWithExecutionHandler:(BOOL (^)(NSString *))handler;

- (TANDBDelete * (^)(id))object;

- (TANDBDelete * (^)(NSString *))from;
- (TANDBDelete * (^)(NSString *))where;

- (BOOL)execute;

@end
