//
//  CNContactFetchRequest+KYContactFile.h
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Contacts/Contacts.h>

NS_ASSUME_NONNULL_BEGIN

@interface CNContactFetchRequest (KYContactFile)


/**
 获得联系人所有key的请求的便利初始化方法

 @return CNContactFetchRequest对象
 */
+(CNContactFetchRequest *)descriptorForAllKeys;

@end



NS_ASSUME_NONNULL_END
