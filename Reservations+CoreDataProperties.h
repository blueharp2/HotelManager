//
//  Reservations+CoreDataProperties.h
//  HotelManager
//
//  Created by Lindsey on 11/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Reservations.h"

NS_ASSUME_NONNULL_BEGIN

@interface Reservations (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *startDate;
@property (nullable, nonatomic, retain) NSDate *endDate;
@property (nullable, nonatomic, retain) Rooms *room;
@property (nullable, nonatomic, retain) Guest *newRelationship;

@end

NS_ASSUME_NONNULL_END
