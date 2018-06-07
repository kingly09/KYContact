//
//  CNMutableContact+KYContactFile.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Contacts/Contacts.h>

@class KYContactNameObject;
@class KYContactPhoneObject;
@class KYContactJobObject;
@class KYContactEmailObject;
@class KYContactAddressObject;
@class KYContactInstantMessageObject;
@class KYContactSocialProfileObject;

NS_ASSUME_NONNULL_BEGIN

@interface CNMutableContact (KYContactFile)


//name

/**
 姓名对象的便利赋值方法

 @param nameObject 赋值的KYContactNameObject对象
 */
- (void)nameWithNameObject:(KYContactNameObject *)nameObject;


//phone

/**
 电话对象的便利赋值方法

 @param phoneObjects 赋值的[KYContactPhoneObject]()
 */
- (void)phoneWithPhoneObjects:(NSArray<KYContactPhoneObject *> *)phoneObjects;


//job

/**
 工作对象的便利赋值方法

 @param jobObject 赋值的KYContactJobObject
 */
- (void)jobWithJobObjects:(KYContactJobObject *)jobObject;


//emails

/**
 邮件对象的便利赋值方法

 @param emailObjects 赋值的[KYContactEmailObject]()
 */
- (void)emailWithEmailObjects:(NSArray <KYContactEmailObject *> *)emailObjects;


//address

/**
 地址对象的便利赋值方法

 @param addressObjects 赋值的[KYContactAddressObject]()
 */
- (void)addressWithAddressObjects:(NSArray <KYContactAddressObject *> *)addressObjects;


//instant

/**
 即时通讯对象的便利赋值方法

 @param instantObjects 赋值的[KYContactInstantMessageObject]()
 */
- (void)instantWithInstantObjects:(NSArray <KYContactInstantMessageObject *> *)instantObjects;


//social

/**
 社交对象的便利赋值方法

 @param socialObjects 赋值的[KYContactSocialProfileObject]对象
 */
- (void)socialProfileWithSocialObjects:(NSArray <KYContactSocialProfileObject *> *)socialObjects;


@end


@interface CNMutablePostalAddress (KYContactFile)


/**
 根据KYContactAddressObject对象生成的便利构造器

 @param addressObject KYContactAddressObject对象

 @return 创建完毕的CNPostalAddress对象
 */
+ (instancetype)postalAddress:(KYContactAddressObject *)addressObject;

@end


NS_ASSUME_NONNULL_END
