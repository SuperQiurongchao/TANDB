//
//  TANDBAttribute.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBColumn.h"

@interface TANDBAttribute : NSObject

@property (nonatomic, copy, readonly) NSString *attributeName;

@property (nonatomic, copy, readonly) NSString *attributeType;

@property (nonatomic, strong, readonly) TANDBColumn *column;

- (instancetype)initWithAttributeName:(NSString *)attributeName attributeType:(NSString *)propertyType;

- (void)setColumnName:(NSString *)columnName columnType:(TANColumnType)columnType;

@end

@interface TANAttributeList : NSObject

- (void)pushback:(TANDBAttribute *)attribute;

- (TANDBAttribute *)attributeForkey:(NSString *)attributeName;

- (NSArray<TANDBAttribute *> *)attributeArray;

@end
