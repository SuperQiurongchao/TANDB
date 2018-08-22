//
//  TANDatabase.m
//  TANDB
//
//  Created by yuhan on 2018/8/15.
//  Copyright © 2018年 yuhan. All rights reserved.
//

#import "TANDatabase.h"
#import "FMDatabase.h"

@interface TANDatabase ()

@property (nonatomic) FMDatabase *database;

@end

@implementation TANDatabase

- (instancetype)initWithPath:(NSString *)path {
    self = [super init];
    if (self) {
        _database = [FMDatabase databaseWithPath:path];
    }
    return self;
}

- (NSArray *)executeQuery:(NSString *)sql {
    if (![self.database open]) {
        return nil;
    }
    FMResultSet *resultSet = [self.database executeQuery:sql];
    NSMutableArray *resultArray = [NSMutableArray array];
    while ([resultSet next]) {
        if (resultSet.resultDictionary) {
            [resultArray addObject:resultSet.resultDictionary];
        }
    }
    return resultArray;
}

- (BOOL)executeUpdate:(NSString *)sql {
    if (![self.database open]) {
        return NO;
    }
    return [self.database executeUpdate:sql];
}

- (TANDBGet *)get {
    return [[TANDBGet alloc] initWithExecutionHandler:^NSArray *(NSString *sql) {
        return [self executeQuery:sql];
    }];
}

- (TANDBSave *)save {
    return [[TANDBSave alloc] initWithExecutionHandler:^BOOL(NSString *sql) {
        return [self executeUpdate:sql];
    }];
}

- (TANDBDelete *)delete {
    return [[TANDBDelete alloc] initWithExecutionHandler:^BOOL(NSString *sql) {
        return [self executeUpdate:sql];
    }];
}

@end
