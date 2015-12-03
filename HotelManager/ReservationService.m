//
//  ReservationService.m
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//
#import "AppDelegate.h"
#import "ReservationService.h"
#import "Reservations.h"
#import "Guest.h"
#import "Hotel.h"

@implementation ReservationService

+(BOOL) bookNewReservationWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate inRoom:(Rooms *)room guestName:(NSString *)name{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    Reservations *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservations" inManagedObjectContext:context
                                 ];
    reservation.startDate = startDate;
    reservation.endDate = endDate;
    reservation.room = room;
    
    room.reservation = reservation;
    
    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    
    guest.name = name;
    reservation.guest = guest;
    
    NSError *sendError;
    [context save:&sendError];
    if (sendError) {
        NSLog(@"Error when saving");
        return false;
        
    }else {
        return true;
//        [self.navigationController popToRootViewControllerAnimated:YES];
    }

}

@end
