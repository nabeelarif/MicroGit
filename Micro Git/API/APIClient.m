//
//  APIClient.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "APIClient.h"
#import "RepositoriesAPI.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>

@interface APIClient ()

@property (nonatomic,strong) RepositoriesAPI *repositoriesApi;

@end

@implementation APIClient

+(instancetype)sharedInstance{
    static APIClient *sharedClient;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedClient = [[self alloc] init];
        sharedClient.repositoriesApi = [[RepositoriesAPI alloc] init];
        [sharedClient addNetworkStatusListener];
    });
    return sharedClient;
}
-(void)addNetworkStatusListener{
    _isNetworkReachable = [AFNetworkReachabilityManager sharedManager].isReachable;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                _isNetworkReachable=YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                _isNetworkReachable=NO;
                break;
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
-(void)loadRepositoriesForLanguage:(NSString*)language apiBlock:(APIBlock)block
{
    [_repositoriesApi loadRepositoriesForLanguage:language apiBlock:block];
}
@end
