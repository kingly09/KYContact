//
//  KYContactsObjectManager.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CNContact;
@class CNMutableContact;
@class KYContactObject;


/**
 针对Contacts.framework进行的封装
 */
NS_CLASS_AVAILABLE_IOS(9_0) @interface KYContactObjectManager : NSObject


/**
 根据CNContact对象获得KYContactObject对象

 @param contact CNContact对象

 @return KYContactObject对象
 */
+(KYContactObject *)contantObject:(CNContact *)contact;


@end


@interface KYContactObjectManager (CNContact)


/**
 根据KYContactObject对象获得CNContact对象

 @param contactObject KYContactObject对象

 @return CNContact对象
 */
+(CNMutableContact *)cnContact:(KYContactObject *)contactObject;

@end

NS_ASSUME_NONNULL_END
