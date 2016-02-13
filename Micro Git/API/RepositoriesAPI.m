//
//  RepositoriesDataController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "RepositoriesAPI.h"
#import <AFNetworking/AFNetworking.h>
#import "GitRepositoryModel.h"
#import "GitUserModel.h"


NSString * const GitApiRepositories = @"search/repositories";

@interface RepositoriesAPI ()
@property (nonatomic,strong) NSString *language;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic) NSInteger currentPage;
@end

@implementation RepositoriesAPI

-(void)loadRepositoriesForLanguage:(NSString*)language apiBlock:(APIBlock)block
{
    self.language = language;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?q=language:%@&sort=stars&order=desc&page=%ld&per_page=20",GitApiBaseUrl,GitApiRepositories,language,_currentPage]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            [self handleError:response error:error];
            block(NO);
        } else {
            NSLog(@"%@", response);
            _totalCount = [[responseObject valueForKey:@"total_count"] integerValue];
            BOOL isIncompleteResult = [[responseObject valueForKey:@"incomplete_results"] boolValue];
            if(!isIncompleteResult){
                //Increment page number
                _currentPage++;
            }
            [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
                
                for (NSDictionary *dRepo in [responseObject valueForKey:@"items"]) {
                    GitRepositoryModel *repo = [GitRepositoryModel MR_findFirstByAttribute:@"uniqueId" withValue:[dRepo valueForKey:@"id"] inContext:localContext];
                    if (!repo) {
                        repo = [GitRepositoryModel MR_createEntityInContext:localContext];
                    }
                    [repo parseWithDictionary:dRepo];
                }
            } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
                block(YES);
            }];
        }
    }];
    [dataTask resume];
}
-(void)setLanguage:(NSString *)language{
    if ([_language.lowercaseString isEqualToString:language.lowercaseString]==NO) {
        _currentPage=1;
    }
    _language = language;
}
@end
