//
//  TANDBConstaintBinding.h

//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "TANDBConstaintBinding.h"

@interface TANDBConstaintBinding()

@property (nonatomic, copy) NSMutableDictionary<NSString *, TANDBColumn *> *constraintColumns;

@end

@implementation TANDBConstaintBinding

- (instancetype)init {
  if (self = [super init]) {
    _constraintColumns = [NSMutableDictionary dictionary];
  }
  
  return self;
}

- (NSArray *)constraintColumnArray {
  return [_constraintColumns allValues];
}

- (void)addConstraintKey:(NSString *)constraintKey column:(TANDBColumn *)column {
  [_constraintColumns setObject:column forKey:constraintKey];
}

@end
