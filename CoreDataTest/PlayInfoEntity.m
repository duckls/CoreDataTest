//
//  PlayInfoEntity.m
//  CoreDataTest
//
//  Created by duck on 16/7/31.
//  Copyright © 2016年 duck. All rights reserved.
//

#import "PlayInfoEntity.h"

@implementation PlayInfoEntity

//  防止 Playinfo 类型有的的属性 而 coreData PlayInfoEntity 实体类没有，崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
