//
//  IntroViewController.h
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/30/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "DetailViewController.h"

@interface IntroViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *mrButton;
@property (weak, nonatomic) IBOutlet UIButton *mrsButton;
@property (weak, nonatomic) IBOutlet UIButton *msButton;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@end
