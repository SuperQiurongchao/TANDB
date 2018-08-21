//
//  TANDBRelation.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/19.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "TANDBRelation.h"

@interface TANDBRelation()

@property (nonatomic, copy) NSString *relationName;

@property (nonatomic, copy) NSString *relationType;

@property (nonatomic, strong) NSMutableDictionary<NSString *, TANDBAttribute *> *attributes;

@end

@implementation TANDBRelation

- (instancetype)initWithRelationName:(NSString *)relationName
                        relationType:(NSString *)relationType {
  if (self = [super init]) {
    _relationName = [relationName copy];
    _relationType = [relationType copy];
    _attributes = [NSMutableDictionary dictionary];
  }
  
  return self;
}

- (void)setAttribute:(TANDBAttribute *)attribute attributeKey:(NSString *)attributeKey {
  [_attributes setObject:attribute forKey:attributeKey];
}

- (NSArray<TANDBAttribute *> *)attributeArray {
  return [_attributes allValues];
}

@end

@interface TANRelationList()

@property (nonatomic, copy) NSMutableDictionary *relationMap;

@end

@implementation TANRelationList

- (instancetype)init {
  if (self = [super init]) {
    _relationMap = [NSMutableDictionary dictionary];
  }
  
  return self;
}

- (void)pushback:(TANDBRelation *)relation {
  [_relationMap setObject:relation forKey:relation.relationName];
}

- (TANDBRelation *)relationForKey:(NSString *)relationName {
  return [_relationMap objectForKey:relationName];
}

- (NSArray<TANDBRelation *> *)relationArray {
  return [_relationMap allValues];
}

@end
