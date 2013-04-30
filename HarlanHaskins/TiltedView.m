//
//  TriangleView.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/25/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "TiltedView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TiltedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //Copy the current frame into a new, editable object.
        CGRect newFrame = frame;
        
        //Multiply the size by 1.2 so it'll still fill the screen after tilting.
        newFrame.size.height *= 1.2;
        newFrame.size.width *= 1.2;
        
        //Adjust the position so the left side is filled.
        newFrame.origin.x -= (newFrame.size.width / 1.85);
        newFrame.origin.y -= (newFrame.size.height / 4.5);
        
        //Make a rectangle that fit the new frame.
        _rectangle = [[UIView alloc] initWithFrame:newFrame];
        
        //Give it a transparent border to enable antialiasing (we want this edge smooth.)
        _rectangle.layer.borderWidth = 3;
        _rectangle.layer.borderColor = [UIColor clearColor].CGColor;
        _rectangle.layer.shouldRasterize = YES;
        
        //Set the background to black, for now.
        _rectangle.backgroundColor = [UIColor blackColor];
        
        //Make an angle. CGAffineTransformMakeRotation requires radians, so I'll just quickly convert. On iOS, it rotates counterclockwise if the value is positive, so I'm going to change to negative.
        CGFloat angleToRotate = [self radiansForDegrees:20];
        
        //Set the transform property.
        [_rectangle setTransform:CGAffineTransformMakeRotation(angleToRotate)];
        
        //Go ahead and add.
        [self addSubview:_rectangle];
    }
    return self;
}

-(CGFloat) radiansForDegrees:(CGFloat)degrees {
    CGFloat radians = ((M_PI * degrees) / 180.0);
    return radians;
}

-(void) setColor:(UIColor*) color {
    _color = color;
    _rectangle.backgroundColor = color;
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
