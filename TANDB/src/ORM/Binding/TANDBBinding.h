//
//  TANDBBinding.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBAttribute.h"
#import "TANDBRelation.h"
#import "TANDBIndexBinding.h"
#import "TANDBColumn.h"
#import "TANDBConstaintBinding.h"

@interface TANDBBinding : NSObject

@property (nonatomic, strong, readonly) TANDBConstaintBinding *primaryBinding;

@property (nonatomic, strong, readonly) TANDBConstaintBinding *uniqueBinding;

@property (nonatomic, copy, readonly) NSMutableDictionary<NSString *, TANDBIndexBinding *> *indexBindings;

@property (nonatomic, copy, readonly) NSMutableDictionary<NSString *, TANDBColumn *> *columns;

@property (nonatomic, copy, readonly) NSArray<TANDBColumn *> *columnArray;

@property (nonatomic, strong, readonly) TANAttributeList *attributes;

@property (nonatomic, strong, readonly) TANRelationList *relations;

@property (nonatomic, strong, readonly) Class clazz;

- (instancetype)initWithClass:(Class)clazz;

- (void)setColumn:(TANDBColumn *)column columnName:(NSString *)columnName;

- (void)addPrimaryKey:(NSString *)primaryKey column:(TANDBColumn *)column;

- (void)addUniqueKey:(NSString *)uniqueKey column:(TANDBColumn *)column;

- (NSArray *)indexBindingArray;

- (void)addIndexWithIndexName:(NSString *)indexName column:(TANDBColumn *)column;

@end
