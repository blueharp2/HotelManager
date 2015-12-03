//
//  HotelManagerTests.m
//  HotelManagerTests
//
//  Created by Lindsey on 11/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+NSObject_NSManagedObjectContex_Category.h"

@interface HotelManagerTests : XCTestCase

@property (strong,nonatomic) NSManagedObjectContext *context;

@end

@implementation HotelManagerTests

- (void)setUp {
    [super setUp];
    [self setContext:[NSManagedObjectContext managerContext]];
//    [self testContextCreation];
    
}

- (void)tearDown {
    [super tearDown];
    //[self setContext:nil];
    [self testContextCreation];
}

-(void)testContextCreation{
    XCTAssertNotNil(self.context, @"Context should not be nil. Check category implementation.");
}


-(void)testCoreDataSave {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.resultType = NSCountResultType;
    
    NSError *error;
    NSArray *result = [self.context executeFetchRequest:request error:&error];
    NSNumber *count = [result firstObject];
    XCTAssertNil(error, @"Error should be nil.");
    XCTAssertNotNil(result, @"Result arrary should not be nil.");
    XCTAssertTrue([count intValue] > 0, @"Number of objects in the database after seeding should be greater than 0.");
    
}

@end
