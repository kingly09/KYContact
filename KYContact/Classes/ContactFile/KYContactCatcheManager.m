//
//  KYContactCatcheManager.m
//  KYContact
//
//  Created by kingly09 on 2018/10/13.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import "KYContactCatcheManager.h"

@import Contacts;

@interface KYContactCatcheManager ()

/// 负责读取通讯的store
@property (nonatomic, strong) CNContactStore * contactStore;

/// 存放所有标志位的数组
@property (nonatomic, strong) NSMutableArray <NSString *> * multIdentifiers;

/// 是否应该缓存
@property (nonatomic, assign) BOOL shouldCatche;

@end

@implementation KYContactCatcheManager


-(instancetype)init
{
    if (self = [super init])
    {
        _contactStore = [[CNContactStore alloc]init];
        _multIdentifiers = [NSMutableArray arrayWithCapacity:0];
        _shouldCatche = true;

    }
    
    return self;
}

+(instancetype)sharedInstace
{
    static KYContactCatcheManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[KYContactCatcheManager alloc]init];
        
    });
    
    return manager;
}

#pragma mark -


-(void)startRequestIndentifiers:(void (^)(NSArray<NSString *> * _Nonnull))completeBlock
{
    if (_multIdentifiers.count == 0)
    {
        //重新获取
        [self reloadContactIdentifiers:^(NSArray<NSString *> * _Nonnull contacts) {
           
            completeBlock(contacts); return;
            
        }];
    }
    
    else
    {
        //直接返回，避免缓存之后跳转页面阻塞线程卡顿
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            //主线程回调
            dispatch_async(dispatch_get_main_queue(), ^{
                
                completeBlock(self.identifiers);
            });
        });
    }
}



-(void)reloadContactIdentifiers:(void (^)(NSArray<NSString *> * _Nonnull))completeBlock
{
    //移除所有的对象
    [_multIdentifiers removeAllObjects];
    
    __weak typeof(self) weakSelf = self;
    
        //异步读取所有的通讯录的identifier
        dispatch_queue_t contactQueue = dispatch_queue_create("KYContactCatheQueue", NULL);
        dispatch_async(contactQueue, ^{
            
            //获取联系人
            [self.contactStore enumerateContactsWithFetchRequest:[[CNContactFetchRequest alloc]initWithKeysToFetch:@[CNContactIdentifierKey]] error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
                
                //进行添加
                [weakSelf.multIdentifiers addObject:contact.identifier];
                
            }];
            
            //主线程完成之后进行回调
            dispatch_async(dispatch_get_main_queue(), ^{
                
                 completeBlock(self.identifiers);
                
            });
        });
}





#pragma mark - getter function

-(NSArray<NSString *> *)identifiers
{
    return [_multIdentifiers mutableCopy];
}


@end
