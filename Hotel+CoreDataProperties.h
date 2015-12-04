//
//  Hotel+CoreDataProperties.h
//  HotelManager
//
//  Created by Lindsey on 11/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Hotel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hotel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSNumber *stars;
@property (nullable, nonatomic, retain) NSSet<Rooms *> *rooms;
@property (nullable, nonatomic, retain) NSString *imageName;

@end

@interface Hotel (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(Rooms *)value;
- (void)removeRoomsObject:(Rooms *)value;
- (void)addRooms:(NSSet<Rooms *> *)values;
- (void)removeRooms:(NSSet<Rooms *> *)values;

@end

NS_ASSUME_NONNULL_END
