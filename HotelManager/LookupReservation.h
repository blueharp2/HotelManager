//
//  LookupReservation.h
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"



@interface LookupReservation : NSObject
+(BOOL) lookupReservationWithName: (NSString *)searchText;

@end
