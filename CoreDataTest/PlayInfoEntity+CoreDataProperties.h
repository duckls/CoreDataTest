//
//  PlayInfoEntity+CoreDataProperties.h
//  CoreDataTest
//
//  Created by duck on 16/7/31.
//  Copyright © 2016年 duck. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PlayInfoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayInfoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSNumber *height;
@property (nullable, nonatomic, retain) NSNumber *width;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
