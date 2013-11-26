//
//  survey_sdk_demoViewController.m
//  Survey SDK Demo
//
//  Copyright (c) 2013 Survey.com. All rights reserved.
//

#import "survey_sdk_demoViewController.h"
#import "Survey_SDK.h"

@implementation survey_sdk_demoViewController

@synthesize lblAvailable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // SDK call to initialize the user
    // Can be called as soon as the user information is available or as late as immediately before the Show methods
    // If an email is not available, please use a distinct id of some kind
    [Survey_SDK setupUser:@"191@user.fanatic.co"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Call this function to get a count of available surveys for the user (OPTIONAL)
    self.lblAvailable.text = @"Surveys Available: (loading...)";
    [Survey_SDK requestSurveyCount:(id)self];
}

// Implement this delegate function to respond to the survey count request (OPTIONAL)
- (void)surveyCount:(NSUInteger)count {
    NSLog(@"Survey Available: %lu", (unsigned long)count);
    self.lblAvailable.text = [NSString stringWithFormat:@"Surveys Available: %lu", (unsigned long)count];
}

- (IBAction)btnAll_click:(id)sender {
    
    // SDK call to load the list of available surveys
    [Survey_SDK showSurveyList];
}

- (IBAction)btnOne_click:(id)sender {
    
    // SDK call to load a single survey
    // Can be called with a surveyid to load a specfic survey or without an id to load the "next" survey for a user
    // returnToList - YES means that after a complete the list of available surveys will appear
    [Survey_SDK showSurvey:@"51068260ad3af20002000136" returnToList:NO];
}

- (IBAction)btnLogout:(id)sender {
    
    // SDK call to logout the user
    // This should be called when a user logs out of the host app
    [Survey_SDK logoutUser];
}

@end
