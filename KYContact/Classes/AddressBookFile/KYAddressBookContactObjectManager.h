//
//  YContactObjectManager.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@class KYContactObject;

NS_ASSUME_NONNULL_BEGIN


/**
 针对AddressBook.framework进行封装的类
 */
NS_CLASS_DEPRECATED_IOS(2_0, 9_0,"Use KYContactObjectManager instead") @interface KYAddressBookContactObjectManager : NSObject


/**
 *  根据ABRecordRef数据获得KYContactObject对象
 *
 *  @param recordRef ABRecordRef对象
 *
 *  @return KYContactObject对象
 */
+(KYContactObject *)contantObject:(ABRecordRef)recordRef;




@end


@interface KYAddressBookContactObjectManager (ABRecordRef)

/**
 根据KYContactObject对象获得ABRecordRef数据,使用后请求手动管理ABRecordRef
 
 @param contactObject KYContactObject对象
 
 @return ABRecordRef数据
 */
+(ABRecordRef)recordRef:(KYContactObject *)contactObject;

@end

NS_ASSUME_NONNULL_END
