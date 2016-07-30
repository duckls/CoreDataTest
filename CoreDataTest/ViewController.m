//
//  ViewController.m
//  CoreDataTest
//
//  Created by duck on 16/7/31.
//  Copyright © 2016年 duck. All rights reserved.
//

#import "ViewController.h"
#import "VideoData.h"
#import "MagicalRecord.h"
#import "PlayInfoEntity+CoreDataProperties.h"
#import "Playinfo.h"

#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()
@property (nonatomic ,copy)NSArray<Playinfo *> * data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * mData = [[NSMutableArray alloc]init];
    for (NSDictionary * dict in [self loadData]) {
        VideoData * data = [[VideoData alloc]initWithDictionary:dict error:nil];
        /**
         *  因为数据字段太多 而我又用coreData测试
            你可以自己测试，更改数据源,创建CoreData表
            我这里就用 Playinfo 对象测试
         */
//        [mData addObject:data];
        [mData addObject:[data.playInfo firstObject]];
    }
    self.data = mData;
    
}

- (id)loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jsonData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *videoList = [rootDict objectForKey:@"videoList"];
    return videoList;
}
/**
 *  保存数据
 *
 *  @param sender
 */
- (IBAction)save:(id)sender {
    //拿到要保存数据模型 Playinfo
    Playinfo  * info  = [self.data firstObject];
    
    //创建CoreData 模型对象(本人用的是第三方 MagicalRecord 框架操作数据库，关于MagicalRecord运用请自行谷歌)
    PlayInfoEntity * entity = [PlayInfoEntity MR_createEntity];
    
    //模型转换成 字典（NSDictionary），我用jsonModel去解析的(jsonModel 解析自行谷歌)
    NSDictionary * dictInfo = [info toDictionary];
    
    //循环字典
    [dictInfo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        /**
         *  因为 Core数据库 里面不能存 数组（NSArrAy）字典（NSDictionary） 等一些其他或者自定义的类型。
            所以要判断一下，根据你的数据源过滤一下,否则会崩溃。
            我这里数据库里面只有 NSNumber 和 NSString  类型 如有有其他的类型如 Date 可以在加判断
         */
        if ([obj isKindOfClass:[NSString class]]||[obj isKindOfClass:[NSNumber class]]) {
            /**
             *  调用 set 给 CoreData 对象赋值 
             注意：PlayInfoEntity 必须实现
             （ setValue:(id)value forUndefinedKey:(NSString *)key ）此函数
             防止 Playinfo 类型有的的属性 而 coreData PlayInfoEntity 实体类没有，崩溃
             
             */
            [entity setValue:obj forKeyPath:key];
        }
    }];
    /**
     *  保存数据
     */
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
/**
 *  读取数据库
 *
 *  @param sender
 */
- (IBAction)read:(id)sender {
    
    /**
     * 测试 查询CoreData数据第一条
     */
    PlayInfoEntity * entity = [[PlayInfoEntity MR_findAll]firstObject];
    /**
     *  获取类成员属性集合
     */
    NSArray * propertys = [self getClassProperty:[Playinfo class]];
    /**
     *  模型转 字典（NSDictionary）
     */
    NSDictionary *  dict = [entity dictionaryWithValuesForKeys:propertys];
    /**
        成功转换成 Playinfo 对象
    
     */
    Playinfo * info = [[Playinfo alloc]initWithDictionary:dict error:nil];

    /**
     *  两个不同对象但字段(属性)相同的赋值
     */
    
    NSLog(@"==%@",info);
}

/**
 *  获取类成员属性，包含扩展属性
 *
 *  @param className Class
 *
 *  @return 成员属性数组
 */
- (NSArray<NSString *> *)getClassProperty:(Class)className{
    unsigned int count;
    
    NSMutableArray * allproperty = [[NSMutableArray alloc]init];
    //获得指向该类所有属性的指针
    objc_property_t *properties = class_copyPropertyList(className, &count);
    
    for (int i = 0; i < count; i++) {
        //获取该类的一个属性的指针
        objc_property_t property = properties[i];
        //获取属性的名称
        const char *name = property_getName(property);
        //将c的字符串转化为OC字符串
        NSString *key = [NSString stringWithUTF8String:name];
        [allproperty addObject:key];
    }
    //记得释放
    free(properties);
    return allproperty;
}


@end
