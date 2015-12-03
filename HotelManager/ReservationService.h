//
//  ReservationService.h
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rooms.h"

@interface ReservationService : NSObject

+(BOOL) bookNewReservationWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate inRoom:(Rooms *)room guestName:(NSString *)name;

@end
