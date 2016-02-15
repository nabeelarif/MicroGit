// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitContributorModel.h instead.

#import <CoreData/CoreData.h>
#import "BaseModel.h"

extern const struct GitContributorModelAttributes {
	__unsafe_unretained NSString *countContributions;
	__unsafe_unretained NSString *siteAdmin;
} GitContributorModelAttributes;

extern const struct GitContributorModelRelationships {
	__unsafe_unretained NSString *repository;
	__unsafe_unretained NSString *user;
} GitContributorModelRelationships;

@class GitRepositoryModel;
@class GitUserModel;

@interface GitContributorModelID : NSManagedObjectID {}
@end

@interface _GitContributorModel : BaseModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) GitContributorModelID* objectID;

@property (nonatomic, strong) NSNumber* countContributions;

@property (atomic) int32_t countContributionsValue;
- (int32_t)countContributionsValue;
- (void)setCountContributionsValue:(int32_t)value_;

//- (BOOL)validateCountContributions:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* siteAdmin;

@property (atomic) BOOL siteAdminValue;
- (BOOL)siteAdminValue;
- (void)setSiteAdminValue:(BOOL)value_;

//- (BOOL)validateSiteAdmin:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) GitRepositoryModel *repository;

//- (BOOL)validateRepository:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) GitUserModel *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _GitContributorModel (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCountContributions;
- (void)setPrimitiveCountContributions:(NSNumber*)value;

- (int32_t)primitiveCountContributionsValue;
- (void)setPrimitiveCountContributionsValue:(int32_t)value_;

- (NSNumber*)primitiveSiteAdmin;
- (void)setPrimitiveSiteAdmin:(NSNumber*)value;

- (BOOL)primitiveSiteAdminValue;
- (void)setPrimitiveSiteAdminValue:(BOOL)value_;

- (GitRepositoryModel*)primitiveRepository;
- (void)setPrimitiveRepository:(GitRepositoryModel*)value;

- (GitUserModel*)primitiveUser;
- (void)setPrimitiveUser:(GitUserModel*)value;

@end
