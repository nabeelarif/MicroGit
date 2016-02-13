//
//  BaseModel.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(NSDateFormatter*)dateFormatter{
    
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
        // Always use this locale when parsing fixed format date strings
        NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [formatter setLocale:posix];
        //set date format
    });
    return formatter;
}
@end
