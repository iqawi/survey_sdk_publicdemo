//
//  survey_sdk_demoAppDelegate.m
//  Survey SDK Demo
//
//  Copyright (c) 2013 Survey.com. All rights reserved.
//

#import "survey_sdk_demoAppDelegate.h"
	#import "Survey_SDK.h"

@implementation survey_sdk_demoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Add this function here to initialize the Survey SDK
	[Survey_SDK start:launchOptions // pass through the launchOptions dictionary (needed for responding to local notifications)
			   org_id:@"5294f5153966bd22881cffa0" // org_id was provided by your Survey.com account rep
			 delegate:(id)self // pass a delegate to receive a notification about each Survey complete
			  is_live:NO // once you are finished testing and ready to go live, set this to "YES"
		 hide_rewards:NO]; // YES will never display survey reward values - NO will display rewards > $0

	return YES;
}

// Implement this delegate function to respond when a survey is completed (OPTIONAL)
- (void)didFinishSurvey:(NSString *)survey_id reward:(NSString *)reward success:(BOOL)success
{
	NSLog(@"Survey Finished: %@ (Reward: %@ - Success: %@)", survey_id, reward, success ? @"YES" : @"NO");
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
	// Add this function to allow your app to respond to local geo notifications (OPTIONAL)
	[Survey_SDK didReceiveLocalNotification:notification];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Add this function to enable geo based surveys and messages (OPTIONAL)
	[Survey_SDK enableGeo];
}

@end
