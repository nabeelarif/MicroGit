//
//  ContributorsAPI.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "ContributorsAPI.h"
#import "GitContributorModel.h"

@interface ContributorsAPI ()
@property (nonatomic, strong) GitRepositoryModel *repository;
@end

@implementation ContributorsAPI

-(void)loadContributorsOfRepository:(GitRepositoryModel *)repository apiBlock:(APIBlock)block
{
    self.repository = repository;
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@repositories/%@/contributors?q=order=desc&page=%ld&per_page=%ld",GitApiBaseUrl,_repository.uniqueId,self.nextPage,GitApiPageSize]];
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
    
    for (NSDictionary *dRepo in responseObject) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repository.uniqueId = %@ AND user.uniqueId = %@",_repository.uniqueId, [dRepo valueForKey:@"id"]];
        GitContributorModel *user = [GitContributorModel MR_findFirstWithPredicate:predicate inContext:localContext];
        if (!user) {
            user = [GitContributorModel MR_createEntityInContext:localContext];
        }
        [user parseWithDictionary:dRepo];
        [localRepo addContributorsObject:user];
    }
}
@end
