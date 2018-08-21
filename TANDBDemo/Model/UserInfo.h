//
//  UserInfo.h
//  TANDatabase
//
//  Created by 邱荣超 on 2018/8/20.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDB.h"

@class Moment;
@interface UserInfo : NSObject<TANDBTableProtocol>

@property(nonatomic, strong) NSString *userID;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, assign) NSInteger gender;
@property(nonatomic, strong) NSString *userDescription;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSDictionary *pictureDictionary;
@property(nonatomic, strong) NSDictionary *locationDictionary;
@property(nonatomic, weak) Moment *moment;

@end
