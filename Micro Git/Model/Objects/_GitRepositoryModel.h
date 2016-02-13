// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitRepositoryModel.h instead.

#import <CoreData/CoreData.h>
#import "BaseModel.h"

extern const struct GitRepositoryModelAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *detailedInfo;
	__unsafe_unretained NSString *forksCount;
	__unsafe_unretained NSString *fullName;
	__unsafe_unretained NSString *language;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *openIssuesCount;
	__unsafe_unretained NSString *stargazersCount;
	__unsafe_unretained NSString *uniqueId;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *watchersCount;
} GitRepositoryModelAttributes;

extern const struct GitRepositoryModelRelationships {
	__unsafe_unretained NSString *owner;
} GitRepositoryModelRelationships;

@class GitUserModel;

@interface GitRepositoryModelID : NSManagedObjectID {}
@end

@interface _GitRepositoryModel : BaseModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) GitRepositoryModelID* objectID;

@property (nonatomic, strong) NSDate* createdAt;

//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* detailedInfo;

//- (BOOL)validateDetailedInfo:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* forksCount;

@property (atomic) int16_t forksCountValue;
- (int16_t)forksCountValue;
- (void)setForksCountValue:(int16_t)value_;

//- (BOOL)validateForksCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* fullName;

//- (BOOL)validateFullName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* language;

//- (BOOL)validateLanguage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* openIssuesCount;

@property (atomic) int32_t openIssuesCountValue;
- (int32_t)openIssuesCountValue;
- (void)setOpenIssuesCountValue:(int32_t)value_;

//- (BOOL)validateOpenIssuesCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* stargazersCount;

@property (atomic) int32_t stargazersCountValue;
- (int32_t)stargazersCountValue;
- (void)setStargazersCountValue:(int32_t)value_;

//- (BOOL)validateStargazersCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* uniqueId;

@property (atomic) int32_t uniqueIdValue;
- (int32_t)uniqueIdValue;
- (void)setUniqueIdValue:(int32_t)value_;

//- (BOOL)validateUniqueId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updatedAt;

//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* watchersCount;

@property (atomic) int32_t watchersCountValue;
- (int32_t)watchersCountValue;
- (void)setWatchersCountValue:(int32_t)value_;

//- (BOOL)validateWatchersCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) GitUserModel *owner;

//- (BOOL)validateOwner:(id*)value_ error:(NSError**)error_;

@end

@interface _GitRepositoryModel (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;

- (NSString*)primitiveDetailedInfo;
- (void)setPrimitiveDetailedInfo:(NSString*)value;

- (NSNumber*)primitiveForksCount;
- (void)setPrimitiveForksCount:(NSNumber*)value;

- (int16_t)primitiveForksCountValue;
- (void)setPrimitiveForksCountValue:(int16_t)value_;

- (NSString*)primitiveFullName;
- (void)setPrimitiveFullName:(NSString*)value;

- (NSString*)primitiveLanguage;
- (void)setPrimitiveLanguage:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveOpenIssuesCount;
- (void)setPrimitiveOpenIssuesCount:(NSNumber*)value;

- (int32_t)primitiveOpenIssuesCountValue;
- (void)setPrimitiveOpenIssuesCountValue:(int32_t)value_;

- (NSNumber*)primitiveStargazersCount;
- (void)setPrimitiveStargazersCount:(NSNumber*)value;

- (int32_t)primitiveStargazersCountValue;
- (void)setPrimitiveStargazersCountValue:(int32_t)value_;

- (NSNumber*)primitiveUniqueId;
- (void)setPrimitiveUniqueId:(NSNumber*)value;

- (int32_t)primitiveUniqueIdValue;
- (void)setPrimitiveUniqueIdValue:(int32_t)value_;

- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;

- (NSNumber*)primitiveWatchersCount;
- (void)setPrimitiveWatchersCount:(NSNumber*)value;

- (int32_t)primitiveWatchersCountValue;
- (void)setPrimitiveWatchersCountValue:(int32_t)value_;

- (GitUserModel*)primitiveOwner;
- (void)setPrimitiveOwner:(GitUserModel*)value;

@end
