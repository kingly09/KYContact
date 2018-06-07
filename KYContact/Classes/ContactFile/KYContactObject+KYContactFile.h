//
//  KYContactObject+KYContactFile.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import "KYContactObject.h"

NS_ASSUME_NONNULL_BEGIN

@class CNContact;
@class CNPostalAddress;

@interface NSObject (KYContactFile)

- (void)contactObject:(CNContact *)contact NS_AVAILABLE_IOS(9_0);

@end

@interface KYContactObject (KYContactFile)

/**
 获得只存放电话号码的数组

 @return 存放电话号码的数组
 */
- (NSArray <NSString *> *)phones;

@end


@interface KYContactNameObject (KYContactFile)

@end


@interface KYContactAddressObject (KYContactFile)

/**
 针对CNPostalAddress进行模型转换

 @param cnAddressObject CNPostalAddress对象
 */
- (void)contactObject:(CNPostalAddress *)cnAddressObject;


@end

NS_ASSUME_NONNULL_END
