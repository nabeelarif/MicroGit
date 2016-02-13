#import "GitUserModel.h"

@interface GitUserModel ()

// Private interface goes here.

@end

@implementation GitUserModel

-(void)parseWithDictionary:(NSDictionary *)dictionary
{
    self.avatarUrl = [dictionary valueForKey:@"avatar_url"];
    self.login = [dictionary valueForKey:@"login"];
    self.type = [dictionary valueForKey:@"type"];
    self.uniqueId = [dictionary valueForKey:@"id"];
}

@end
