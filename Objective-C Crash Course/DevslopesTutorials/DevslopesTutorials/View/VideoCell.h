//
//  VideoCell.h
//  DevslopesTutorials
//
//  Created by Tomasz Kot on 14.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <UIKit/UIKit.h>
// instead of import - saves some space
@class Video;

@interface VideoCell : UITableViewCell
-(void)updateUI:(nonnull Video*)video;
@end
