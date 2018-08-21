//
//  TANDBBinding.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "TANDBBinding.h"
#import "TANDBAttribute.h"

@interface TANDBBinding()

@property (nonatomic, strong) TANDBConstaintBinding *primaryBinding;

@property (nonatomic, strong) TANDBConstaintBinding *uniqueBinding;

@property (nonatomic, copy) NSMutableDictionary<NSString *, TANDBIndexBinding *> *indexBindings;

@property (nonatomic, copy) NSMutableDictionary<NSString *, TANDBColumn *> *columns;

@property (nonatomic, strong) TANAttributeList *attributes;

@property (nonatomic, strong) TANRelationList *relations;

@property (nonatomic, strong) Class clazz;

@end

@implementation TANDBBinding

- (instancetype)initWithClass:(Class)clazz {
  if (self = [super init]) {
    _clazz = clazz;
    _primaryBinding = [[TANDBConstaintBinding alloc] init];
    _uniqueBinding = [[TANDBConstaintBinding alloc] init];
    _indexBindings = [NSMutableDictionary dictionary];
    _columns = [NSMutableDictionary dictionary];
    _attributes = [[TANAttributeList alloc] init]; \
    _relations = [[TANRelationList alloc] init]; \
  }
  
  return self;
}

- (void)setColumn:(TANDBColumn *)column columnName:(NSString *)columnName {
  [_columns setObject:column forKey:columnName];
}

- (void)addPrimaryKey:(NSString *)primaryKey column:(TANDBColumn *)column {
  [_primaryBinding addConstraintKey:primaryKey column:column];
}

- (void)addUniqueKey:(NSString *)uniqueKey column:(TANDBColumn *)column {
  [_uniqueBinding addConstraintKey:uniqueKey column:column];
}

- (NSArray *)columnArray {
  return [_columns allValues];
}

- (NSArray *)indexBindingArray {
  return [_indexBindings allValues];
}

- (void)addIndexWithIndexName:(NSString *)indexName column:(TANDBColumn *)column {
  TANDBIndexBinding *indexBinding = [_indexBindings objectForKey:indexName];
  if (!indexBinding) {
    indexBinding = [[TANDBIndexBinding alloc] initWithIndexName:indexName];
    [_indexBindings setObject:indexBinding forKey:indexName];
  }
  [indexBinding addIndexWithColumn:column];
}

@end
