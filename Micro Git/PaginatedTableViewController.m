//
//  PagenatedTableViewController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "PaginatedTableViewController.h"

@interface PaginatedTableViewController ()
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic,strong) BottomRefreshControl *bottomRefreshControl;
-(void)loadMoreDataInternal;
@end

@implementation PaginatedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set it to yes to load data first time
    _hasMoreData = YES;
    
    self.tableView.delegate = self;
    _bottomRefreshControl = [BottomRefreshControl instantiateFromNib];
    _bottomRefreshControl.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id  sectionInfo =
    [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(void)dealloc
{
    _bottomRefreshControl = nil;
}
-(void)loadMoreDataInternal
{
    if (_isLoadingMoreData || !_hasMoreData) {
        return;
    }
    if (!self.tableView.tableFooterView) {
        _bottomRefreshControl.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        self.tableView.tableFooterView = _bottomRefreshControl;
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        if (offset.y>0) {
            [self.tableView setContentOffset:offset animated:YES];
        }
    }
    [_bottomRefreshControl showProgressAnimated:YES];
    _isLoadingMoreData = YES;
    [self loadMoreData];
}
-(void)loadMoreData{
    // Override in child classes to load more data
}
-(void)loadedMoreDataWithSuccess:(BOOL)success{
    _isLoadingMoreData = NO;
    if (success) {
        self.tableView.tableFooterView = nil;
    }else{
        [_bottomRefreshControl showButtonWithTitle:@"Load More ..." animated:YES];
    }
}
-(id)objectAtIndexPath:(NSIndexPath*)indexPath{
    return [_fetchedResultsController objectAtIndexPath:indexPath];
}
#pragma mark - BottomRefreshControlDelegate
-(void)bottomRefreshControlButtonClicked{
    [self loadMoreDataInternal];
}
#pragma mark - UIScrollViewDelegate
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        if (!_bottomRefreshControl.superview) {
            [self loadMoreDataInternal];
        }
    }
}
#pragma mark - NSFetchedResultsController
- (void)initializeFetchedResultsControllerWithRequst:(NSFetchRequest*)request
{
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:nil cacheName:nil]];
    [[self fetchedResultsController] setDelegate:self];
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
}

#pragma mark - NSFetchedResultsControllerDelegate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
//            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
}
@end
