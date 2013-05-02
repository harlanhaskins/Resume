//
//  ProgressView.h
//  '
//
//  Created by Harlan Haskins on 4/30/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView
@property (strong, nonatomic) UIColor *tintColor;
-(id) initWithFrame:(CGRect)frame Percent:(CGFloat)percent TintColor:(UIColor*)color;
@end
