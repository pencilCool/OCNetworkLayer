//
//  BackendConfiguration.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BackendConfiguration : NSObject

@property (nonatomic, copy) NSURL *baseURL;

+ (instancetype) shared;
@end
