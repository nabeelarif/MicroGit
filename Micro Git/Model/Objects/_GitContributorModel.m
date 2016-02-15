// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitContributorModel.m instead.

#import "_GitContributorModel.h"

const struct GitContributorModelAttributes GitContributorModelAttributes = {
	.countContributions = @"countContributions",
	.siteAdmin = @"siteAdmin",
};

const struct GitContributorModelRelationships GitContributorModelRelationships = {
	.repository = @"repository",
	.user = @"user",
};

@implementation GitContributorModelID
@end

@implementation _GitContributorModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GitContributor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GitContributor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GitContributor" inManagedObjectContext:moc_];
}

- (GitContributorModelID*)objectID {
	return (GitContributorModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"countContributionsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"countContributions"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"siteAdminValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"siteAdmin"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic countContributions;

- (int32_t)countContributionsValue {
	NSNumber *result = [self countContributions];
	return [result intValue];
}

- (void)setCountContributionsValue:(int32_t)value_ {
	[self setCountContributions:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCountContributionsValue {
	NSNumber *result = [self primitiveCountContributions];
	return [result intValue];
}

- (void)setPrimitiveCountContributionsValue:(int32_t)value_ {
	[self setPrimitiveCountContributions:[NSNumber numberWithInt:value_]];
}

@dynamic siteAdmin;

- (BOOL)siteAdminValue {
	NSNumber *result = [self siteAdmin];
	return [result boolValue];
}

- (void)setSiteAdminValue:(BOOL)value_ {
	[self setSiteAdmin:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSiteAdminValue {
	NSNumber *result = [self primitiveSiteAdmin];
	return [result boolValue];
}

- (void)setPrimitiveSiteAdminValue:(BOOL)value_ {
	[self setPrimitiveSiteAdmin:[NSNumber numberWithBool:value_]];
}

@dynamic repository;

@dynamic user;

@end

