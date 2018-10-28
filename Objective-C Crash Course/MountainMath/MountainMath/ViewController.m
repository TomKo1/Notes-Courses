//
//  ViewController.m
//  MountainMath
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
    
    int imAnInt = 5;
    float iAmAFloat = 3.3;
    double iAmTheDouble = 5.66666664;
    
    NSLog(@"Int: %d", imAnInt);
    NSLog(@"Float: %f", iAmAFloat);
    NSLog(@"Double: %f", iAmTheDouble);
    
    // can't store native C in objective-C
    //NSArray *arr = @[imAnInt, iAmAFloat, iAmTheDouble];
    
    NSNumber *numInt = [NSNumber numberWithInt:5];
    NSNumber *numInt2 = [NSNumber numberWithInt:6];
    
    int val = numInt.intValue;
    int val2 = numInt2.intValue;
    int sum = val + val2;
    
    NSLog(@"Sum: %d", sum);
    
    NSArray *arr2 = @[numInt, numInt2, [NSNumber numberWithInt:sum]];
    // . only on property
    NSString *str = numInt2.stringValue;
    // before . syntax:
    NSString *strOldSyntax = [numInt2 stringValue];
    
    // just aliass for int -> save for architectuere
    NSInteger someInt = 55;
    
    NSNumber *sumNum = [NSNumber numberWithInt:[numInt intValue] * [ numInt2 intValue]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
