//
//  UserItem.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "UserItem.h"

@implementation UserItem

- (instancetype) initWithUniqueId: (NSString *)uniqueId firstName: (NSString *)firstName lastName: (NSString *)lastName email: (NSString *)email phoneNumber: (NSString *)phoneNumber
{
    if (self = [super init])
    {
        _uniqueId = uniqueId;
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _phoneNumber = phoneNumber;

    }
    return self;
}
@end
