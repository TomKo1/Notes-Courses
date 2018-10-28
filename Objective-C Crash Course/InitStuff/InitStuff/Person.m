//
//  Person.m
//  InitStuff
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithFirstName:(NSString*)first lastName:(NSString*)last {
    self = [super init];
    self.firstName = first;
    self.lastName = last;
    return [self initWithAge:15];
}

// designated initialization
-(id)initWithAge:(NSInteger)age {
    self = [super init];
    return self;
}

-(void)printName {
    NSLog(@"%@ %@", self.firstName, self.lastName);
}

@end
