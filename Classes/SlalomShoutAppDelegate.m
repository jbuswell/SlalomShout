//
//  SlalomShoutAppDelegate.m
//  SlalomShout
//
//  Created by Jim Buswell on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SlalomShoutAppDelegate.h"
#import "JSON/JSON.h"
#import "Login.h"
#import "GetMessages.h"


@implementation SlalomShoutAppDelegate

@synthesize window;
@synthesize userName;
@synthesize userNameField;
@synthesize userNameLabel;
@synthesize errorLabel;
@synthesize tabBarController;
@synthesize messages;

#pragma mark -
#pragma mark Application lifecycle

- (IBAction)login:(id)sender {
	self.userName = userNameField.text;
	userNameLabel.text = self.userName;
	
	NSString *urlString = 
		[NSString stringWithFormat:@"http://kata.slalomdemo.com:60577/UserMessageService.asmx/ValidateUser"];

	NSURL *url = [NSURL URLWithString:urlString];
	NSString *authHeader = @"Basic d2VidXNlcjpQYXNzQHdvcmQh"; 
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
	[request setHTTPMethod:@"POST"]; 
	[request addValue:authHeader forHTTPHeaderField:@"Authorization"]; 
	[request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; 
	[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

	NSMutableDictionary *jsonObject = [NSMutableDictionary dictionary];
	[jsonObject setObject:userNameField.text forKey:@"userId"];
	NSString *jsonString = jsonObject.JSONRepresentation;
	
	NSLog(jsonString);
	
	[request setHTTPBody: [jsonString dataUsingEncoding: NSASCIIStringEncoding]];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:[[Login alloc] init]];
	[connection release];
	[request release];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == userNameField) {
        [userNameField resignFirstResponder];
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	self.messages = [[NSMutableArray alloc] init];	
	[[[GetMessages alloc] init] populateMessages];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[userName release];
	[userNameField release];
    [tabBarController release];
	[window release];
    [super dealloc];
}


@end
