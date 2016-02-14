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
#import "RepositoryDetailTableViewController.h"

@interface RepositoriesTableViewController () 
@end

@implementation RepositoriesTableViewController

- (void)viewDidLoad {
    [self initializeFetchedResultsController];
    // Do any additional setup after loading the view, typically from a nib.
    self.language = @"Objective-c";
    [super viewDidLoad];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[GitRepositoryModel entityName]];
    //    _currentCategoryChannel.messages;
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"channel.uniqueId = %@",ChannelSession.currentChannel.uniqueId];
    NSSortDescriptor *dateUpdate = [NSSortDescriptor sortDescriptorWithKey:@"stargazersCount" ascending:NO];
//    [request setPredicate:predicate];
    [request setSortDescriptors:@[dateUpdate]];
    [self initializeFetchedResultsControllerWithRequst:request];
}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GitRepositoryModel *repo = [self objectAtIndexPath:indexPath];
    cell.textLabel.text = repo.name;
    UIFont *customFont = [UIFont fontWithName:@"octicons" size:20];
    cell.detailTextLabel.font = customFont;
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
#pragma mark - Load Data
-(void)loadMoreData
{
    [APIClientKit loadRepositoriesForLanguage:self.language apiBlock:^(BOOL success, BOOL hasMoreData) {
        [self loadedMoreDataWithSuccess:success];
        self.hasMoreData = hasMoreData;
    }];
}
#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RepositoryDetailTableViewController"]) {
        RepositoryDetailTableViewController *detail = (RepositoryDetailTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detail.repository = [self objectAtIndexPath:indexPath];
    }
}
@end
