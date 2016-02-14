//
//  RepositoriesDataController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "RepositoriesAPI.h"
#import "GitRepositoryModel.h"
#import "GitUserModel.h"



@interface RepositoriesAPI ()
@property (nonatomic,strong) NSString *language;
@end

@implementation RepositoriesAPI

-(void)loadRepositoriesForLanguage:(NSString*)language apiBlock:(APIBlock)block
{
    self.language = language;
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@search/repositories?q=language:%@&sort=stars&order=desc&page=%ld&per_page=%ld",GitApiBaseUrl,language,self.nextPage,GitApiPageSize]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self loadPaginatedDataForRequest:request apiBlock:block];
}
-(void)parseResponse:(id)responseObject localContext:(NSManagedObjectContext *)localContext{
    
    for (NSDictionary *dRepo in [responseObject valueForKey:@"items"]) {
        GitRepositoryModel *repo = [GitRepositoryModel MR_findFirstByAttribute:@"uniqueId" withValue:[dRepo valueForKey:@"id"] inContext:localContext];
        if (!repo) {
            repo = [GitRepositoryModel MR_createEntityInContext:localContext];
        }
        [repo parseWithDictionary:dRepo];
    }
}
-(void)setLanguage:(NSString *)language{
    if ([_language.lowercaseString isEqualToString:language.lowercaseString]==NO) {
        [self resetValues];
    }
    _language = language;
}
@end
