//
//  ViewController.h
//  Micro Git
//
//  Created by Home on 2/11/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaginatedTableViewController.h"

@interface RepositoriesTableViewController : PaginatedTableViewController
@property (nonatomic,strong) NSString * language;
@end

