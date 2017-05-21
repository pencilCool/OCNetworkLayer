//
//  ServiceOperation.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ServiceOperation.h"
#import "BackendConfiguration.h"

@implementation ServiceOperation

- (instancetype) init
{
    if (self = [super init]) {
        self.service = [[BackendService alloc] initWithConf:[BackendConfiguration shared]];
    }
    return self;
}

- (void)cancel
{
    [self.service cancel];
}
@end
