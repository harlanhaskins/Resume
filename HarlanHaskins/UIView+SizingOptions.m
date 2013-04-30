//
//  UIView+ProportionalWidth.m
//  Field2Base
//
//  Created by Harlan Haskins on 3/25/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "UIView+SizingOptions.h"

@implementation UIView (SizingOptions)
@dynamic widthToHeightProportion;

-(void) setSizeProportionalToWidth:(float)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    frame.size.height = width / self.widthToHeightProportion;
    [self setFrame:frame];
}

-(void) setSizeProportionalToHeight:(float)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    frame.size.width = self.widthToHeightProportion * height;
    [self setFrame:frame];
}

-(void) fillFrame:(CGRect)frame withCenter:(CGPoint)center {
    double frameProportion = frame.size.width / frame.size.height;
    double selfProportion = self.frame.size.width / self.frame.size.height;
    BOOL shouldFillHeight = selfProportion < frameProportion;
    if (shouldFillHeight) {
        [self setSizeProportionalToHeight:frame.size.height];
    }
    else {
        [self setSizeProportionalToWidth:frame.size.width];
    }
    self.center = center;
}

-(float) widthToHeightProportion {
    return (self.frame.size.width / self.frame.size.height);
}
@end
