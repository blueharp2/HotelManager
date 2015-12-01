//
//  AvailabilityViewController.m
//  HotelManager
//
//  Created by Lindsey on 12/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "AvailabilityViewController.h"
#import "AppDelegate.h"
#import "Reservations.h"
#import "Rooms.h"
#import "Hotel.h"
#import "Guest.h"



@interface AvailabilityViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *dataSource;

@end

@implementation AvailabilityViewController

-(NSArray *) dataSource{
    if (!_dataSource){
        AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservations"];
        request.predicate = [NSPredicate predicateWithFormat:@"startDate <= % @ AND endDate >= %@", self.startDate, self.endDate];
        
        NSArray *results = [delegate.managedObjectContext executeFetchRequest:request error:nil];
        NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
        
        for (Reservations *reservation in results) {
            [unavailableRooms addObject:reservation.room];
        }
        NSFetchRequest *checkRequest = [NSFetchRequest fetchRequestWithEntityName:@"Rooms"];
        checkRequest.predicate =[NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];
        
        _dataSource = [delegate.managedObjectContext executeFetchRequest:checkRequest error:nil];
        
        return _dataSource;
    }
    return _dataSource;
}

-(void)loadView{
    [super loadView];
    [super.view setBackgroundColor:[UIColor whiteColor]];
    [self setupAvailabilityViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupAvailabilityViewController{
    [self setTitle:@"Rooms Available"];
}

-(void)setupTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    bottom.active = YES;
    
}
#pragma mark -UITableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (! cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    Rooms *room = (Rooms *) self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Room: %i( %i beds, $%0.2f per night)", room.numberOfBeds.intValue, room.roomNumber.intValue, room.rate.floatValue];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImage *headerImage = [UIImage imageNamed:@"room"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:headerImage];
    
    imageView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 150.0);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    return imageView;
}

@end
