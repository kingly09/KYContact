//
//  CNMutableContact+KYContactFile.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import "CNMutableContact+KYContactFile.h"
#import "KYContactObject.h"

@implementation CNMutableContact (KYContactFile)


-(void)nameWithNameObject:(KYContactNameObject *)nameObject
{
    if (nameObject == nil) {
        return;
    }
    
    //name
    self.nickname = nameObject.nickName;
    self.givenName = nameObject.givenName;
    self.familyName = nameObject.familyName;
    self.middleName = nameObject.middleName;
    self.namePrefix = nameObject.namePrefix;
    self.nameSuffix = nameObject.nameSuffix;
    self.phoneticGivenName = nameObject.phoneticGivenName;
    self.phoneticFamilyName = nameObject.phoneticFamilyName;
    self.phoneticMiddleName = nameObject.phoneticMiddleName;
    
    if (UIDevice.currentDevice.systemVersion.floatValue >= 10.0) {
        
//      if (@available(iOS 10_0, *)) {
//        self.phoneticOrganizationName = nameObject.phoneticOrganizationName;
//      } else {
//        // Fallback on earlier versions
//      }
    }
}



-(void)phoneWithPhoneObjects:(NSArray<KYContactPhoneObject *> *)phoneObjects
{
    if (phoneObjects == nil) {
        return;
    }
    
    NSMutableArray <CNLabeledValue *>* values = [NSMutableArray arrayWithCapacity:phoneObjects.count];
    
    for (KYContactPhoneObject * phoneObject in phoneObjects)
    {
        CNLabeledValue * labelValue = [CNLabeledValue labeledValueWithLabel:phoneObject.phoneTitle value:[CNPhoneNumber phoneNumberWithStringValue:phoneObject.phoneNumber ]];
        
        [values addObject:labelValue];
    }
    
    self.phoneNumbers = [values mutableCopy];
}



-(void)jobWithJobObjects:(KYContactJobObject *)jobObject
{
    if (jobObject == nil) {
        return;
    }
    
    self.organizationName = jobObject.organizationName;
    self.departmentName = jobObject.departmentName;
    self.jobTitle = jobObject.jobTitle;
}



-(void)emailWithEmailObjects:(NSArray<KYContactEmailObject *> *)emailObjects
{
    if (emailObjects == nil) {
        return;
    }
    
    NSMutableArray <CNLabeledValue *>* values = [NSMutableArray arrayWithCapacity:emailObjects.count];
    
    for (KYContactEmailObject * emailObject in emailObjects)
    {
        [values addObject:[CNLabeledValue labeledValueWithLabel:emailObject.emailTitle value:emailObject.emailAddress]];
    }
    
    self.emailAddresses = [values mutableCopy];
}


-(void)addressWithAddressObjects:(NSArray<KYContactAddressObject *> *)addressObjects
{
    if (addressObjects == nil) {
        return;
    }
    
    NSMutableArray <CNLabeledValue *>* values = [NSMutableArray arrayWithCapacity:addressObjects.count];
    
    for (KYContactAddressObject * addressObject in addressObjects)
    {
        [values addObject:[CNLabeledValue labeledValueWithLabel:addressObject.addressTitle value:[CNMutablePostalAddress postalAddress:addressObject]]];
    }
    
    self.postalAddresses = [values mutableCopy];
}


-(void)instantWithInstantObjects:(NSArray<KYContactInstantMessageObject *> *)instantObjects
{
    if (instantObjects == nil) {
        return;
    }
    
    NSMutableArray <CNLabeledValue *>* values = [NSMutableArray arrayWithCapacity:instantObjects.count];
    
    for (KYContactInstantMessageObject * messageObject in instantObjects)
    {
        [values addObject:[CNLabeledValue labeledValueWithLabel:nil value:[[CNInstantMessageAddress alloc] initWithUsername:messageObject.userName service:messageObject.service]]];
    }
    
    self.instantMessageAddresses = [values mutableCopy];
}


-(void)socialProfileWithSocialObjects:(NSArray <KYContactSocialProfileObject *> *)socialObjects
{
    if (socialObjects == nil) {
        return;
    }
    
    NSMutableArray <CNLabeledValue *>* values = [NSMutableArray arrayWithCapacity:socialObjects.count];
    
    for (KYContactSocialProfileObject * socialObject in socialObjects)
    {
        [values addObject:[CNLabeledValue labeledValueWithLabel:nil value:[[CNSocialProfile alloc]initWithUrlString:socialObject.socialProFileUrl username:socialObject.socialProFileAccount userIdentifier:nil service:socialObject.socialProfileTitle]]];
    }
    
    self.socialProfiles = [values mutableCopy];
}


@end







@implementation CNMutablePostalAddress (KYContactFile)

+(instancetype)postalAddress:(KYContactAddressObject *)addressObject
{
    CNMutablePostalAddress * address = [[CNMutablePostalAddress alloc]init];
    
    //set value
    address.street = addressObject.street;
    address.city = addressObject.city;
    address.state = addressObject.state;
    address.postalCode = addressObject.postalCode;
    address.country = addressObject.country;
    address.ISOCountryCode = addressObject.ISOCountryCode;
    
    return address;
}

@end
