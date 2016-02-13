// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GitIssueModel.h instead.

#import <CoreData/CoreData.h>
#import "BaseModel.h"

extern const struct GitIssueModelAttributes {
	__unsafe_unretained NSString *body;
	__unsafe_unretained NSString *commentsCount;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *number;
	__unsafe_unretained NSString *state;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *uniqueId;
	__unsafe_unretained NSString *updatedAt;
} GitIssueModelAttributes;

@interface GitIssueModelID : NSManagedObjectID {}
@end

@interface _GitIssueModel : BaseModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) GitIssueModelID* objectID;

@property (nonatomic, strong) NSString* body;

//- (BOOL)validateBody:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* commentsCount;

@property (atomic) int32_t commentsCountValue;
- (int32_t)commentsCountValue;
- (void)setCommentsCountValue:(int32_t)value_;

//- (BOOL)validateCommentsCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* createdAt;

//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* number;

@property (atomic) int32_t numberValue;
- (int32_t)numberValue;
- (void)setNumberValue:(int32_t)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* state;

//- (BOOL)validateState:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* uniqueId;

@property (atomic) int32_t uniqueIdValue;
- (int32_t)uniqueIdValue;
- (void)setUniqueIdValue:(int32_t)value_;

//- (BOOL)validateUniqueId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updatedAt;

//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;

@end

@interface _GitIssueModel (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveBody;
- (void)setPrimitiveBody:(NSString*)value;

- (NSNumber*)primitiveCommentsCount;
- (void)setPrimitiveCommentsCount:(NSNumber*)value;

- (int32_t)primitiveCommentsCountValue;
- (void)setPrimitiveCommentsCountValue:(int32_t)value_;

- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;

- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int32_t)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int32_t)value_;

- (NSString*)primitiveState;
- (void)setPrimitiveState:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSNumber*)primitiveUniqueId;
- (void)setPrimitiveUniqueId:(NSNumber*)value;

- (int32_t)primitiveUniqueIdValue;
- (void)setPrimitiveUniqueIdValue:(int32_t)value_;

- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;

@end
