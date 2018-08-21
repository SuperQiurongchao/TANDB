//
//  TANDBConfiguration.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#ifndef TANConfiguration_h
#define TANConfiguration_h

typedef NS_ENUM(NSUInteger, TANColumnType) {
  TANColumnTypeInteger,
  TANColumnTypeDouble,
  TANColumnTypeText,
  TANColumnTypeBlob
};

// OC到sqlite的类型映射，目前支持这4种
static NSString *const kTANypeText = @"TEXT";
static NSString *const kTANTypeInteger = @"INTEGER";
static NSString *const kTANTypeDouble = @"DOUBLE";
static NSString *const kTANTypeBlob = @"BLOB";

// 范类型集合
static NSString *const kTANIntType = @"int_short_long";
static NSString *const kTANFloatType = @"float_double";

#endif /* TANConfiguration_h */
