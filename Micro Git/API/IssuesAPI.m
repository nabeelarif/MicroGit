//
//  IssuesAPI.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "IssuesAPI.h"
#import "GitIssueModel.h"

@interface IssuesAPI ()
@property (nonatomic, strong) GitRepositoryModel *repository;
@end

@implementation IssuesAPI

-(void)loadIssuesOfRepository:(GitRepositoryModel *)repository apiBlock:(APIBlock)block
{
    self.repository = repository;
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@search/issues?q=repo:%@+is:open+type:issue&sort=created_at&order=desc&page=%ld&per_page=%ld",GitApiBaseUrl,_repository.fullName,self.nextPage,GitApiPageSize]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self loadPaginatedDataForRequest:request apiBlock:block];
}

-(void)setRepository:(GitRepositoryModel *)repository
{
    if (_repository !=repository) {
        _repository = repository;
        [self resetValues];
    }
}
-(void)parseResponse:(id)responseObject localContext:(NSManagedObjectContext *)localContext{
    
    GitRepositoryModel *localRepo = [GitRepositoryModel MR_findFirstByAttribute:@"uniqueId" withValue:_repository.uniqueId inContext:localContext];
    
    for (NSDictionary *dRepo in [responseObject valueForKey:@"items"]) {
        GitIssueModel *issue = [GitIssueModel MR_findFirstByAttribute:@"uniqueId" withValue:[dRepo valueForKey:@"id"] inContext:localContext];
        if (!issue) {
            issue = [GitIssueModel MR_createEntityInContext:localContext];
        }
        [issue parseWithDictionary:dRepo];
        [localRepo addIssuesObject:issue];
    }
}
@end
