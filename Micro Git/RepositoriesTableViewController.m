//
//  ViewController.m
//  Micro Git
//
//  Created by Home on 2/11/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "RepositoriesTableViewController.h"
#import "GitRepositoryModel.h"
#import "APIClient.h"
#import "BottomRefreshControl.h"

@interface RepositoriesTableViewController () <NSFetchedResultsControllerDelegate,BottomRefreshControlDelegate>
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) BOOL isLoadingMoreData;
@property (nonatomic,strong) BottomRefreshControl *bottomRefreshControl;
@end

@implementation RepositoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeFetchedResultsController];
    // Do any additional setup after loading the view, typically from a nib.
//    [self createDummyData];
    self.language = @"Objective-c";
    self.tableView.delegate = self;
    _bottomRefreshControl = [BottomRefreshControl instantiateFromNib];
    _bottomRefreshControl.frame = CGRectMake(0, 0, 320, 44);
    _bottomRefreshControl.delegate = self;
    [self loadRepositories];
    
}
-(void)dealloc
{
    _bottomRefreshControl = nil;
}
//-(void)createDummyData
//{
//    __block NSUInteger count = [GitRepositoryModel MR_countOfEntities];
//    if (count<10) {
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
//            
//            GitRepositoryModel *repo = [GitRepositoryModel MR_createEntityInContext:localContext];
//            repo.uniqueIdValue = (int32_t)++count;
//            repo.name = [NSString stringWithFormat:@"Repo %lu",(unsigned long)count];
//            repo.updatedAt = [NSDate date];
//        } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
//            
//            [self performSelector:@selector(createDummyData) withObject:nil afterDelay:1.0];
//        }];
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[GitRepositoryModel entityName]];
    //    _currentCategoryChannel.messages;
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"channel.uniqueId = %@",ChannelSession.currentChannel.uniqueId];
    NSSortDescriptor *dateUpdate = [NSSortDescriptor sortDescriptorWithKey:@"updatedAt" ascending:NO];
//    [request setPredicate:predicate];
    [request setSortDescriptors:@[dateUpdate]];
    
//    NSManagedObjectContext *moc = [CharedRecords mainContext]; //Retrieve the main queue NSManagedObjectContext
    
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:nil cacheName:nil]];
    [[self fetchedResultsController] setDelegate:self];
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id  sectionInfo =
    [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GitRepositoryModel *repo = [_fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = repo.name;
    cell.detailTextLabel.text = repo.fullName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}
#pragma mark - UIScrollViewDelegate
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        if (!_bottomRefreshControl.superview) {
            
            [self loadRepositories];
        }
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
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
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
#pragma mark - Load Data
-(void)loadRepositories
{
    if (_isLoadingMoreData) {
        return;
    }
    if (!self.tableView.tableFooterView) {
        self.tableView.tableFooterView = _bottomRefreshControl;
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        if (offset.y>0) {
            [self.tableView setContentOffset:offset animated:YES];
        }
    }
    [_bottomRefreshControl showProgressAnimated:YES];
    _isLoadingMoreData = YES;
    [APIClientKit loadRepositoriesForLanguage:self.language apiBlock:^(BOOL success) {
        _isLoadingMoreData = NO;
        if (success) {
            self.tableView.tableFooterView = nil;
        }else{
            [_bottomRefreshControl showButtonWithTitle:@"Load More ..." animated:YES];
        }
    }];
}
#pragma mark - BottomRefreshControlDelegate
-(void)bottomRefreshControlButtonClicked{
    [self loadRepositories];
}
@end
