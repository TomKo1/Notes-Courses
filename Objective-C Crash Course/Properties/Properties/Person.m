//
//  Person.m
//  Properties
//
//  Created by Tomasz Kot on 24.09.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "Person.h"


@implementation Person

-(void)test {
    self.firstName = @"Bob";
    // variable behind property -> instance variables doesn not have any
    _firstName = @"Jack";
}
@end
