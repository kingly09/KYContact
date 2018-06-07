//
//  KYAddressBookContactManager.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KYContactObject;


/**
 针对AddressBook.framework进行请求数据的类
 */
NS_CLASS_DEPRECATED_IOS(2_0, 9_0,"Use KYContactManager instead") @interface KYAddressBookContactManager : NSObject


/**
 发生变化的回调,返回更新后的数组
 */
@property (nonatomic, copy)void(^addressBookDidChange)(NSArray<KYContactObject *>*);


/**
 请求所有的联系人,按照添加人的时间顺序

 @param completeBlock 获取到数据完成的回调
 @param defendBlock   没有权限进行的回调
 */
- (void)requestContactsComplete:(void (^)(NSArray <KYContactObject *> *))completeBlock defendBlock:(void(^)(void)) defendBlock;


@end


@interface KYAddressBookContactManager (KYAddContact)


/**
 添加联系人

 @param contact 添加的联系人对象
 */
- (void)addContact:(KYContactObject *)contact;

@end

NS_ASSUME_NONNULL_END
