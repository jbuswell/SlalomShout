//
//  Login.m
//  SlalomShout
//
//  Created by Jim Buswell on 10/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Login.h"
#import "SlalomShoutAppDelegate.h"

@implementation Login
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(jsonString);
	NSDictionary *results = [jsonString JSONValue];
	NSNumber *val = [results objectForKey:@"d"];
	UILabel *errorLabel = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] errorLabel];
	if([val intValue] == 1)
	{
		NSLog(@"are you registered?%@", [val stringValue]);
		errorLabel.text=@"";
		UIWindow *window = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] window];
		UITabBarController *tabBarController = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] tabBarController];
		UITextField *userNameField = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] userNameField];
		[userNameField resignFirstResponder];
		[window addSubview: [tabBarController view]];
		[userNameField release];
		[tabBarController release];
		[window release];
	}
	else 
	{
		NSLog(@"test are you registered?%@", [val stringValue]);
		UITextField *userNameField = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] userNameField];
		userNameField.text = @"";
		errorLabel.text = @"User does not exist!";
		[userNameField release];
	}
	[errorLabel release];
}

@end
