//
//  APIClient.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPI.h"

#define APIClientKit [APIClient sharedInstance]

@interface APIClient : NSObject
@property (nonatomic,readonly) BOOL isNetworkReachable;
+(instancetype)sharedInstance;
-(void)loadRepositoriesForLanguage:(NSString*)language apiBlock:(APIBlock)block;
@end
