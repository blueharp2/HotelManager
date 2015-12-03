//
//  BookViewController.m
//  HotelManager
//
//  Created by Lindsey on 12/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "BookViewController.h"
#import "Rooms.h"
#import "Hotel.h"
#import "Guest.h"
#import "Reservations.h"
#import "AvailabilityViewController.h"
#import "AppDelegate.h"
#import "ReservationService.h"
#import "NSObject+NSObject_NSManagedObjectContex_Category.h"

@interface BookViewController ()

@property (strong, nonatomic)UITextField *namefield;


@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBookViewController];
    [self setupMessageLabel];
    [self setupNameField];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupBookViewController{
    [self.navigationItem setTitle:self.room.hotel.name];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

-(void) setupMessageLabel{
    UILabel *messageLabel =[[UILabel alloc]init];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;

    messageLabel.text = [NSString stringWithFormat:@"Reservations at %@, Room: %i, From: %@ - To: %@", self.room.hotel.name, self.room.roomNumber.intValue, [NSDateFormatter localizedStringFromDate:self.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle], [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    [self.view addSubview:messageLabel];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    leading.active = YES;
    trailing.active = YES;
    centerY.active = YES;
}

-(void) setupNameField{
    self.namefield = [[UITextField alloc]init];
    self.namefield.placeholder = @"Please enter your name";
    self.namefield.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.namefield];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.namefield attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.namefield attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:84.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.namefield attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    
    [self.namefield becomeFirstResponder];
    
}
-(void)saveButtonSelected:(UIBarButtonItem *)sender{
    
 
    BOOL isSuccessful;
    
   isSuccessful = [ReservationService bookNewReservationWithStartDate:self.startDate endDate:self.endDate inRoom:self.room guestName:self.namefield.text];
    
    if (isSuccessful) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        NSLog(@"Fail");
    }
    
    
//    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
//    
//    NSManagedObjectContext *context = delegate.managedObjectContext;
//    
//    Reservations *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservations" inManagedObjectContext:context
//                                 ];
//    reservation.startDate = self.startDate;
//    reservation.endDate = self.endDate;
//    reservation.room = self.room;
//    
//    self.room.reservation = reservation;
//    
//    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
//    
//    guest.name = self.namefield.text;
//    reservation.guest = guest;
//   
//    NSError *sendError;
//    [context save:&sendError];
//    if (sendError) {
//        NSLog(@"Error when saving");
//        
//    }else {
//        
//
//    }
    
}

@end
