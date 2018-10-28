//
//  Honda.h
//  Categories
//
//  Created by Tomasz Kot on 11.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <Foundation/Foundation.h>

// categories in objective-c are like class extensions
@interface Honda : NSObject
@property(nonatomic,strong)NSString *model;
@property(nonatomic,strong)NSString *miles;
-(void)increaseMilesToOdometer;
-(void)drive;
@end
