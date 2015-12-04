//
//  LookupReservation.m
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "LookupReservation.h"

#import "Reservations.h"
#import "NSObject+NSObject_NSManagedObjectContex_Category.h"


@implementation LookupReservation

+ (NSArray *) lookupReservationWithName: (NSString *) searchText {
    
    NSManagedObjectContext *context = [NSManagedObjectContext managerContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservations"];
    request.predicate = [NSPredicate predicateWithFormat:@"guest.name == %@", searchText];
    
    NSError *error;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (!error) {
        
        return results;
        
    } else {
        
        return nil;
        
    }
}
@end
