//
//  UserInfo.m
//  TANDatabase
//
//  Created by 邱荣超 on 2018/8/20.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

TANImplementionORM

+ (void)implementAttribute {
  TANSynthesizeAttribute(UserInfo, userID);
}


+ (void)implementAttributeConstraint {
  TANSynthesizePrimary(UserInfo, userID);
}


+ (void)implementAttributeIndex {
  
}


+ (NSString *)tableName {
  return @"UserInfo";
}

+ (void)implementRelation {
  
}

+ (void)implementRelationConstraint {
  
}

+ (void)implementRelationIndex {
  
}

- (void)dealloc {
  NSLog(@"super UserInfo");
}

@end
