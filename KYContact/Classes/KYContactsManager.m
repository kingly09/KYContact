//
//  YContactsManager.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYContactsManager.h"
#import "KYContacts.h"

//#ifdef ContactFrameworkIsAvailable
#import "KYContactManager.h"
//#else
#import "KYAddressBookContactManager.h"
//#endif



@interface KYContactsManager ()

//#ifndef ContactFrameworkIsAvailable
/**
 负责针对AddressBook进行数据请求的类
 */
@property (nonatomic, strong) KYAddressBookContactManager * addressBookContactManager;

//#else
/**
 负责针对Contact进行数据请求的类
 */
@property (nonatomic, strong) KYContactManager * contactManager NS_AVAILABLE_IOS(9_0);

//#endif

@end



@implementation KYContactsManager


-(instancetype)init
{
    if (self = [super init])
    {
//#ifndef ContactFrameworkIsAvailable
        if (!isAvailableContactFramework)
        {
            self.addressBookContactManager = [[KYAddressBookContactManager alloc]init];
        }
//#else
        else {
            
            self.contactManager = [[KYContactManager alloc]init];
        }
//#endif
        
    }
    
    return self;
}


-(void)dealloc
{
    NSLog(@"[dealloc]-[%@]",NSStringFromClass([self class]));
}



#pragma mark - 请求通讯录
//请求通讯录
-(void)requestContactsComplete:(void (^)(NSArray<KYContactObject *> * _Nonnull))completeBlock defendBlock:(nonnull void (^)(void))defendBlock
{
    [self requestContactsType:ContactsTypeDefault Complete:completeBlock defendBlock:defendBlock];
}


-(void)requestContactsType:(ContactsType)contactType Complete:(void (^)(NSArray<KYContactObject *> * _Nonnull))completeBlock defendBlock:(void (^)(void))defendBlock
{

//#ifndef ContactFrameworkIsAvailable
    
    if (!isAvailableContactFramework)
    {
        //change Block
        self.addressBookContactManager.addressBookDidChange = self.contactDidChange;
        
        //如果是addressBook
        [self.addressBookContactManager requestContactsComplete:^(NSArray<KYContactObject *> * _Nonnull contacts) {
            
            completeBlock(contacts);
            
        } defendBlock:^{
            
            defendBlock();
            
        }];
    }
    
//#else
    else {
        //如果是contact
        self.contactManager.descriptors = self.descriptors;
        self.contactManager.contactDidChange = self.contactDidChange;
        
        [self.contactManager requestContactsComplete:^(NSArray<KYContactObject *> * _Nonnull contacts) {
            
            completeBlock(contacts);
            
        } defendBlock:^{
            
            defendBlock();
            
        }];
    }
    
//#endif
}



@end


@implementation KYContactsManager (KYAddContact)

-(void)addContact:(KYContactObject *)contact
{
    if (contact == nil) return;

//#ifndef ContactFrameworkIsAvailable
    if (!isAvailableContactFramework) {
        
        [self.addressBookContactManager addContact:contact];
    }
   //#else
    else {
       
        [self.contactManager addContact:contact];
    }
//#endif
    
}

@end
