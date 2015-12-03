//
//  LookupViewController.m
//  HotelManager
//
//  Created by Lindsey on 12/2/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "LookupViewController.h"
#import "NSObject+NSObject_NSManagedObjectContex_Category.h"
#import "Reservations.h"
#import "Guest.h"
#import "Rooms.h"
#import "Hotel.h"
#include "LookupReservation.h"



@interface LookupViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *datasource;

@end

@implementation LookupViewController

-(void) setDatasource:(NSArray *)datasource {
    _datasource = datasource;
    
    [self.tableView reloadData];
}

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLookupViewController];
    [self setupTableView];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupLookupViewController{
    [self setTitle:@"Search"];
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

#pragma mark = UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datasource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Reservations *reservation = self.datasource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Name: %@, Hotel: %@", reservation.guest.name, reservation.room.hotel.name];
    
    return cell;
}

#pragma mark - UITableviewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 44.0)];
    searchBar.delegate = self;
    return searchBar;
}

#pragma mark - UISearchBarDelegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [LookupReservation lookupReservationWithName:searchBar.text];
    
    
//    NSString *searchText = searchBar.text;
//    NSManagedObjectContext *context = [NSManagedObjectContext managerContext];
//    
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservations"];
//    request.predicate = [NSPredicate predicateWithFormat:@"guest.name == %@", searchText];
//    
//    NSError *error;
//    NSArray *results = [context executeFetchRequest:request error:&error];
//    
//    if (!error) {
//        self.datasource = results;
//        
//    }

}


@end
