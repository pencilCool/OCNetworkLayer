//
//  NetworkService.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum Method: String {
//case get, post, put, delete
//}
typedef NSString NetworkServiceMethod;
static NetworkServiceMethod * const NetworkServiceMethod_GET = @"get";
static NetworkServiceMethod * const NetworkServiceMethod_POST = @"post";
static NetworkServiceMethod * const NetworkServiceMethod_PUSH = @"push";
static NetworkServiceMethod * const NetworkServiceMethod_DELETE = @"delete";


//enum QueryType {
//case json, path
//}

typedef NS_ENUM(NSUInteger, NetworkServiceQueryType) {
    NetworkServiceQueryTypeJson,
    NetworkServiceQueryTypePath,
};

typedef void (^SuccessBlock)(NSData*);
typedef void (^FailureBlock)(NSData *data, NSError *error,NSInteger responseCode);
@interface NetworkService : NSObject

- (void)makeRequestWithURL: (NSURL*) url method: (NetworkServiceMethod *)method queryType: (NetworkServiceQueryType) query parmas:(NSDictionary <NSString *,NSObject *> *) parmas
                    header:(NSDictionary <NSString *, NSString *>*)header
                    sucess:(SuccessBlock)successBlock failure: (FailureBlock)failureBlock;

- (void)cancel;

@end
