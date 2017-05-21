//
//  BackendService.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BackendConfiguration;
@protocol BackendAPIRequest;

static NSString * const DidPerformUnauthorizedOperation = @"DidPerformUnauthorizedOperation";
@interface BackendService : NSObject

- (instancetype) initWithConf: (BackendConfiguration *)conf;

- (void)requestWith: (id<BackendAPIRequest>)request success: (void (^)(id))successBlock failure: (void (^)(NSError *))failure;

- (void)cancel;
@end
