//
//  ViewController.m
//  ClassAnatomy
//
//  Created by Tomasz Kot on 24.09.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"

// that let us declare local variables
@interface ViewController ()
// here private
@property(nonatomic, strong) NSString *vehicle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Name %@", self.name);
    
    self.name = @"Jack";
    
    NSLog(@"Name: %@", self.name);
    
    // _ - another way of accessing data
    _name = @"Peter";
    
    NSLog(@"Name %@", _name);
    
    [self setName:@"Sylvia"];
    
    NSLog(@"Name: %@", [self name]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
