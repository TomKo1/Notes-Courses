//
//  Video.h
//  DevslopesTutorials
//
//  Created by Tomasz Kot on 18.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic, strong) NSString *videoTitle;
@property(nonatomic, strong) NSString *videoDescription;
@property(nonatomic, strong) NSString *videoIframe;
@property(nonatomic, strong) NSString *thumbnailUrl;
@end
