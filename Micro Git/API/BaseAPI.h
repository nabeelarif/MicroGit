//
//  BaseAPI.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const GitApiBaseUrl;
extern NSInteger const GitApiPageSize;
typedef void (^APIBlock) (BOOL success, BOOL hasMoreData);

@interface BaseAPI : NSObject
-(void)loadPaginatedDataForRequest:(NSURLRequest*)request apiBlock:(APIBlock)block;
-(void)parseResponse:(id) responseObject localContext:(NSManagedObjectContext *)localContext;
-(void)handleError:(NSURLResponse *)response error:(NSError *)error;
@property (nonatomic, readonly) NSInteger totalCount;
@property (nonatomic, readonly) NSInteger nextPage;
@property (nonatomic, readonly) NSInteger prevPage;
@property (nonatomic, readonly) NSInteger lastPage;
-(void)resetValues;
-(BOOL)hasMoreData;
@end
