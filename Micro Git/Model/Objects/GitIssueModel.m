#import "GitIssueModel.h"
#import "GitUserModel.h"

@interface GitIssueModel ()

// Private interface goes here.

@end

@implementation GitIssueModel

-(void)parseWithDictionary:(NSDictionary *)dictionary
{
    self.body = [dictionary valueForKey:@"body"];
    self.commentsCount = [dictionary valueForKey:@"comments"];
    self.createdAt = [[self dateFormatter] dateFromString:[dictionary valueForKey:@"created_at"]];
    self.number = [dictionary valueForKey:@"number"];
    self.state = [dictionary valueForKey:@"state"];
    self.title = [dictionary valueForKey:@"title"];
    self.uniqueId = [dictionary valueForKey:@"id"];
    self.updatedAt = [[self dateFormatter] dateFromString:[dictionary valueForKey:@"updated_at"]];
    
    // Parse User
    NSDictionary *dUser = [dictionary valueForKey:@"user"];
    GitUserModel *user = self.user;
    if (!user) {
        user = [GitUserModel MR_findFirstByAttribute:@"uniqueId" withValue:[dUser valueForKey:@"id"] inContext:self.managedObjectContext];
        if (user) {
            user =  [GitUserModel MR_createEntityInContext:self.managedObjectContext];
        }
    }
    [user parseWithDictionary:dUser];
}

@end
