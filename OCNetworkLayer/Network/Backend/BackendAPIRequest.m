//
//  BackendAPIRequest.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "BackendAPIRequest.h"

// 协议默认实现

@implementation  NSObject(BackendAPIRequestProtocolDefaultImplementation)

- (NSDictionary <NSString *, NSString *> *)defaultJSONHeaders
{
    if (![self conformsToProtocol:@protocol(BackendAPIRequest)])
    {
        return @{@"Content-Type": @"application/json"};
    }
    else
    {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must conform to protocol BackendAPIRequest to access %@.", NSStringFromSelector(_cmd)] userInfo:nil];
    }
}

@end
