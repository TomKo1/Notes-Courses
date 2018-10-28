//
//  VideoVC.h
//  DevslopesTutorials
//
//  Created by Tomasz Kot on 18.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property(nonatomic, strong)Video *video;
@end
