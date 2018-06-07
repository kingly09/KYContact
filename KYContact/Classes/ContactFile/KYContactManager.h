//
//  KYContactsManager.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KYContactObject;
@protocol CNKeyDescriptor;


/**
 针对Contacts.framework进行请求数据的类
 */
NS_CLASS_AVAILABLE_IOS(9_0) @interface KYContactManager : NSObject


/**
 想要获得的键值描述，详见NSString+KYContactFile.m 或者 CNContact.h,默认为KYContactAllKeys
 */
@property (nonatomic, copy)NSArray <id<CNKeyDescriptor>> * descriptors;

/**
 发生变化的回调,返回更新后的数组
 */
@property (nonatomic, copy)void(^contactDidChange)(NSArray<KYContactObject *>*);


/**
 便利初始化方法

 @param contactDidChange 发生变化进行的回调

 @return KYContactManager初始化完毕的KYContactManager对象
 */
-(instancetype)initContactDidChange:(void(^)(NSArray<KYContactObject *>*)) contactDidChange;


/**
 请求所有的联系人,按照添加人的时间顺序
 
 @param completeBlock 获取到数据完成的回调
 @param defendBlock   没有权限进行的回调
 */
- (void)requestContactsComplete:(void (^)(NSArray <KYContactObject *> *))completeBlock defendBlock:(void(^)(void)) defendBlock;


@end


@interface KYContactManager (KYAddContact)


/**
 添加联系人

 @param contact 添加的联系人对象
 */
- (void)addContact:(KYContactObject *)contact;




@end

NS_ASSUME_NONNULL_END
