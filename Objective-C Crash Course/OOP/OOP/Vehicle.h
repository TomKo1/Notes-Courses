//
//  Vehicle.h
//  OOP
//
//  Created by Tomasz Kot on 04.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
@property(nonatomic, strong) NSString *make;
@property(nonatomic, strong) NSString *model;
@property(nonatomic,strong) NSString *engineSize;
-(void)drive;
@end
