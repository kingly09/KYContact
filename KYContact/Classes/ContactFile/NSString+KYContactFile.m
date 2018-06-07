//
//  NSString+KYContactFile.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import "NSString+KYContactFile.h"

@import Contacts;

@implementation NSString (KYContactFile)

+(NSArray<id<CNKeyDescriptor>> *)KYContactNameKeys
{
    return @[
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 100000
             CNContactPhoneticOrganizationNameKey,
#endif
             CNContactNamePrefixKey,
             CNContactGivenNameKey,
             CNContactMiddleNameKey,
             CNContactFamilyNameKey,
             CNContactPreviousFamilyNameKey,
             CNContactNameSuffixKey,
             CNContactNicknameKey,
             CNContactPhoneticGivenNameKey,
             CNContactPhoneticMiddleNameKey,
             CNContactPhoneticFamilyNameKey
             ];
}


+(NSArray<id<CNKeyDescriptor>> *)KYContactNamePhoneKeys
{
    NSArray * nameKeys = [self KYContactNameKeys];
    NSArray * phoneKeys = @[CNContactPhoneNumbersKey];
    
    return [nameKeys arrayByAddingObjectsFromArray:phoneKeys];
}


+(NSArray <id<CNKeyDescriptor>> *)KYContactAllKeys
{
    return @[
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 100000
             CNContactPhoneticOrganizationNameKey,
#endif
             //identifier
             CNContactIdentifierKey,
             
             //name
             CNContactNamePrefixKey,
             CNContactGivenNameKey,
             CNContactMiddleNameKey,
             CNContactFamilyNameKey,
             CNContactPreviousFamilyNameKey,
             CNContactNameSuffixKey,
             CNContactNicknameKey,
             
             //phonetic
             CNContactPhoneticGivenNameKey,
             CNContactPhoneticMiddleNameKey,
             CNContactPhoneticFamilyNameKey,
             
             //number
             CNContactPhoneNumbersKey,
             
             //email
             CNContactEmailAddressesKey,
             
             //postal
             CNContactPostalAddressesKey,
             
             //job
             CNContactJobTitleKey,
             CNContactDepartmentNameKey,
             CNContactOrganizationNameKey,
             
             //note
             CNContactNoteKey,
             
             //type
             CNContactTypeKey,
             
             //birthday
             CNContactBirthdayKey,
             CNContactNonGregorianBirthdayKey,
             
             //instantMessageAddresses
             CNContactInstantMessageAddressesKey,
             
             //relation
             CNContactRelationsKey,
             
             //SocialProfiles
             CNContactSocialProfilesKey,
             
             //Dates
             CNContactDatesKey
             ];
}

@end
