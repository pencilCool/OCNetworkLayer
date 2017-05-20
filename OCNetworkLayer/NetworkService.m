//
//  NetworkService.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "NetworkService.h"

@interface NetworkService()

@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, assign) NSRange              successCodes;
@property (nonatomic, assign) NSRange              failureCodes;
@end


@implementation NetworkService

- (void)makeRequestWithURL: (NSURL*) url method: (NetworkServiceMethod *)method
                 queryType: (NetworkServiceQueryType) query
                    parmas:(NSDictionary <NSString *,NSObject *> *) parmas
                    header:(NSDictionary <NSString *, NSString *>*)header
                    sucess:(SuccessBlock)successBlock failure: (FailureBlock)failureBlock
{
    NSMutableURLRequest *mutableRequest = [self makeQueryWithURL:url params:parmas type:query];
    mutableRequest.allHTTPHeaderFields = header;
    mutableRequest.HTTPMethod = method;
    
    NSURLSession *session = [NSURLSession sharedSession];
    self.task = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (![response isKindOfClass:[NSURLResponse class]]) {
            if (failureBlock) {
                failureBlock(data,error,0);
            }
            return;
        }
        NSHTTPURLResponse *httpResonse = (NSHTTPURLResponse *)response;
        
        if (error) {
            failureBlock(data,error,httpResonse.statusCode);
        }
        
        if (NSLocationInRange(httpResonse.statusCode, self.successCodes)) {
            NSLog(@"Request finised with success.");
            if (successBlock) {
                successBlock(data);
            }
        } else if (NSLocationInRange(httpResonse.statusCode, self.failureCodes)) {
            NSLog(@"Request finised with failure.");
            if (failureBlock) {
                failureBlock(data,error,httpResonse.statusCode);
            }
        } else {
            NSLog(@"🔴fatal error.");
            NSDictionary *info = @ {
            NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Request failed with code %ld",httpResonse.statusCode],
            NSLocalizedFailureReasonErrorKey:@"Wrong handling logic, wrong endpoing mapping or backend bug",
            };
            NSError *error = [NSError errorWithDomain:@"NetworkService" code:0 userInfo:info];
            if (failureBlock) {
                failureBlock(data,error,httpResonse.statusCode);
            }
        }
    }];
    if (self.task) {
        [self.task resume];
    }
}

- (void)cancel
{
    if (self.task) {
        [self.task cancel];
    }
}



#pragma mark -private method
- (NSMutableURLRequest *)makeQueryWithURL: (NSURL *)url params: (NSDictionary *)params type:(NetworkServiceQueryType)type {
    switch (type) {
        case NetworkServiceQueryTypeJson:
        {
            NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10.0];
            if (params)
            {
                @try {
                     mutableRequest.HTTPBody =  [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
                } @catch (NSException *exception) {
                    NSAssert(nil, @"json to data error");
                }
               
            }
            return mutableRequest;
            break;
        }
            
        case NetworkServiceQueryTypePath:
        {
            NSMutableString *query = @"".mutableCopy;
            [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
                [query appendString:[NSString stringWithFormat:@"%@=%@&",key,value]];
            }];
            NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:true];
            components.query = query;
            return [[NSMutableURLRequest alloc] initWithURL:components.URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10.0];
        }
        default:
            break;
    }
}

- (NSRange)successCodes
{
    _successCodes = NSMakeRange(200, 100);
    return _successCodes;
}

- (NSRange)failureCodes
{
    _failureCodes = NSMakeRange(400, 100);
    return _failureCodes;
}
@end
