//
//  CNContactFetchRequest+KYContactFile.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright © 2018年 kingly09. All rights reserved.
//

#import "CNContactFetchRequest+KYContactFile.h"
#import "NSString+KYContactFile.h"


@implementation CNContactFetchRequest (KYContactFile)


+(CNContactFetchRequest *)descriptorForAllKeys
{
    return [[CNContactFetchRequest alloc]initWithKeysToFetch:[NSString KYContactAllKeys]];
}


@end
