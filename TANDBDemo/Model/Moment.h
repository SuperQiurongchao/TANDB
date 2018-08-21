//
//  Moment.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/17.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDB.h"

@class UserInfo;
@interface Moment : NSObject<TANDBTableProtocol>

@property (nonatomic, copy) NSString *momentID;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, strong) NSDate *createTime;

@property (nonatomic, strong) UserInfo *userInfo;

@end
