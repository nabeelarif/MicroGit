//
//  IssuesTableViewController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "IssuesTableViewController.h"
#import "GitIssueModel.h"
#import "APIClient.h"
#import "MicroGitLabel.h"
#import "TitleLabel.h"
#import "OctIconConstants.h"
#import "GitUserModel.h"
#import "UIFont+Theme.h"

@interface IssuesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet MicroGitLabel *gitMainLabel;
@property (weak, nonatomic) IBOutlet TitleLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet MicroGitLabel *gitUserLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet MicroGitLabel *gitCommentsLabel;

@end
@implementation IssuesCell

@end

@interface IssuesTableViewController ()

@end

@implementation IssuesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repository.uniqueId = %@",_repository.uniqueId];
    if ([GitIssueModel MR_countOfEntitiesWithPredicate:predicate inContext:[NSManagedObjectContext MR_defaultContext]]==0) {
        [self loadMoreDataInternal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initializeFetchedResultsController];
}
#pragma mark - Table view data source

- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[GitIssueModel entityName]];
    //    _currentCategoryChannel.messages;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repository.uniqueId = %@",_repository.uniqueId];
    NSSortDescriptor *dateUpdate = [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:NO];
    [request setPredicate:predicate];
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
- (void)configureCell:(IssuesCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GitIssueModel *issue = [self objectAtIndexPath:indexPath];
    cell.gitMainLabel.text= octicon_issue_opened;
    cell.titleLabel.text = issue.title;
    cell.bodyLabel.text = issue.body;
    cell.userLabel.text = issue.user.login;
    cell.gitCommentsLabel.text = [NSString stringWithFormat:@"%@ %@",issue.commentsCount, octicon_mail];
    if ([[issue.user.type lowercaseString] isEqualToString:@"user"]) {
        cell.gitUserLabel.text = octicon_person;
    }else{
        cell.gitUserLabel.text = octicon_organization;
    }
    //
    cell.gitCommentsLabel.font = [UIFont gitFontOfSize:15];
    cell.gitUserLabel.font = [UIFont gitFontOfSize:15];
    cell.gitMainLabel.font = [UIFont gitFontOfSize:60];
    cell.gitMainLabel.adjustsFontSizeToFitWidth=YES;
    cell.gitMainLabel.minimumScaleFactor=0.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    [self configureCell:(IssuesCell *)cell atIndexPath:indexPath];
    
    return cell;
}
-(void)loadMoreData
{
    [APIClientKit loadIssuesOfRepository:_repository apiBlock:^(BOOL success, BOOL hasMoreData) {
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
