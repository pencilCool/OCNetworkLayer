//
//  SignUpRequest.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignInRequest.h"
@interface SignInRequest()
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

@end

@implementation SignInRequest
@synthesize endpoint = _endpoint;
@synthesize method = _method;
@synthesize quertyTyep = _quertyTyep;
@synthesize parameters = _parameters;
@synthesize headers = _headers;



- (instancetype) initWithEmail:(NSString *)email password: (NSString *)password
{
    if (self = [super init]) {
        _email = email;
        _password = password;
    }
    return self;
}




#pragma mark - BackendAPIRequest
- (NSString *)endpoint
{
    if (!_endpoint) {
        _endpoint = @"/users/sign_in";
    }
    return _endpoint;
}

- (NetworkServiceMethod *)method
{
    if (!_method) {
        _method = NetworkServiceMethod_POST;
    }
    return _method;
}

- (NetworkServiceQueryType)quertyTyep
{
    if (!_quertyTyep) {
        _quertyTyep = NetworkServiceQueryTypeJson;
    }
    return _quertyTyep;
}


- (NSDictionary<NSString *,NSObject *> *)parameters
{
    if (!_parameters) {
        _parameters =  @{
                         @"email": self.email,
                         @"password": self.password
                         };
    }
    return _parameters;
}

- (NSDictionary<NSString *,NSString *> *)headers
{
    if (_headers) {
        _headers = [self defaultJSONHeaders];
    }
    return _headers;
}



@end
