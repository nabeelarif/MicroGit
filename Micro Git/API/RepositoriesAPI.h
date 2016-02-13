//
//  RepositoriesDataController.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPI.h"

@interface RepositoriesAPI : BaseAPI
-(void)loadRepositoriesForLanguage:(NSString*)language apiBlock:(APIBlock)block;
@end
