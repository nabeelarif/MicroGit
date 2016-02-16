//
//  IssuesAPI.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "BaseAPI.h"
#import "GitRepositoryModel.h"
typedef NS_ENUM(NSInteger, ISSUES_TYPE){
    ISSUES_TYPE_OpenIssues,
    ISSUES_TYPE_ClosedIssues,
    ISSUES_TYPE_OpenPullRequests,
    ISSUES_TYPE_ClosedPullRequests
};
@interface IssuesAPI : BaseAPI
-(void)loadIssuesOfRepository:(GitRepositoryModel*)repository type:(ISSUES_TYPE)type apiBlock:(APIBlock)block;
@end
