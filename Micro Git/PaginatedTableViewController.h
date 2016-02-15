//
//  PagenatedTableViewController.h
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottomRefreshControl.h"
#import <MagicalRecord/MagicalRecord.h>

@interface PaginatedTableViewController : UITableViewController <BottomRefreshControlDelegate,NSFetchedResultsControllerDelegate>
@property (nonatomic, readonly) BOOL isLoadingMoreData;
@property (nonatomic) BOOL hasMoreData;
-(void)loadMoreData;
-(void)loadedMoreDataWithSuccess:(BOOL)success;
- (void)initializeFetchedResultsControllerWithRequst:(NSFetchRequest*)request;
-(id) objectAtIndexPath:(NSIndexPath*)indexPath;
-(void)loadMoreDataInternal;
@end
