//
//  Person.h
//  InitStuff
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, strong) NSString *firstName;
@property(nonatomic, strong) NSString *lastName;

-(id)initWithFirstName:(NSString*)first lastName:(NSString*)last;
-(void)printName;

@end
