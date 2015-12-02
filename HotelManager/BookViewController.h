//
//  BookViewController.h
//  HotelManager
//
//  Created by Lindsey on 12/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rooms.h"
#import "Hotel.h"
#import "Guest.h"
#import "Reservations.h"
#import "AvailabilityViewController.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic) Rooms *room;
@property (strong, nonatomic) NSDate *startDate;
@property (strong,nonatomic) NSDate *endDate;
@end
