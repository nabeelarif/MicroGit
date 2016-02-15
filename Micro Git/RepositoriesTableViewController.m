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
#import "MicroGitLabel.h"
#import "GitUserModel.h"
#import "OctIconConstants.h"
#import "UIFont+Theme.h"

@interface RepositoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet MicroGitLabel *ownerGitLabel;
@property (weak, nonatomic) IBOutlet MicroGitLabel *watchesGitLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;
@property (weak, nonatomic) IBOutlet UILabel *watchesLabel;

@end

@implementation RepositoryCell

@end

@interface RepositoriesTableViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *searchButton;
- (IBAction)actionSearch:(id)sender;
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation RepositoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.language = @"Objective-c";
    self.title = self.language;
    [self initializeFetchedResultsController];
    // Do any additional setup after loading the view, typically from a nib.
    self.searchBar = [[UISearchBar alloc] init];
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    _searchBar.text = self.language;
    _searchBar.placeholder = @"Enter language ...";
    [self loadMoreDataInternal];
    
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
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)configureCell:(RepositoryCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GitRepositoryModel *repo = [self objectAtIndexPath:indexPath];
    cell.titleLabel.text = repo.name;
    cell.descriptionLabel.text = repo.detailedInfo;
    cell.ownerLabel.text = repo.primitiveOwner.login;
    cell.watchesLabel.text = repo.watchersCount.description;
    cell.ownerGitLabel.font = [UIFont gitFont];
    cell.watchesGitLabel.text = octicon_star;
    if ([[repo.owner.type lowercaseString] isEqualToString:@"user"]) {
        cell.ownerGitLabel.text = octicon_person;
    }else{
        cell.ownerGitLabel.text = octicon_organization;
    }
    // Font
    cell.ownerGitLabel.font = [UIFont gitFontOfSize:15];
    cell.watchesGitLabel.font = [UIFont gitFontOfSize:15];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    [self configureCell:(RepositoryCell *)cell atIndexPath:indexPath];
    
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
- (IBAction)actionSearch:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        ((UIView*)[_searchButton valueForKey:@"view"]).alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        // remove the search button
        self.navigationItem.rightBarButtonItem = nil;
        // add the search bar (which will start out hidden).
        self.navigationItem.titleView = _searchBar;
        _searchBar.alpha = 0.0;
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             _searchBar.alpha = 1.0;
                         } completion:^(BOOL finished) {
                             [_searchBar becomeFirstResponder];
                         }];
        
    }];
}

#pragma mark UISearchBarDelegate methods
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [UIView animateWithDuration:0.5f animations:^{
        _searchBar.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = nil;
        self.navigationItem.rightBarButtonItem = _searchButton;
        ((UIView*)[_searchButton valueForKey:@"view"]).alpha = 0.0;  // set this *after* adding it back
        [UIView animateWithDuration:0.5f animations:^ {
            ((UIView*)[_searchButton valueForKey:@"view"]).alpha = 1.0;
        }];
    }];
    
}// called when cancel button pressed
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"search");
    
    NSArray *allEntities = [NSManagedObjectModel MR_defaultManagedObjectModel].entities;
    
    [allEntities enumerateObjectsUsingBlock:^(NSEntityDescription *entityDescription, NSUInteger idx, BOOL *stop) {
        [NSClassFromString([entityDescription managedObjectClassName]) MR_truncateAll];
    }];
    
    //
    
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
    if (_searchBar.text.length>0 && [self.language isEqualToString:_searchBar.text]==NO) {
        self.language = _searchBar.text;
        self.title = self.language;
        [self searchBarCancelButtonClicked:_searchBar];
        [self loadMoreDataInternal];
    }
//    [self initializeFetchedResultsController];
}
@end
