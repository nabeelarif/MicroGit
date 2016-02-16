//
//  APIClient.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "APIClient.h"
#import "RepositoriesAPI.h"
#import "IssuesAPI.h"
#import "ContributorsAPI.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>

@interface APIClient ()

@property (nonatomic,strong) RepositoriesAPI *repositoriesApi;
@property (nonatomic,strong) IssuesAPI *openIssuesApi;
@property (nonatomic,strong) IssuesAPI *closedIssuesApi;
@property (nonatomic,strong) IssuesAPI *openPullRequestsApi;
@property (nonatomic,strong) IssuesAPI *closedPullRequestsApi;
@property (nonatomic,strong) ContributorsAPI *contributorsApi;

@end

@implementation APIClient

+(instancetype)sharedInstance{
    static APIClient *sharedClient;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedClient = [[self alloc] init];
        sharedClient.repositoriesApi = [[RepositoriesAPI alloc] init];
        sharedClient.openIssuesApi = [[IssuesAPI alloc] init];
        sharedClient.closedIssuesApi = [[IssuesAPI alloc] init];
        sharedClient.openPullRequestsApi = [[IssuesAPI alloc] init];
        sharedClient.closedPullRequestsApi = [[IssuesAPI alloc] init];
        sharedClient.contributorsApi = [[ContributorsAPI alloc] init];
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
-(void)loadOpenIssuesOfRepository:(id)repository apiBlock:(APIBlock)block
{
    [_openIssuesApi loadIssuesOfRepository:repository type:ISSUES_TYPE_OpenIssues apiBlock:block];
}
-(void)loadClosedIssuesOfRepository:(GitRepositoryModel*)repository apiBlock:(APIBlock)block
{
    [_closedIssuesApi loadIssuesOfRepository:repository type:ISSUES_TYPE_ClosedIssues apiBlock:block];
}
-(void)loadOpenPullRequestsOfRepository:(GitRepositoryModel*)repository apiBlock:(APIBlock)block
{
    [_openPullRequestsApi loadIssuesOfRepository:repository type:ISSUES_TYPE_OpenPullRequests apiBlock:block];
}
-(void)loadClosedPullRequestsOfRepository:(GitRepositoryModel*)repository apiBlock:(APIBlock)block
{
    [_closedPullRequestsApi loadIssuesOfRepository:repository type:ISSUES_TYPE_ClosedPullRequests apiBlock:block];
}
-(void)loadContributorsOfRepository:(id)repository apiBlock:(APIBlock)block
{
    [_contributorsApi loadContributorsOfRepository:repository apiBlock:block];
}
@end
