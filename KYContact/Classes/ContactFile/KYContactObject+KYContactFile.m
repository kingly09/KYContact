//
//  KYContactObject+KYContactFile.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import "KYContactObject+KYContactFile.h"

@import ObjectiveC;
@import Contacts;

@implementation NSObject (KYContactFile)

-(void)contactObject:(CNContact *)contact
{
    
}

@end

@implementation KYContactObject (KYContactFile)


-(void)contactObject:(CNContact *)contact
{
    [super contactObject:contact];
}

-(NSArray<NSString *> *)phones
{
    NSMutableArray <NSString *> * mulitPhones = [NSMutableArray arrayWithCapacity:self.phoneObject.count];
    
    for (KYContactPhoneObject * phoneObject in self.phoneObject)
    {
        [mulitPhones addObject:phoneObject.phoneNumber];
    }
    
    return [mulitPhones copy];
}

@end


@implementation KYContactNameObject (KYContactFile)

-(void)contactObject:(CNContact *)contact
{
    [super contactObject:contact];
    
    //设置姓名属性
    self.nickName = contact.nickname;                   //昵称
    self.givenName = contact.givenName;                 //名字
    self.familyName = contact.familyName;               //姓氏
    self.middleName = contact.middleName;               //中间名
    self.namePrefix = contact.namePrefix;               //名字前缀
    self.nameSuffix = contact.nameSuffix;               //名字的后缀
    self.phoneticGivenName = contact.phoneticGivenName; //名字的拼音或音标
    self.phoneticFamilyName = contact.phoneticFamilyName;//姓氏的拼音或音标
    self.phoneticMiddleName = contact.phoneticMiddleName;//中间名的拼音或音标
    
    if (UIDevice.currentDevice.systemVersion.floatValue >= 10.0) {
        
       // self.phoneticOrganizationName = contact.phoneticOrganizationName;//公司(组织)的拼音或音标
    }
}


@end


static NSString * formattedAddressKey;

@implementation KYContactAddressObject (KYContactFile)


-(void)contactObject:(CNPostalAddress *)cnAddressObject
{
    self.street = cnAddressObject.street;
    self.city = cnAddressObject.city;
    self.state = cnAddressObject.state;
    self.postalCode = cnAddressObject.postalCode;
    self.country = cnAddressObject.country;
    self.ISOCountryCode = cnAddressObject.ISOCountryCode;
    
    //set
    self.formattedAddress = [CNPostalAddressFormatter stringFromPostalAddress:cnAddressObject style:CNPostalAddressFormatterStyleMailingAddress];
}

-(void)dealloc
{
    
}


@end
