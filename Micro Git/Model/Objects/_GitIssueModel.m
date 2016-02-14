// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitIssueModel.m instead.

#import "_GitIssueModel.h"

const struct GitIssueModelAttributes GitIssueModelAttributes = {
	.body = @"body",
	.commentsCount = @"commentsCount",
	.createdAt = @"createdAt",
	.number = @"number",
	.state = @"state",
	.title = @"title",
	.uniqueId = @"uniqueId",
	.updatedAt = @"updatedAt",
};

const struct GitIssueModelRelationships GitIssueModelRelationships = {
	.repository = @"repository",
	.user = @"user",
};

@implementation GitIssueModelID
@end

@implementation _GitIssueModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GitIssue" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GitIssue";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GitIssue" inManagedObjectContext:moc_];
}

- (GitIssueModelID*)objectID {
	return (GitIssueModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"commentsCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"commentsCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"numberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"number"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"uniqueIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"uniqueId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic body;

@dynamic commentsCount;

- (int32_t)commentsCountValue {
	NSNumber *result = [self commentsCount];
	return [result intValue];
}

- (void)setCommentsCountValue:(int32_t)value_ {
	[self setCommentsCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCommentsCountValue {
	NSNumber *result = [self primitiveCommentsCount];
	return [result intValue];
}

- (void)setPrimitiveCommentsCountValue:(int32_t)value_ {
	[self setPrimitiveCommentsCount:[NSNumber numberWithInt:value_]];
}

@dynamic createdAt;

@dynamic number;

- (int32_t)numberValue {
	NSNumber *result = [self number];
	return [result intValue];
}

- (void)setNumberValue:(int32_t)value_ {
	[self setNumber:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberValue {
	NSNumber *result = [self primitiveNumber];
	return [result intValue];
}

- (void)setPrimitiveNumberValue:(int32_t)value_ {
	[self setPrimitiveNumber:[NSNumber numberWithInt:value_]];
}

@dynamic state;

@dynamic title;

@dynamic uniqueId;

- (int32_t)uniqueIdValue {
	NSNumber *result = [self uniqueId];
	return [result intValue];
}

- (void)setUniqueIdValue:(int32_t)value_ {
	[self setUniqueId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUniqueIdValue {
	NSNumber *result = [self primitiveUniqueId];
	return [result intValue];
}

- (void)setPrimitiveUniqueIdValue:(int32_t)value_ {
	[self setPrimitiveUniqueId:[NSNumber numberWithInt:value_]];
}

@dynamic updatedAt;

@dynamic repository;

@dynamic user;

@end

