//
//  ContributersTableViewController.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "ContributorsTableViewController.h"
#import "GitUserModel.h"
#import "GitContributorModel.h"
#import "APIClient.h"
#import "TitleLabel.h"
#import "MicroGitLabel.h"
#import "OctIconConstants.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIFont+Theme.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ContributorCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet TitleLabel *titleLabel;
@property (weak, nonatomic) IBOutlet MicroGitLabel *gitTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@end
@implementation ContributorCell

@end

@interface ContributorsTableViewController ()

@end

@implementation ContributorsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repository.uniqueId = %@",_repository.uniqueId];
    if ([GitContributorModel MR_countOfEntitiesWithPredicate:predicate inContext:[NSManagedObjectContext MR_defaultContext]]==0) {
        [self loadMoreDataInternal];
    }
    [self initializeFetchedResultsController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[GitContributorModel entityName]];
    //    _currentCategoryChannel.messages;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"repository.uniqueId = %@",_repository.uniqueId];
    NSSortDescriptor *dateUpdate = [NSSortDescriptor sortDescriptorWithKey:@"countContributions" ascending:NO];
    [request setPredicate:predicate];
    [request setSortDescriptors:@[dateUpdate]];
    [self initializeFetchedResultsControllerWithRequst:request];
}
- (void)configureCell:(ContributorCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GitContributorModel *contributor = [self objectAtIndexPath:indexPath];
    GitUserModel *user = contributor.user;
    cell.titleLabel.text = user.login;
    cell.typeLabel.text = [NSString stringWithFormat:@"%@ (%@ Contributions)",user.type,contributor.countContributions];
    
    if ([[user.type lowercaseString] isEqualToString:@"user"]) {
        cell.gitTypeLabel.text = octicon_person;
    }else{
        cell.gitTypeLabel.text = octicon_organization;
    }
    cell.imageViewIcon.layer.cornerRadius = 5;
    cell.imageViewIcon.clipsToBounds = YES;
    [cell.imageViewIcon sd_setImageWithURL:[NSURL URLWithString:user.avatarUrl]
                          placeholderImage:[UIImage imageNamed:@"Icon-76"]];
    // Font
    cell.gitTypeLabel.font = [UIFont gitFontOfSize:15];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    [self configureCell:(ContributorCell *)cell atIndexPath:indexPath];
    
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
