//
//  BackendConfiguration.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "BackendConfiguration.h"

@implementation BackendConfiguration


+ (instancetype)shared
{
    static BackendConfiguration *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[BackendConfiguration alloc] init];
    });
    return shared;
}

- (void)setBaseURL:(NSURL *)baseURL
{
    self.baseURL = baseURL;
}

@end
