//
//  TANDBColumn.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBConfiguration.h"

@interface TANDBColumn : NSObject

@property (nonatomic, copy, readonly) NSString *columnName;

@property (nonatomic, assign, readonly) TANColumnType columnType;

@property (nonatomic, assign, readonly) BOOL isNotNull;

@property (nonatomic, strong, readonly) id defaultValue;

@property (nonatomic, copy, readonly) NSString *columnTypeName;

- (instancetype)initColumnName:(NSString *)columnName columnType:(TANColumnType)columnType;

- (void)makeNotNull;

- (void)makeDefaultValue:(id)defaultValue;

@end
