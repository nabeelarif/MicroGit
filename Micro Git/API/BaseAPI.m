//
//  BaseAPI.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "BaseAPI.h"
#import <AFNetworking/AFNetworking.h>
#import <TWMessageBarManager/TWMessageBarManager.h>
#import <MagicalRecord/MagicalRecord.h>

NSString * const GitApiBaseUrl = @"https://api.github.com/";
NSInteger const GitApiPageSize = 20;

@implementation BaseAPI
-(void)handleError:(NSURLResponse *)response error:(NSError *)error
{
    if (error.code==-1009 && !response) {
        [[self class] showNeteworkErrorToast];
    }
}
-(void)loadPaginatedDataForRequest:(NSURLRequest *)request apiBlock:(APIBlock)block
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            [self handleError:response error:error];
            block(NO,[self hasMoreData]);
        } else {
            //Update previous page
            _prevPage = _nextPage;
            
            // Get next and last page numbers
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
            NSString* link = [httpResponse allHeaderFields][@"Link"];
            for (NSString *str in [link componentsSeparatedByString:@", "]) {
                NSString *subStr = [[str componentsSeparatedByString:@"?q="] lastObject];
                if ([str containsString:@"rel=\"next\""]) {
                    for (NSString *str2 in [subStr componentsSeparatedByString:@"&"]) {
                        if([str2 hasPrefix:@"page="]){
                            _nextPage = [[[str2 componentsSeparatedByString:@"page="] lastObject] integerValue];
                        }
                    }
                }
                if ([str containsString:@"rel=\"last\""]) {
                    for (NSString *str2 in [subStr componentsSeparatedByString:@"&"]) {
                        if([str2 hasPrefix:@"page="]){
                            _lastPage = [[[str2 componentsSeparatedByString:@"page="] lastObject] integerValue];
                        }
                    }
                }
            }
            [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
                if ([self respondsToSelector:@selector(parseResponse:localContext:)]) {
                    [self parseResponse:responseObject localContext:localContext];
                }
            } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
                block(YES,[self hasMoreData]);
            }];
        }
    }];
    [dataTask resume];
}
+(void)showNeteworkErrorToast
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Network Error" description:@"Internet connection appears to be offline." type:TWMessageBarMessageTypeError];
}
-(void)parseResponse:(id)responseObject localContext:(NSManagedObjectContext *)localContext{
    //should be implemented in child class
}
-(void)resetValues{
    _lastPage = 1;
    _prevPage = -1;
    _nextPage = 1;
}
-(BOOL)hasMoreData{
    return _prevPage<_lastPage;
}
@end
