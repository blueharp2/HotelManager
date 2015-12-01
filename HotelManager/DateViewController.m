//
//  DateViewController.m
//  HotelManager
//
//  Created by Lindsey on 12/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"

@interface DateViewController ()

@property (strong, nonatomic) UIDatePicker *startDatePicker;
@property (strong, nonatomic) UIDatePicker *endDatePicker;


@end

@implementation DateViewController

-(void) loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupDateViewController];
    [self setupDatePickers];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupDateViewController{
    [self.navigationItem setTitle:@"Select Date"];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected:)]];
}

-(void)setupDatePickers{
    self.startDatePicker = [[UIDatePicker alloc]init];
    self.startDatePicker.datePickerMode = UIDatePickerModeDate;
    self.startDatePicker.frame = CGRectMake(0.0, 84.0, CGRectGetWidth(self.view.frame), 200.0);
    
    self.endDatePicker = [[UIDatePicker alloc]init];
    self.endDatePicker.datePickerMode = UIDatePickerModeDate;
    self.endDatePicker.frame = CGRectMake(0.0, 350.0, CGRectGetWidth(self.view.frame), 200.0);
    
    
    [self.view addSubview:self.startDatePicker];
    [self.view addSubview:self.endDatePicker];
    
}
-(void)doneButtonSelected:(UIBarButtonItem *)sender {
    
    NSDate *startDate = [self.startDatePicker date];
    NSDate *endDate = [self.endDatePicker date];
    NSDate *rightNow = [NSDate date];

    if ([startDate timeIntervalSinceReferenceDate] < [rightNow timeIntervalSinceReferenceDate]) {
        UIAlertController *alertControllerOldStartDate = [UIAlertController alertControllerWithTitle:@"Pick a different Start Date:" message:@"Please select a date in the future." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.endDatePicker.date = [NSDate date];
            self.startDatePicker.date = [NSDate date];
        }];
        
        [alertControllerOldStartDate addAction:okAction];
        [self presentViewController:alertControllerOldStartDate animated:YES completion:nil];
        
    } else {
        
            if ([startDate timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
                UIAlertController *alertControllerBadStartDate = [UIAlertController alertControllerWithTitle:@"Pick a different Start Date:" message:@"Please select a start date that is before your end date." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    self.startDatePicker.date = [NSDate date];
                }];
                
                [alertControllerBadStartDate addAction:okAction];
                [self presentViewController:alertControllerBadStartDate animated:YES completion:nil];
        
            } else {
               AvailabilityViewController *availabilityViewController = [[AvailabilityViewController alloc]init];
                availabilityViewController.startDate = startDate;
                availabilityViewController.endDate = endDate;
                [self.navigationController pushViewController: availabilityViewController animated:YES];
            }
        
        // Valid, check for dates to make sure start date is greater then end date....
        
        // If true move along, else present AlertView.
        

        
    }
    

    
    
}


@end
