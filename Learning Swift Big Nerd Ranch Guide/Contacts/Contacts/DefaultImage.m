//
//  DefaultImage.m
//  Contacts
//
//  Created by Tomasz Kot on 24.06.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

#import "DefaultImage.h"

@implementation DefaultImage
+ (UIImage* )generateDefaultImageOfSize:(CGSize)size {
    //utowrzenie ramki
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    
    // pobranie kontekstu obrazu
    UIGraphicsBeginImageContext(size);
    
    // pobranie odwolania do kontekstu
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // narysowanie tla w kolorze bialym, aby uniknac domyslnego czarnego
    CGColorRef white = [[UIColor whiteColor] CGColor];
    CGContextSetFillColorWithColor(context, white);
    CGContextFillRect(context, frame);
    
    // narysowanie zoltego kola
    CGFloat x = frame.origin.x + size.width / 2;
    CGFloat y = frame.origin.y + size.height / 2;
    CGPoint center = CGPointMake(x, y);
    
    // narysowanie oczu
    CGColorRef black = [[UIColor blackColor]CGColor];
    CGRect leftEyeRect = CGRectMake(center.x - 255, center.y - 150 , 80, 80);
    CGRect rightEyeRect = CGRectMake(center.x + 125, center.y - 150, 80, 80);
    CGContextFillEllipseInRect(context, leftEyeRect);
    CGContextFillEllipseInRect(context, rightEyeRect);
    
    // Narysowanie usmiechu
    CGContextSetLineWidth(context, 15.0);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, center.x - 200, center.y + 150);
    
    CGContextAddCurveToPoint(context, center.x - 100, center.y + 250, center.x + 100, center.y + 250, center.x + 200, center.y + 150);
    CGContextStrokePath(context);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
