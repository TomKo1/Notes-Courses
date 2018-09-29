//
//  ViewController.m
//  StringFling
//
//  Created by Tomasz Kot on 25.09.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *firstNname = @"John";
    NSString *allocatedString = [[NSString alloc]init];
    
    NSLog(@"Name: %@", firstNname);
    
    NSString *fullName = [NSString stringWithFormat:@"%@ Smith %@", firstNname, @"Charles"];
    
    NSString *display = [fullName stringByAppendingString:@" - Died 1448"];
    
    NSLog(@"%@", fullName);
    NSLog(@"%@", display);
    
    NSString *var1 = @"Junk";
    NSString *var2 = @"in the trunk";
    NSString *var3 = @"Junk";
    
    // this is not safe - compare objects in memory
//    if ( var1 == var2 ) {
//        NSLog(@"They are not the same");
//    }
    
    if(![var1 isEqualToString:var2 ]) {
        NSLog(@"We should see this!");
    }
    
    if([var1.lowercaseString isEqualToString:var3]) {
        NSLog(@"We gotteh here!");
    }
    
    if([var1 caseInsensitiveCompare:var3
        ] == NSOrderedSame) {
        NSLog(@"They are the same");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
