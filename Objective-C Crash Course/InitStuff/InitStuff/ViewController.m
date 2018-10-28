//
//  ViewController.m
//  InitStuff
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [[Person alloc]init];
    // new is convenient
    //Person *person2 = [Person new];
    [person printName];
    
    Person *person3 = [[Person alloc]initWithFirstName:@"Petey" lastName:@"McFreedy"];
    [person3 printName];
    

}

@end
