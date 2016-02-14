//
//  IssuesAPI.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "BaseAPI.h"
#import "GitRepositoryModel.h"

@interface IssuesAPI : BaseAPI
-(void)loadIssuesOfRepository:(GitRepositoryModel*)repository apiBlock:(APIBlock)block;
@end
