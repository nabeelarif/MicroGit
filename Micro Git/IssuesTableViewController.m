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
#import <MagicalRecord/MagicalRecord.h>

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
    if ([GitIssueModel MR_countOfEntitiesWithPredicate:[self predicate] inContext:[NSManagedObjectContext MR_defaultContext]]==0) {
        [self loadMoreDataInternal];
    }
    if (_isOpenIssue && !_isPullRequest) {
        self.title = @"Open Issues";
    }else if(!_isOpenIssue && !_isPullRequest){
        self.title = @"Closed Issues";
    }else if(_isOpenIssue && _isPullRequest){
        self.title = @"Open Pull requests";
    }else if(!_isOpenIssue && _isPullRequest){
        self.title = @"Closed Pull requests";
    }
}
-(NSPredicate*)predicate
{
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"state == %@",_isOpenIssue?@"open":@"closed"];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"type == %@",_isPullRequest?@"pr":@"issue"];
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"repository.uniqueId == %@",_repository.uniqueId];
    NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[predicate1, predicate2,predicate3]];;
    return predicate;
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
    NSSortDescriptor *dateUpdate = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:NO];
    [request setPredicate:[self predicate]];
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
    
    if (_isOpenIssue && !_isPullRequest) {
        cell.gitMainLabel.text = octicon_issue_opened;
    }else if(!_isOpenIssue && !_isPullRequest){
        cell.gitMainLabel.text = octicon_issue_closed;
    }else if(_isOpenIssue && _isPullRequest){
        cell.gitMainLabel.text = octicon_git_pull_request;
    }else if(!_isOpenIssue && _isPullRequest){
        cell.gitMainLabel.text = octicon_check;
    }
    
    GitIssueModel *issue = [self objectAtIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@\n#%@",issue.title,issue.number];
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
    if (_isOpenIssue && _isPullRequest) {
        [APIClientKit loadOpenPullRequestsOfRepository:_repository apiBlock:^(BOOL success, BOOL hasMoreData) {
            [self loadedMoreDataWithSuccess:success];
            self.hasMoreData = hasMoreData;
        }];
    }else if (_isOpenIssue && !_isPullRequest) {
        [APIClientKit loadOpenIssuesOfRepository:_repository apiBlock:^(BOOL success, BOOL hasMoreData) {
            [self loadedMoreDataWithSuccess:success];
            self.hasMoreData = hasMoreData;
        }];
    }else if (!_isOpenIssue && _isPullRequest) {
        [APIClientKit loadClosedPullRequestsOfRepository:_repository apiBlock:^(BOOL success, BOOL hasMoreData) {
            [self loadedMoreDataWithSuccess:success];
            self.hasMoreData = hasMoreData;
        }];
    }else if (!_isOpenIssue && !_isPullRequest) {
        [APIClientKit loadClosedIssuesOfRepository:_repository apiBlock:^(BOOL success, BOOL hasMoreData) {
            [self loadedMoreDataWithSuccess:success];
            self.hasMoreData = hasMoreData;
        }];
    }
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
