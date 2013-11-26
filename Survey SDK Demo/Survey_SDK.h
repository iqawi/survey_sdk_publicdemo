//
//  Survey SDK
//
//  Copyright (c) 2013 Survey.com. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SurveyDelegate <NSObject>

- (void)didFinishSurvey:(NSString *)survey_id reward:(NSString *)reward success:(BOOL)success;
- (void)surveyCount:(NSUInteger)count;

@end

@interface Survey_SDK : NSObject {
}

+ (void)start:(NSDictionary *)launchOptions
       org_id:(NSString *)org_id
      is_live:(BOOL)is_live;

+ (void)start:(NSDictionary *)launchOptions
       org_id:(NSString *)org_id
      is_live:(BOOL)is_live
 hide_rewards:(BOOL)hide_rewards;

+ (void)start:(NSDictionary *)launchOptions
       org_id:(NSString *)org_id
     delegate:(id<SurveyDelegate>)delegate
      is_live:(BOOL)is_live
 hide_rewards:(BOOL)hide_rewards;

+ (void)didReceiveLocalNotification:(UILocalNotification *)notification;

+ (void)setupUser:(NSString *)email;

+ (void)setupUser:(NSString *)email
       first_name:(NSString *)first_name
        last_name:(NSString *)last_name;

+ (void)setupUser:(NSString *)email
       first_name:(NSString *)first_name
        last_name:(NSString *)last_name
       birth_date:(NSDate *)birth_date;

+ (void)logoutUser;

+ (void)showSurveyList;
+ (void)showSurvey:(NSString *)survey_id returnToList:(BOOL)returnToList;
+ (void)showSurvey;

+ (void)requestSurveyCount:(id<SurveyDelegate>)delegate;

+ (void)enableGeo;

+ (void)setCustomText:(NSString *)property text:(NSString *)text;
+ (void)setCustomColor:(NSString *)property color:(UIColor *)color;

@end
