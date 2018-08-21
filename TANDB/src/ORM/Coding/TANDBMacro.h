//
//  TANMacro.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/17.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#ifndef TANMacro_h
#define TANMacro_h

#define TANStringify(string) #string

// 初始化相关Model的attribute与relation信息
#define TANImplementionORM  \
static TANDBBinding *binding = nil; \
+ (void)initialize {                         \
  binding = [[TANDBBinding alloc] initWithClass:self];  \
  [self implementAttribute];\
  [self implementAttributeConstraint]; \
  [self implementAttributeIndex]; \
  [self implementRelation];\
  [self implementRelationConstraint]; \
  [self implementRelationIndex]; \
} \
\
+ (TANDBBinding *)binding { \
  return binding;\
}

// 设置attribute
// 设置属性
#pragma mark - attribute

#define TANSynthesizeAttribute(class, property) \
TANSynthesizeAttributeColumnDefault(class, property, nil, nil)

#define TANSynthesizeAttributeDefault(class, property, defaultValue)  \
TANSynthesizeAttributeColumnDefault(class, property, nil, defaultValue)

#define TANSynthesizeAttributeColumn(class, property, column)  \
TANSynthesizeAttributeColumnDefault(class, property, column, nil)

#define TANSynthesizeAttributeColumnDefault(class, property, _columnName, defaultValue)  \
({ \
  NSString *attributeName = [NSString stringWithUTF8String:TANStringify(property)]; \
  NSString* attributeType = [class propertyType:attributeName];\
  NSString *newColumnName = _columnName ?: attributeName; \
  TANColumnType columnType = [class columnType:attributeType];\
  TANDBAttribute *attribute = [[TANDBAttribute alloc] initWithAttributeName:attributeName attributeType:attributeType]; \
  [attribute setColumnName:newColumnName columnType:columnType]; \
  TANDBColumn *column = attribute.column; \
  [[class binding] setColumn:column columnName:column.columnName]; \
  [column makeDefaultValue:defaultValue]; \
  [[[class binding] attributes] pushback:attribute]; \
})

// 设置model对应表的主键，支持符合主键
#define TANSynthesizePrimary(class, property)  \
({ \
  NSString *primaryKey = [NSString stringWithUTF8String:TANStringify(property)]; \
  TANDBAttribute *attribute = [[[class binding] attributes] attributeForkey:primaryKey]; \
  [[class binding] addPrimaryKey:primaryKey column:attribute.column];\
})

// 设置attribute对应column不为空
#define TANSynthesizeAttributeNotNull(class, property)  \
({ \
NSString *attributeName = [NSString stringWithUTF8String:TANStringify(property)]; \
TANDBAttribute *attribute = [[[class binding] attributes] attributeForkey:attributeName]; \
[attribute.column makeNotNull]; \
})

// 设置attribute对应column唯一性
#define TANSynthesizeAttributeUnique(class, property)  \
({ \
  NSString *attributeName = [NSString stringWithUTF8String:TANStringify(property)]; \
  TANDBAttribute *attribute = [[[class binding] attributes] attributeForkey:attributeName]; \
  [[class binding] addUniqueKey:attributeName column:attribute.column];\
})

// 设置model对应表的索引，支持符合索引
#define TANSynthesizeAttributeIndex(class, property, indexName)  \
({ \
  NSString *attributeName = [NSString stringWithUTF8String:TANStringify(property)]; \
  TANDBAttribute *attribute = [[[class binding] attributes] attributeForkey:attributeName];\
  [[class binding] addIndexWithIndexName:indexName column:attribute.column]; \
})

// 设置关联属性
#pragma mark - relation

// 设置relation对象的column
#define TANSynthesizeRelation(class, property, propertyClass, columnNamePrefix)  \
({ \
  NSString *relationName = [NSString stringWithUTF8String:TANStringify(property)]; \
  NSString *relationType = [class propertyType:relationName];\
  NSArray<TANDBColumn *> *constraintColumnArray = [[[propertyClass binding] primaryBinding] constraintColumnArray];\
  TANDBRelation *relation = [[[class binding] relations] relationForKey:relationName];\
  if (!relation) { \
    relation = [[TANDBRelation alloc] initWithRelationName:relationName relationType:relationType]; \
  } \
  for (TANDBColumn *column in constraintColumnArray) { \
    TANDBAttribute *attribute = [[[propertyClass binding] attributes] attributeForkey:column.columnName]; \
    [[class binding] setColumn:attribute.column columnName:attribute.column.columnName]; \
    [relation setAttribute:attribute attributeKey:attribute.attributeName];\
  } \
  [[[class binding] relations] pushback:relation]; \
})

// 设置relation对象为主键
#define TANSynthesizeRelationPrimary(class, property)  \
({ \
  NSString *primaryKey = [NSString stringWithUTF8String:TANStringify(property)]; \
  NSArray<TANDBAttribute *> *attributeArray = [[[[class binding] relations] relationForKey:primaryKey] attributeArray]; \
  for (TANDBAttribute *attribute in attributeArray) { \
    [[class binding] addPrimaryKey:attribute.attributeName column:attribute.column]; \
  } \
})

// 设置relation对应column不为空
#define TANSynthesizeRelationNotNull(class, property)  \
({ \
  NSString *notNullKey = [NSString stringWithUTF8String:TANStringify(property)]; \
  NSArray<TANDBAttribute *> *attributeArray = [[[[class binding] relations] relationForKey:notNullKey] attributeArray]; \
  for (TANDBAttribute *attribute in attributeArray) { \
    [attribute.column makeNotNull]; \
  } \
})

// 设置relation对应column唯一性
#define TANSynthesizeRelationUnique(class, property)  \
({ \
  NSString *uniqueKey = [NSString stringWithUTF8String:TANStringify(property)]; \
  NSArray<TANDBAttribute *> *attributeArray = [[[[class binding] relations] relationForKey:uniqueKey] attributeArray]; \
  for (TANDBAttribute *attribute in attributeArray) { \
    [[class binding] addUniqueKey:attribute.attributeName column:attribute.column]; \
  } \
})

// 设置model对应表的索引，支持符合索引
#define TANSynthesizeRelationIndex(class, property, indexName)  \
({ \
  NSString *relationName = [NSString stringWithUTF8String:TANStringify(property)]; \
  NSArray<TANDBAttribute *> *attributeArray = [[[[class binding] relations] relationForKey:relationName] attributeArray]; \
  for (TANDBAttribute *attribute in attributeArray) { \
    [[class binding] addIndexWithIndexName:indexName column:attribute.column]; \
  } \
})

#endif /* TANMacro_h */
