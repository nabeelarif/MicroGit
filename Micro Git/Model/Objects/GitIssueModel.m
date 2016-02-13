#import "GitIssueModel.h"

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
}

@end
