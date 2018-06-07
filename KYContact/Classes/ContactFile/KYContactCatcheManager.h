//
//  KYContactCatcheManager.h
//  KYContact
//
//  Created by kingly09 on 2018/10/13.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 负责缓存联系人identifier的类
 */
NS_CLASS_AVAILABLE_IOS(9_0) @interface KYContactCatcheManager : NSObject


/**
 单例方法

 @return 获得KYContactCatcheManager单例对象
 */
+(instancetype)sharedInstace;



/**
 开始加载通讯录所有的identifier

 @param completeBlock 完成后的回调
 */
- (void)startRequestIndentifiers:(void(^)(NSArray <NSString *> *))completeBlock;



/**
 重新获取通讯录的identifier

 @param completeBlock 完成后的回调
 */
- (void)reloadContactIdentifiers:(void(^)(NSArray <NSString *> *))completeBlock;


@end


NS_ASSUME_NONNULL_END
