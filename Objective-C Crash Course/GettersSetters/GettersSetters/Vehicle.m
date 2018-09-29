//
//  Vehicle.m
//  GettersSetters
//
//  Created by Tomasz Kot on 25.09.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

// setter which is overwritten
-(void)setOdometer:(long)odometer {
    // if value passed is grater than
    // exisiting one than set it
    if (odometer > _odometer) {
        _odometer = odometer;
    }
}
// getter
-(NSString*)model {
    if([_model isEqualToString: @"Honda Civic"]) {
        return @"POS";
    } else {
        return _model;
    }
}

@end
