//
//  NetworkQueue.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkQueue : NSObject
@property (nonatomic, strong) NSOperationQueue *queue;

+ (instancetype)shared;

- (void) addOperation: (NSOperation *)operation;

@end
