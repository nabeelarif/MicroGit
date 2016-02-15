#import "GitContributorModel.h"
#import "GitUserModel.h"

@interface GitContributorModel ()

// Private interface goes here.

@end

@implementation GitContributorModel

-(void)parseWithDictionary:(NSDictionary *)dictionary
{
    self.siteAdmin = [dictionary valueForKey:@"site_admin"];
    self.countContributions = [dictionary valueForKey:@"contributions"];
    
    // Parse User
    GitUserModel *user = self.user;
    if (!user) {
        user = [GitUserModel MR_findFirstByAttribute:@"uniqueId" withValue:[dictionary valueForKey:@"id"] inContext:self.managedObjectContext];
        if (!user) {
            user =  [GitUserModel MR_createEntityInContext:self.managedObjectContext];
        }
    }
    [user parseWithDictionary:dictionary];
    [self setUser:user];
    
}

@end
