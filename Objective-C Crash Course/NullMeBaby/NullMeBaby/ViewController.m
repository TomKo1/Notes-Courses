//
//  ViewController.m
//  NullMeBaby
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//
//-(int)sum:(nonnull NSNumber*)numA :(nonnull NSNumber*)numB {
//    int theSum = numA.intValue + numB.intValue;
//    return theSum;
//}


-(int)sum:(NSNumber* _Nonnull)numA :(NSNumber*_Nonnull)numB {
    int theSum = numA.intValue + numB.intValue;
    return theSum;
}


-(void)idiot:(NSString * _Nonnull)grr {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *num1;
    NSNumber *num2;
    NSString *string;
//    [self idiot:string];
    
//    if(num1 && num2) {
//        int sum = [self sum:num1 :num2];
//    } else {
//        NSLog(@"Sum: %d", sum);
//    }
}
@end
