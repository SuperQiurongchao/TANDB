//
//  NSObject+TANDBColumnCode.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "NSObject+TANDBColumnCode.h"
#import <objc/runtime.h>

@implementation NSObject (TANDBColumnCode)

+ (TANColumnType)columnType {
  return TANColumnTypeBlob;
}

@end

@implementation NSObject (TANDBBindingType)

+ (NSString *)propertyType:(NSString *)propertyName {
  objc_property_t property = class_getProperty(self, [propertyName UTF8String]);
  NSString *propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
  NSString *propertyTypeName = nil;
  // 这里忽略掉了void *这种指针类型。只对一般的类型做检测
  if ([propertyAttribute hasPrefix:@"T@"]) {
    NSRange range = [propertyAttribute rangeOfString:@","];
    if (range.location > 4 && range.location <= propertyAttribute.length) {
      range = NSMakeRange(3, range.location - 4);
      propertyTypeName = [propertyAttribute substringWithRange:range];
      if ([propertyTypeName hasSuffix:@">"]) {
        NSRange categoryRange = [propertyTypeName rangeOfString:@"<"];
        if (categoryRange.length > 0) {
          propertyTypeName = [propertyTypeName substringToIndex:categoryRange.location];
        }
      }
    }
  } else {
    propertyAttribute = [propertyAttribute lowercaseString];
    if ([propertyAttribute hasPrefix:@"ti"] || [propertyAttribute hasPrefix:@"tb"]) {
      propertyTypeName = @"int";
    } else if ([propertyAttribute hasPrefix:@"tf"]) {
      propertyTypeName = @"float";
    } else if ([propertyAttribute hasPrefix:@"td"]) {
      propertyTypeName = @"double";
    } else if ([propertyAttribute hasPrefix:@"tl"] || [propertyAttribute hasPrefix:@"tq"]) {
      propertyTypeName = @"long";
    } else if ([propertyAttribute hasPrefix:@"tc"]) {
      propertyTypeName = @"char";
    } else if ([propertyAttribute hasPrefix:@"ts"]) {
      propertyTypeName = @"short";
    }
  }
  
  return propertyTypeName;
}

+ (TANColumnType)columnType:(NSString *)propertyType {
  if ([kTANIntType containsString:propertyType]) {
    return TANColumnTypeInteger;
  } else if ([kTANFloatType containsString:propertyType]) {
    return TANColumnTypeDouble;
  } else {
    return [NSClassFromString(propertyType) columnType];
  }
}

@end
