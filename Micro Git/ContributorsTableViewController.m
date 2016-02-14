//
//  ContributersTableViewController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "ContributorsTableViewController.h"
#import "GitUserModel.h"
#import "APIClient.h"

@interface ContributorsTableViewController ()

@end

@implementation ContributorsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeFetchedResultsController];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[GitUserModel entityName]];
    //    _currentCategoryChannel.messages;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"contributed.uniqueId = %@",_repository.uniqueId];
    NSSortDescriptor *dateUpdate = [NSSortDescriptor sortDescriptorWithKey:@"login" ascending:NO];
    [request setPredicate:predicate];
    [request setSortDescriptors:@[dateUpdate]];
    [self initializeFetchedResultsControllerWithRequst:request];
}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GitUserModel *user = [self objectAtIndexPath:indexPath];
    cell.textLabel.text = user.login;
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
    [APIClientKit loadContributorsOfRepository:_repository apiBlock:^(BOOL success, BOOL hasMoreData) {
        [self loadedMoreDataWithSuccess:success];
        self.hasMoreData = hasMoreData;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
