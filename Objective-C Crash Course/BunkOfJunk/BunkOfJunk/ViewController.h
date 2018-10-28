//
//  ViewController.h
//  BunkOfJunk
//
//  Created by Tomasz Kot on 09.10.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
// nonatomic is considerably faster :)
// strong means it will never be nil :)
// cannot use strong on nonobject e.g @property (nonatomic, strong) int age;
// it should be @property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *name;

@end

