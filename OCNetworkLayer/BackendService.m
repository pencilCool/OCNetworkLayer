//
//  BackendService.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "BackendService.h"
#import "NetworkService.h"
#import "BackendAPIRequest.h"
#import "BackendConfiguration.h"
@interface BackendService()
@property (nonatomic, strong) BackendConfiguration *conf;
@property (nonatomic, strong) NetworkService *service;
@end

@implementation BackendService

- (instancetype) initWithConf: (BackendConfiguration *)conf
{
    if (self = [super init]) {
        self.conf = conf;
    }
    return self;
}

- (void)requestWith: (id<BackendAPIRequest>)request success: (void (^)(id))successBlock failure: (void (^)(NSError *))failure {
    NSURL *url = [self.conf.baseURL URLByAppendingPathComponent:request.endpoint];
    NSMutableDictionary *headers = request.headers.mutableCopy;
    // Set authentication token if available.
    //headers?(headers[@"X-Api-Auth-Token"] = BackendAuth.shared.token):nil;
    [self.service makeRequestWithURL:url
                              method:request.method
                           queryType:request.quertyTyep
                              parmas:request.parameters
                              header:headers
                              sucess:^(NSData *data) {
                                  id json = nil;
                                  if (data) {
                                      @try {
                                          json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                      } @catch (NSException *exception) {}
                                  }
                                  successBlock(json);
        
    } failure:^(NSData *data, NSError *error, NSInteger statusCode) {
        
        if (statusCode == 401) {
            // Operation not authorized
            [[NSNotificationCenter defaultCenter] postNotificationName:DidPerformUnauthorizedOperation object:nil];
            return;
        }
        
        if (data) {
            @try {
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSString *description = [json valueForKey:@"error"]?[json valueForKey:@"error"]:@"";
                NSDictionary *info = @{
                                       NSLocalizedDescriptionKey:description,
                                       NSLocalizedFailureReasonErrorKey:@"Probably not allowed action."
                                       };
                NSError *error = [NSError errorWithDomain:@"BackendService" code:0 userInfo:info];
                
                if (failure) {
                    failure(error);
                }
                
            } @catch (NSException *exception) { }
        } else {
            if (failure) {
                failure(error? error:[NSError errorWithDomain:@"BackendService" code:0 userInfo:nil]);
            }
            
        }
        
    }];
    
    
}

- (void)cancel{
    [self.service cancel];
}


- (NetworkService *)service
{
    if (_service) {
        _service = [[NetworkService alloc] init];
    }
    return _service;
}
@end
