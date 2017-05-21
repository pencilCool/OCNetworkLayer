//
//  ServiceOperation.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "NetworkOperation.h"
#import "BackendService.h"
@interface ServiceOperation : NetworkOperation
@property (nonatomic, strong) BackendService *service;

@end
