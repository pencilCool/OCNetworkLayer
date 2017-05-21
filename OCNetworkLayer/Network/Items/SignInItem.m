//
//  SignInItem.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/20.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignInItem.h"

@implementation SignInItem
- (instancetype)initWithToken:(NSString *)token uniqueId: (NSString *)uniqueId
{
    if (self = [super init]) {
        self.token = token;
        self.uniqueId = uniqueId;
    }
    return self;
}
@end
