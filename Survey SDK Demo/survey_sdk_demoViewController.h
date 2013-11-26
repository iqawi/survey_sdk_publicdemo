//
//  survey_sdk_demoViewController.h
//  Survey SDK Demo
//
//  Copyright (c) 2013 Survey.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface survey_sdk_demoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblAvailable;

- (IBAction)btnAll_click:(id)sender;
- (IBAction)btnOne_click:(id)sender;
- (IBAction)btnLogout:(id)sender;

@end
