#import "GitRepositoryModel.h"
#import "GitUserModel.h"

@interface GitRepositoryModel ()

// Private interface goes here.

@end

@implementation GitRepositoryModel

-(void)parseWithDictionary:(NSDictionary *)dictionary
{
    self.createdAt = [[self dateFormatter] dateFromString:[dictionary valueForKey:@"created_at"]];
    self.detailedInfo = [dictionary valueForKey:@"description"];
    self.forksCount = [dictionary valueForKey:@"forks_count"];
    self.fullName = [dictionary valueForKey:@"full_name"];
    self.language = [dictionary valueForKey:@"language"];
    self.name = [dictionary valueForKey:@"name"];
    self.openIssuesCount = [dictionary valueForKey:@"open_issues_count"];
    self.stargazersCount = [dictionary valueForKey:@"stargazers_count"];
    self.uniqueId = [dictionary valueForKey:@"id"];
    self.updatedAt = [[self dateFormatter] dateFromString:[dictionary valueForKey:@"updated_at"]];
    self.watchersCount = [dictionary valueForKey:@"watchers_count"];
    
    // Parse Owner
    NSDictionary *dOwner = [dictionary valueForKey:@"owner"];
    GitUserModel *owner = self.owner;
    if (!owner) {
        owner = [GitUserModel MR_findFirstByAttribute:@"uniqueId" withValue:[dOwner valueForKey:@"id"] inContext:self.managedObjectContext];
        if (owner) {
            owner =  [GitUserModel MR_createEntityInContext:self.managedObjectContext];
        }
    }
    [owner parseWithDictionary:dOwner];
    
}

@end
