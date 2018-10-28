//
//  ViewController.m
//  BOOOOOLLL
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
    BOOL amICool = YES;
    BOOL isTheOtherPersonCool = NO;
    // BOOL can't be strong or weak - this is an object
    
    if(amICool) {
        NSLog(@"Whip out the cool Ray Bans and hit the beach!");
    } else {
        NSLog(@"We should nver get here!");
    }
    
//    if( 55 == 22 && amICool != isTheOtherPersonCool || 1 == 1) {
//
//    }
    
    NSString *name = nil;
    
    // very common
    if(name) {
        NSLog(@"Name: %@", name);
    } else if(100 == 100) {
        NSLog(@"hello!");
    }
    
    if(!name) {
        name = @"Sandra";
    }
    
    // do not use this
    bool sayWhat;
    Boolean hmmm;
    boolean_t grrr;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
