//
//  TANDBTableProtocol.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBConstaintBinding.h"
#import "TANDBBinding.h"

@protocol TANDBTableProtocol <NSObject>

@required

+ (TANDBBinding *)binding;

+ (void)implementAttribute;

+ (void)implementAttributeConstraint;

+ (void)implementAttributeIndex;

+ (NSString *)tableName;

@optional

+ (void)implementRelation;

+ (void)implementRelationConstraint;

+ (void)implementRelationIndex;

@end
