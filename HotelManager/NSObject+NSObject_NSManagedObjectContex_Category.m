//
//  NSObject+NSObject_NSManagedObjectContex_Category.m
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "NSObject+NSObject_NSManagedObjectContex_Category.h"
#import "AppDelegate.h"

@implementation NSObject (NSObject_NSManagedObjectContex_Category)

+ (NSManagedObjectContext *)managerContext {
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
    return delegate.managedObjectContext;
}



@end
