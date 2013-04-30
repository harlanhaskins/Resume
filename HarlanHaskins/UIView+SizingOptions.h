//
//  UIView+ProportionalWidth.h
//  Field2Base
//
//  Created by Harlan Haskins on 3/25/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SizingOptions)
@property float widthToHeightProportion;
-(void) setSizeProportionalToWidth:(float)width;
-(void) setSizeProportionalToHeight:(float)height;
-(void) fillFrame:(CGRect)frame withCenter:(CGPoint)center;
@end
