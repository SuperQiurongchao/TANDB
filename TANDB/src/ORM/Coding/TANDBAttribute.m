//
//  TANDBAttribute.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "TANDBAttribute.h"

@interface TANDBAttribute()

@property (nonatomic, copy) NSString *attributeName;

@property (nonatomic, copy) NSString *attributeType;

@property (nonatomic, strong) TANDBColumn *column;

@end

@implementation TANDBAttribute

- (instancetype)initWithAttributeName:(NSString *)attributeName
                        attributeType:(NSString *)attributeType {
  if (self = [super init]) {
    _attributeName = [attributeName copy];
    _attributeType = [attributeType copy];
  }
  
  return self;
}

- (void)setColumnName:(NSString *)columnName columnType:(TANColumnType)columnType {
  _column = [[TANDBColumn alloc] initColumnName:columnName columnType:columnType];
}

@end


@interface TANAttributeList()

@property (nonatomic, copy) NSMutableDictionary *attributeMap;

@end

@implementation TANAttributeList

- (instancetype)init {
  if (self = [super init]) {
    _attributeMap = [NSMutableDictionary dictionary];
  }
  
  return self;
}

- (void)pushback:(TANDBAttribute *)attribute {
  [_attributeMap setObject:attribute forKey:attribute.attributeName];
}

- (TANDBAttribute *)attributeForkey:(NSString *)attributeName {
  return [_attributeMap objectForKey:attributeName];
}

- (NSArray<TANDBAttribute *> *)attributeArray {
  return [_attributeMap allValues];
}

@end
