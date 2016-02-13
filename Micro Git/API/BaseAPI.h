//
//  BaseAPI.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const GitApiBaseUrl;
typedef void (^APIBlock) (BOOL success);

@interface BaseAPI : NSObject
-(void)handleError:(NSURLResponse *)response error:(NSError *)error;
@end
