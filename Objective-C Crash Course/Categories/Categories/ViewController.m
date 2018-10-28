//
//  ViewController.m
//  Categories
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"
#import "Honda.h"
// you have to import it
#import "Honda+SupedUp.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Honda *honda = [[Honda allo]init];
    [honda addUglySpoiler];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
