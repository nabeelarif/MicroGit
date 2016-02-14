//
//  IssuesTableViewController.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GitRepositoryModel.h"
#import "PaginatedTableViewController.h"

@interface IssuesTableViewController : PaginatedTableViewController
@property (nonatomic, strong) GitRepositoryModel *repository;
@end
