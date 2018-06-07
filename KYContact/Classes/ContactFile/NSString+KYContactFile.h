//
//  NSString+KYContactFile.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CNKeyDescriptor;

@interface NSString (KYContactFile)

/**
 获得联系人所有描述姓名键的便利方法

 @return 存放姓名描述姓名键的便利方法
 */
+ (NSArray <id <CNKeyDescriptor>> *)KYContactNameKeys;




/**
 获得联系人所有描述名字以及电话的便利方法

 @return 存放姓名以及电话描述键的便利方法
 */
+ (NSArray <id <CNKeyDescriptor>> *)KYContactNamePhoneKeys;



/**
 获得所有联系人的所有键的便利方法

 @return 存放所有联系人所有键的便利方法
 */
+ (NSArray <id<CNKeyDescriptor>> *)KYContactAllKeys;

@end


NS_ASSUME_NONNULL_END
