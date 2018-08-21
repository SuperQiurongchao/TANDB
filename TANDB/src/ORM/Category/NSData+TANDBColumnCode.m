//
//  NSData+TANDBColumnCode.m
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import "NSData+TANDBColumnCode.h"

@implementation NSData (TANDBColumnCode)

+ (TANColumnType)columnType {
  return TANColumnTypeBlob;
}

@end
