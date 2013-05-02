//
//  ProgressView.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/30/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithFrame:(CGRect)frame Percent:(CGFloat)percent TintColor:(UIColor*)color {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *filledView = [[UIView alloc] initWithFrame:self.frame];
        CGRect filledViewFrame = filledView.frame;
            filledViewFrame.origin.x = 0;
            filledViewFrame.size.width = roundf(filledViewFrame.size.width * (percent / 100));
        filledView.frame = filledViewFrame;
        NSLog(@"%@", NSStringFromCGRect(filledViewFrame));
        filledView.backgroundColor = color;
        
        UIView *totalView = [[UIView alloc] initWithFrame:self.frame];
        CGRect totalViewFrame = totalView.frame;
            totalViewFrame.origin.x = filledViewFrame.size.width;
            totalViewFrame.size.width = (frame.size.width - filledViewFrame.size.width);
        totalView.frame = totalViewFrame;
        NSLog(@"%@", NSStringFromCGRect(totalViewFrame));
        totalView.backgroundColor = [color colorWithAlphaComponent:0.5];
        
        [self addSubview:filledView];
        [self addSubview:totalView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
