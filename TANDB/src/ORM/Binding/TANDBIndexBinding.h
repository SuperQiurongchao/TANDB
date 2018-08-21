//
//  TANDBIndexBinding.h
//  TANDB
//
//  Created by 邱荣超 on 2018/8/15.
//  Copyright © 2018年 邱荣超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TANDBColumn.h"

@interface TANDBIndexBinding : NSObject

- (instancetype)initWithIndexName:(NSString *)indexName;

- (NSArray<TANDBColumn *> *)index;

- (void)addIndexWithColumn:(TANDBColumn *)column;

@end
