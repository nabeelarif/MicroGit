// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitUserModel.m instead.

#import "_GitUserModel.h"

const struct GitUserModelAttributes GitUserModelAttributes = {
	.avatarUrl = @"avatarUrl",
	.login = @"login",
	.type = @"type",
	.uniqueId = @"uniqueId",
};

const struct GitUserModelRelationships GitUserModelRelationships = {
	.contributed = @"contributed",
	.owned = @"owned",
};

@implementation GitUserModelID
@end

@implementation _GitUserModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GitUser" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GitUser";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GitUser" inManagedObjectContext:moc_];
}

- (GitUserModelID*)objectID {
	return (GitUserModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"uniqueIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"uniqueId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic avatarUrl;

@dynamic login;

@dynamic type;

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

@dynamic contributed;

@dynamic owned;

@end

