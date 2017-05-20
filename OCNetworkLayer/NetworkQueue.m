//
//  NetworkQueue.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "NetworkQueue.h"

@implementation NetworkQueue

+ (instancetype)shared
{
    static NetworkQueue *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [NetworkQueue new];
    });
    return shared;
}

- (void)addOperation:(NSOperation *)operation
{
    [self.queue addOperation:operation];
}

- (NSOperationQueue *)queue
{
    if (!_queue) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}
@end
