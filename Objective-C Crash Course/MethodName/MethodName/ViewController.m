//
//  ViewController.m
//  MethodName
//
//  Created by Tomasz Kot on 04.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
// no string on non object types
@property(nonatomic) double bankAccount;
@property(nonatomic) double itemAmount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bankAccount = 500.50;
    self.itemAmount = 400.00;
    
    [self playground];
}


- (BOOL) canPurchase:(double)amount{
    if(self.bankAccount >= amount) {
        return YES;
    } else {
        return NO;
    }
}

// another parameter
//- (BOOL) canPurchase:(double)amount :(NSInteger) val{
//    if(self.bankAccount >= amount) {
//        return YES;
//    } else {
//        return NO;
//    }
//}

- (void)playground {
    if([self canPurchase:self.itemAmount]) {
        NSLog(@"We can buy!");
    }
    
    
    Person *person = [[Person alloc]init];
//    [person speakName];
    // static method
//    [Person stateSpecies];
//    NSURL *url = [NSURL URLWithString:@"http://google.com"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:data];
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL  URLWithString:@"http://google.com"]]];
}




// named parameters
// with in name is like a hint for first parameter
- (void)declareWinnerWithPlayerAScore:(NSInteger)scoreA playerBScore:(NSInteger)scoreB{
    if(scoreA > scoreB) {
        NSLog(@"Player A wins!");
    } else if(scoreB > scoreA) {
        NSLog(@"Player B wins!");
    } else {
        NSLog(@"The game is at a standsstill!");
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
