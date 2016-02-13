// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitUserModel.h instead.

#import <CoreData/CoreData.h>
#import "BaseModel.h"

extern const struct GitUserModelAttributes {
	__unsafe_unretained NSString *avatarUrl;
	__unsafe_unretained NSString *login;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *uniqueId;
} GitUserModelAttributes;

@interface GitUserModelID : NSManagedObjectID {}
@end

@interface _GitUserModel : BaseModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) GitUserModelID* objectID;

@property (nonatomic, strong) NSString* avatarUrl;

//- (BOOL)validateAvatarUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* login;

//- (BOOL)validateLogin:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* uniqueId;

@property (atomic) int32_t uniqueIdValue;
- (int32_t)uniqueIdValue;
- (void)setUniqueIdValue:(int32_t)value_;

//- (BOOL)validateUniqueId:(id*)value_ error:(NSError**)error_;

@end

@interface _GitUserModel (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAvatarUrl;
- (void)setPrimitiveAvatarUrl:(NSString*)value;

- (NSString*)primitiveLogin;
- (void)setPrimitiveLogin:(NSString*)value;

- (NSNumber*)primitiveUniqueId;
- (void)setPrimitiveUniqueId:(NSNumber*)value;

- (int32_t)primitiveUniqueIdValue;
- (void)setPrimitiveUniqueIdValue:(int32_t)value_;

@end
