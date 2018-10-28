//
//  HTTPService.h
//  DevslopesTutorials
//
//  Created by Tomasz Kot on 14.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
-(void) getTutorials:(nullable onComplete)completionHandler;

@end
