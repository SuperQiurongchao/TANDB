//
//  NSObject+TANDBColumnCode.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBConfiguration.h"
#import "TANDBColumnProtocol.h"

@interface NSObject (TANDBColumnCode) <TANDBColumnProtocol>

@end

@interface NSObject (TANDBBindingType)

+ (NSString *)propertyType:(NSString *)propertyName;

+ (TANColumnType)columnType:(NSString *)propertyType;

@end
