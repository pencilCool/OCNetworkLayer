//
//  NetworkOperation.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "NetworkOperation.h"

@interface NetworkOperation()
@property (readwrite, getter=isReady) BOOL ready;
@property (readwrite, getter=isExecuting) BOOL executing;
@property (readwrite, getter=isFinished) BOOL finished;
@property (readwrite, getter=isCancelled) BOOL cancelled;
@property (readwrite, getter=isStarted) BOOL started;
@end

@implementation NetworkOperation
@synthesize ready = _ready;
@synthesize executing = _executing;
@synthesize finished = _finished;
@synthesize cancelled = _cancelled;



- (instancetype)init {
    if (self = [super init]) {
        _ready = NO;
        _executing = NO;
        _finished = NO;
        _cancelled = NO;
        self.name = @"Network Operation";
    }
    return self;
}

- (BOOL)isAsynchronous {
    return YES;
}

- (void)start {
    if (!self.isExecuting) {
        self.ready = false;
        self.executing = true;
        self.finished = false;
        self.cancelled = false;
        NSLog(@"%@ operation started",self.name);
    }
}


- (void)finish {
    NSLog(@"%@ operation finished",self.name);
    self.executing = false;
    self.finished = true;
}

- (void)cancel
{
    NSLog(@"%@ operation cancelled",self.name);
    self.executing = false;
    self.cancelled = true;
}































@end
