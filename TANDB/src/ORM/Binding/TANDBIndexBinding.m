//
//  TANDBIndexBinding.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "TANDBIndexBinding.h"

@interface TANDBIndexBinding()

@property (nonatomic, copy) NSString *indexName;

@property (nonatomic, copy) NSMutableDictionary<NSString *, TANDBColumn *> *columns;

@end

@implementation TANDBIndexBinding

- (instancetype)initWithIndexName:(NSString *)indexName {
  self = [super init];
  if (self) {
    _indexName = indexName;
    _columns = [NSMutableDictionary dictionary];
  }
  return self;
}

- (NSArray<TANDBColumn *> *)index {
  return [_columns allValues];
}

- (void)addIndexWithColumn:(TANDBColumn *)column {
  [_columns setObject:column forKey:column.columnName];
}

@end
