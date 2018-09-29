//
//  Person.h
//  Properties
//
//  Created by Tomasz Kot on 24.09.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
// private variables 
{
    BOOL isInsecure;
}

@property(nonatomic, strong) NSString *firstName;
@property(nonatomic, strong) NSString *lastName;



@end
