//
//  BackendAPIRequest.h
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkService.h"

@protocol BackendAPIRequest <NSObject>

@property (nonatomic, strong, readonly) NSString *endpoint;
@property (nonatomic, strong, readonly) NetworkServiceMethod *method;
@property (nonatomic, assign, readonly) NetworkServiceQueryType quertyTyep;
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSObject *> *parameters;
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSString *> *headers;


@end


//extension BackendAPIRequest {
//    
//    func defaultJSONHeaders() -> [String: String] {
//        return ["Content-Type": "application/json"]
//    }
//}


@interface NSObject(BackendAPIRequestProtocolDefaultImplementation)

- (NSDictionary <NSString *, NSString *>*)defaultJSONHeaders;

@end
