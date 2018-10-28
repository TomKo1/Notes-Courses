//
//  Civic.m
//  OOP
//
//  Created by Tomasz Kot on 04.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "Civic.h"

@implementation Civic

-(id)init {
    if(self = [super init]) {
        
    }
    [self drive];
    return self;
}

-(void)test {
    self.make = @"Honda";
    self.model = @"Civic";
    [self drive];
}

-(void)drive {
    NSLog(@"Drive from subclass");
    [super drive];
}
@end
