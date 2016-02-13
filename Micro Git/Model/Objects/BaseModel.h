//
//  BaseModel.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/13/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MagicalRecord/MagicalRecord.h>

@protocol ModelParser <NSObject>

@optional
-(void)parseWithDictionary:(NSDictionary*)dictionary;
-(NSDateFormatter*)dateFormatter;

@end

@interface BaseModel : NSManagedObject <ModelParser>

@end
