//
//  PageViewController.h
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/29/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController

@property (strong, nonatomic) NSString *appTitle;
@property (strong, nonatomic) UIImage *screenShot;
@property int tag;
-(id) initWithTitle:(NSString*)title ScreenShot:(UIImage*)screenShot;
-(void) setFrame:(CGRect)frame;
@end
