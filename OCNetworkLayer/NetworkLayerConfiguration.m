//
//  NetworkLayerConfiguration.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/21.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "NetworkLayerConfiguration.h"
#import "BackendConfiguration.h"
#import "NetworkQueue.h"
@implementation NetworkLayerConfiguration

+ (void)setup {
    NSURL *url = [NSURL URLWithString:@"https://fake.url"];
    BackendConfiguration *conf = [BackendConfiguration shared];
    conf.baseURL = url;
    
    [NetworkQueue shared];
}
@end
