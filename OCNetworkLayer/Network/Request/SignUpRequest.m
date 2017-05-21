//
//  SignUpRequest.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SignUpRequest.h"

@interface SignUpRequest ()

@property (nonatomic, strong) UserItem *user;
@property (nonatomic, strong) NSString *password;

@end

@implementation SignUpRequest
@synthesize endpoint = _endpoint;
@synthesize method = _method;
@synthesize quertyTyep = _quertyTyep;
@synthesize parameters = _parameters;
@synthesize headers = _headers;

- (instancetype)initWithUser:(UserItem *)user password:(NSString *)password
{
    if (self = [super init]) {
        _password = password;
        _user = user;
    }
    return self;
}


#pragma mark - BackendAPIRequest

- (NSString *)endpoint
{
    if (!_endpoint) {
        _endpoint = @"/users";
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
        NSMutableDictionary *temp = @{}.mutableCopy;
        temp[@"first_name"] = _user.firstName;
        temp[@"last_name"] = _user.lastName;
        temp[@"email"] = _user.phoneNumber? _user.phoneNumber: [NSNull null];
        temp[@"password"] = _password;
        _parameters = [temp copy];
    }
    return _parameters;
}

- (NSDictionary<NSString *,NSString *> *)headers
{
    return [self defaultJSONHeaders];
}
@end
