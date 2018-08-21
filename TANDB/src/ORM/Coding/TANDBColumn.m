//
//  TANDBColumn.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "TANDBColumn.h"

@interface TANDBColumn()

@property (nonatomic, copy) NSString *columnName;

@property (nonatomic, assign) TANColumnType columnType;

@property (nonatomic, assign) BOOL isNotNull;

@property (nonatomic, strong) id defaultValue;

@end

@implementation TANDBColumn

- (instancetype)initColumnName:(NSString *)columnName columnType:(TANColumnType)columnType {
  if (self = [super init]) {
    _columnName = [columnName copy];
    _columnType = columnType;
  }
  return self;
}

- (void)makeNotNull {
  _isNotNull = YES;
}

- (void)makeDefaultValue:(id)defaultValue {
  _defaultValue = defaultValue;
}

@end
