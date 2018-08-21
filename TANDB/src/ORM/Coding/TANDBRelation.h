//
//  TANDBRelation.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/19.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBAttribute.h"

@interface TANDBRelation : NSObject

@property (nonatomic, copy, readonly) NSString *relationName;

@property (nonatomic, copy, readonly) NSString *relationType;

@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, TANDBAttribute *> *attributes;

@property (nonatomic, strong, readonly) NSArray<TANDBAttribute *> *attributeArray;

- (instancetype)initWithRelationName:(NSString *)relationName relationType:(NSString *)relationType;

- (void)setAttribute:(TANDBAttribute *)attribute attributeKey:(NSString *)attributeKey;

@end

@interface TANRelationList : NSObject

- (void)pushback:(TANDBRelation *)relation;

- (TANDBRelation *)relationForKey:(NSString *)relationName;

- (NSArray<TANDBRelation *> *)relationArray;

@end
