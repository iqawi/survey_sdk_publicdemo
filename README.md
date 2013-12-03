#Welcome to the Public Demo App for the Survey.com iOS SDK

####Clone this app to get started working with the Survey.com SDK

Please contact your account rep to get your ["org_id"](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Getting-an-org_id) before going live, the sample "org_id" is for test data only.

See the wiki for [setting up your users](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Connecting-your-users), [colors and text that can be customized](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Customization), details about [geo based surveys]((https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Geo-based-surveys), and [callbacks for survey completes](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Implementing-callbacks-when-surveys-finish).

##Quick Start
Add the static library and header file to your app.  See the wiki for more details on how to [link the libary](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Adding-the-library-to-your-project).

[libSurvey SDK.a](https://github.com/Survey-Com/survey_sdk_publicdemo/blob/master/libSurvey%20SDK.a?raw=true)

[Survey_SDK.h](https://raw.github.com/Survey-Com/survey_sdk_publicdemo/master/Survey%20SDK%20Demo/Survey_SDK.h)

Initialize the SDK in your app delegate

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    	// Add this function here to initialize the Survey SDK
    	[Survey_SDK start:launchOptions // pass through the launchOptions dictionary (needed for responding to local notifications)
        	       org_id:@"5294f5153966bd22881cffa0" // org_id was provided by your Survey.com account rep
            	 delegate:(id)self //pass a delegate to receive a notification about each Survey complete
              	is_live:NO // once you are finished testing and ready to go live, set this to "YES"
         	hide_rewards:NO]; // YES will never display survey reward values - NO will display rewards > $0
    
    	return YES;
	}

In the view controller or menu, create a button that will launch the survey SDK.  Call the ["setupUser"](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/Connecting-your-users) function with the unique identifier for each of your users (must be in email format) and then call the function to launch the survey list.

	- (IBAction)launchSurveys_click:(id)sender {
    	// SDK call to initialize the user
    	// Can be called as soon as the user information is available or as late as immediately before the Show methods
    	// If an email is not available, please use a distinct id of some kind
    	[Survey_SDK setupUser:@"test@test123.com"];
    
    	// SDK call to load the list of available surveys
    	[Survey_SDK showSurveyList];
	}

_All usage must adhere to our [SDK Usage Agreement and Guideslines](https://github.com/Survey-Com/survey_sdk_publicdemo/wiki/SDK-Usage-Agreement)_