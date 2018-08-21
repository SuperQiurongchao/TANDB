//
//  TANDBSave.h
//  TANDB
//
//  Created by yuhan on 2018/8/20.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TANDBSave : NSObject

- (instancetype)initWithExecutionHandler:(BOOL (^)(NSString *))handler;

- (TANDBSave * (^)(id))object;

- (BOOL)execute;

@end
