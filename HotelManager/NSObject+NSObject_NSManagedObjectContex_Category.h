//
//  NSObject+NSObject_NSManagedObjectContex_Category.h
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface NSObject (NSObject_NSManagedObjectContex_Category)

+ (NSManagedObjectContext *) managerContext;

@end
