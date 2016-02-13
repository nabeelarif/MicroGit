// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitRepositoryModel.m instead.

#import "_GitRepositoryModel.h"

const struct GitRepositoryModelAttributes GitRepositoryModelAttributes = {
	.createdAt = @"createdAt",
	.detailedInfo = @"detailedInfo",
	.forksCount = @"forksCount",
	.fullName = @"fullName",
	.language = @"language",
	.name = @"name",
	.openIssuesCount = @"openIssuesCount",
	.stargazersCount = @"stargazersCount",
	.uniqueId = @"uniqueId",
	.updatedAt = @"updatedAt",
	.watchersCount = @"watchersCount",
};

const struct GitRepositoryModelRelationships GitRepositoryModelRelationships = {
	.owner = @"owner",
};

@implementation GitRepositoryModelID
@end

@implementation _GitRepositoryModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GitRepository" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GitRepository";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GitRepository" inManagedObjectContext:moc_];
}

- (GitRepositoryModelID*)objectID {
	return (GitRepositoryModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"forksCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"forksCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"openIssuesCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"openIssuesCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"stargazersCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"stargazersCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"uniqueIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"uniqueId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"watchersCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"watchersCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic createdAt;

@dynamic detailedInfo;

@dynamic forksCount;

- (int16_t)forksCountValue {
	NSNumber *result = [self forksCount];
	return [result shortValue];
}

- (void)setForksCountValue:(int16_t)value_ {
	[self setForksCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveForksCountValue {
	NSNumber *result = [self primitiveForksCount];
	return [result shortValue];
}

- (void)setPrimitiveForksCountValue:(int16_t)value_ {
	[self setPrimitiveForksCount:[NSNumber numberWithShort:value_]];
}

@dynamic fullName;

@dynamic language;

@dynamic name;

@dynamic openIssuesCount;

- (int32_t)openIssuesCountValue {
	NSNumber *result = [self openIssuesCount];
	return [result intValue];
}

- (void)setOpenIssuesCountValue:(int32_t)value_ {
	[self setOpenIssuesCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveOpenIssuesCountValue {
	NSNumber *result = [self primitiveOpenIssuesCount];
	return [result intValue];
}

- (void)setPrimitiveOpenIssuesCountValue:(int32_t)value_ {
	[self setPrimitiveOpenIssuesCount:[NSNumber numberWithInt:value_]];
}

@dynamic stargazersCount;

- (int32_t)stargazersCountValue {
	NSNumber *result = [self stargazersCount];
	return [result intValue];
}

- (void)setStargazersCountValue:(int32_t)value_ {
	[self setStargazersCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStargazersCountValue {
	NSNumber *result = [self primitiveStargazersCount];
	return [result intValue];
}

- (void)setPrimitiveStargazersCountValue:(int32_t)value_ {
	[self setPrimitiveStargazersCount:[NSNumber numberWithInt:value_]];
}

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

@dynamic watchersCount;

- (int32_t)watchersCountValue {
	NSNumber *result = [self watchersCount];
	return [result intValue];
}

- (void)setWatchersCountValue:(int32_t)value_ {
	[self setWatchersCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWatchersCountValue {
	NSNumber *result = [self primitiveWatchersCount];
	return [result intValue];
}

- (void)setPrimitiveWatchersCountValue:(int32_t)value_ {
	[self setPrimitiveWatchersCount:[NSNumber numberWithInt:value_]];
}

@dynamic owner;

@end

