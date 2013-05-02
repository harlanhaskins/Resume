//
//  AppsViewController.h
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/25/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) NSString *headerTitle;
-(id) initWithTitle:(NSString*)title;
@end
