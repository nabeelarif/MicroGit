//
//  RepositoryDetailTableViewController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "RepositoryDetailTableViewController.h"
#import "ContributorsTableViewController.h"
#import "IssuesTableViewController.h"
#import "TitleLabel.h"
#import "MicroGitLabel.h"
#import "OctIconConstants.h"
#import "UIFont+Theme.h"

@interface DisclosureCell : UITableViewCell
@property (weak, nonatomic) IBOutlet MicroGitLabel *gitLabel;
@property (weak, nonatomic) IBOutlet TitleLabel *titleLabel;

@end
@implementation DisclosureCell

@end

@interface RepositoryDetailTableViewController ()

@end

@implementation RepositoryDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _repository.name;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DisclosureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"disclosureCell" forIndexPath:indexPath];
    
    if (indexPath.row==0) {
        cell.titleLabel.text = @"Open Issues";
        cell.gitLabel.text = octicon_issue_opened;
    }else if(indexPath.row==1){
        cell.titleLabel.text = @"Closed Issues";
        cell.gitLabel.text = octicon_issue_closed;
    }else if(indexPath.row==2){
        cell.titleLabel.text = @"Open Pull requests";
        cell.gitLabel.text = octicon_git_pull_request;
    }else if(indexPath.row==3){
        cell.titleLabel.text = @"Closed Pull requests";
        cell.gitLabel.text = octicon_check;
    }else if(indexPath.row==4){
        cell.titleLabel.text = @"Contributors";
        cell.gitLabel.text = octicon_organization;
    }
    cell.gitLabel.font = [UIFont gitFontOfSize:27];
    cell.gitLabel.adjustsFontSizeToFitWidth = YES;
    cell.gitLabel.minimumScaleFactor = 0.5;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.row<4) {
        [self performSegueWithIdentifier:@"IssuesTableViewController" sender:self];
    }else if(indexPath.row==4){
        [self performSegueWithIdentifier:@"ContributorsTableViewController" sender:self];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    if ([segue.identifier isEqualToString:@"IssuesTableViewController"]) {
        IssuesTableViewController *issues = (IssuesTableViewController*)segue.destinationViewController;
        issues.repository = _repository;
        if (indexPath.row==0) {
            issues.isOpenIssue=YES;
            issues.isPullRequest=NO;
        }else if (indexPath.row==1) {
            issues.isOpenIssue=NO;
            issues.isPullRequest=NO;
        }else if (indexPath.row==2) {
            issues.isOpenIssue=YES;
            issues.isPullRequest=YES;
        }else if (indexPath.row==3) {
            issues.isOpenIssue=NO;
            issues.isPullRequest=YES;
        }
    }else if([segue.identifier isEqualToString:@"ContributorsTableViewController"]){
        ContributorsTableViewController *contributors = (ContributorsTableViewController*)segue.destinationViewController;
        contributors.repository = _repository;
    }
}

@end
