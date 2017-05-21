//
//  NSError+Failure.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/21.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "NSError+Failure.h"

@implementation NSError (Failure)
+ (NSError *)cannotParseResponse {
    NSDictionary *info = @{
                           NSLocalizedDescriptionKey: @"Can't parse response. Please report a bug.",
                           };
    return [NSError errorWithDomain:NSStringFromClass(self) code:0 userInfo:info];
}
@end
