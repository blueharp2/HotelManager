//
//  Rooms+CoreDataProperties.h
//  HotelManager
//
//  Created by Lindsey on 11/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Rooms.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rooms (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *numberOfBeds;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) NSNumber *roomNumber;
@property (nullable, nonatomic, retain) Hotel *hotel;
@property (nullable, nonatomic, retain) Reservations *reservation;

@end

NS_ASSUME_NONNULL_END
