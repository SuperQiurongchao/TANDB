//
//  TANDBConstaintBinding.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBColumn.h"

/**
 支持colum的约束，包括主键、唯一性等约束
 */
@interface TANDBConstaintBinding : NSObject

- (NSArray<TANDBColumn *> *)constraintColumnArray;

- (void)addConstraintKey:(NSString *)constraintKey column:(TANDBColumn *)column;

@end
