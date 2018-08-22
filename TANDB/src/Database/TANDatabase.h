//
//  TANDatabase.h
//  TANDB
//
//  Created by yuhan on 2018/8/15.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBGet.h"
#import "TANDBSave.h"
#import "TANDBDelete.h"

@interface TANDatabase : NSObject

- initWithPath:(NSString *)path;

- (NSArray *)executeQuery:(NSString *)sql;
- (BOOL)executeUpdate:(NSString *)sql;

- (TANDBGet *)get;
- (TANDBSave *)save;
- (TANDBDelete *)delete;

@end
