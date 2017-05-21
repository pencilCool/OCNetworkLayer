//
//  AppDelegate.m
//  OCNetworkLayer
//
//  Created by tangyuhua on 2017/5/18.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "AppDelegate.h"
#import "NetworkLayerConfiguration.h"
#import "UserItem.h"
#import "SignInItem.h"
#import "SignUpOperation.h"
#import "SignInOperation.h"
#import "NetworkQueue.h"

@interface Demo: NSObject
+ (void)performSignUp;
+ (void)performSignIn;
@end



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NetworkLayerConfiguration setup];
    [Demo performSignUp];
    return YES;
}
@end

@implementation Demo
+ (void)performSignUp {
    UserItem *user = [[UserItem alloc] initWithUniqueId:nil firstName:@"pencilCool" lastName:@"Tangyuhua" email:@"yhtangcoder@gmail.com" phoneNumber:@"12345678910"];
    SignUpOperation *signUpop = [[SignUpOperation alloc] initWithUser:user password:@"123"];
    signUpop.success = ^(UserItem * item) {
        NSLog(@"item uniqueId = %@",item.uniqueId);
    };
    signUpop.failure = ^(NSError * error) {
        NSLog(@"localized description :%@", error.localizedDescription);
    };
    [[NetworkQueue shared] addOperation:signUpop];
}


+ (void)performSignIn {
    SignInOperation *signInop = [[SignInOperation alloc] initWithEmail:@"yhtang_xt@163.com" password:@"123"];
    signInop.sigInSuccess = ^(SignInItem *item) {
        NSLog(@"token = %@",item.token);
        NSLog(@"user id = %@",item.uniqueId);
    };
    
    signInop.sigInFailure = ^(NSError *error) {
        NSLog(@"localized description :%@", error.localizedDescription);
    };
    [[NetworkQueue shared] addOperation:signInop];
}








@end
