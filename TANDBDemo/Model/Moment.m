//
//  Moment.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/17.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "Moment.h"
#import "NSObject+TANDBColumnCode.h"
#import "UserInfo.h"

@implementation Moment

TANImplementionORM

+ (void)implementAttribute {
  TANSynthesizeAttribute(Moment, momentID);
  TANSynthesizeAttribute(Moment, value);
}

+ (void)implementAttributeConstraint {
  TANSynthesizePrimary(Moment, momentID);
  TANSynthesizeAttributeNotNull(Moment, value);
  TANSynthesizeAttributeUnique(Moment, value);
}

+ (void)implementAttributeIndex {
  TANSynthesizeAttributeIndex(Moment, momentID, @"momentID_index");
}

+ (NSString *)tableName {
  return @"MomentModel";
}

+ (void)implementRelation {
  TANSynthesizeRelation(Moment, userInfo, UserInfo, @"user");
}

+ (void)implementRelationConstraint {
  TANSynthesizeRelationPrimary(Moment, userInfo);
}

+ (void)implementRelationIndex {
  TANSynthesizeRelationIndex(Moment, userInfo, @"userInfo_index");
}

- (void)dealloc {
  NSLog(@"super Moment");
}

@end
