//
//  ViewController.m
//  Loops
//
//  Created by Tomasz Kot on 04.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *cars = @[@"Bimmer", @"Maserati", @"Bronco II"];
    // C loop
    for(int i = 0 ; i < cars.count ; i ++ ) {
        NSString *car = [cars objectAtIndex:i];
        NSLog(@"Car: %@", car);
    }
    // fast enumeration - for-each
    for(NSString *car in cars) {
        NSLog(@"Car: %@", car);
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
