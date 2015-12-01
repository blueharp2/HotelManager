//
//  ViewController.m
//  HotelManager
//
//  Created by Lindsey on 11/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    [super loadView];
    [self setupCustomLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupViewController{
    [self.navigationItem setTitle:@"Hotel Manager"];
}
-(void)setupCustomLayout{
    
}

@end
