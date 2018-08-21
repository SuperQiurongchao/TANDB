//
//  TANDBColumnProtocol.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TANDBColumnProtocol <NSObject>

@optional
+ (instancetype)unarchiveWithValue:(NSObject *)value; //value could be nil

- (id)archiveValue;                  //value could be nil

@required
+ (TANColumnType)columnType;

@end
