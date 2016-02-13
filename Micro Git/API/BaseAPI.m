//
//  BaseAPI.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "BaseAPI.h"
NSString * const GitApiBaseUrl = @"https://api.github.com/";
#import <TWMessageBarManager/TWMessageBarManager.h>

@implementation BaseAPI
-(void)handleError:(NSURLResponse *)response error:(NSError *)error
{
    if (error.code==-1009 && !response) {
        [[self class] showNeteworkErrorToast];
    }
}

+(void)showNeteworkErrorToast
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Network Error" description:@"Internet connection appears to be offline." type:TWMessageBarMessageTypeError];
}
@end
