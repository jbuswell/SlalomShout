//
//  Shout.m
//  SlalomShout
//
//  Created by Jim Buswell on 9/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Shout.h"
#import "JSON/JSON.h"

@implementation Shout

@synthesize textField;
@synthesize shout;

- (IBAction)shout:(id)sender {
	shout=textField.text;
	NSLog(@"Hello World %@", shout);

	NSString *urlString = 
	[NSString stringWithFormat:@"http://kata.slalomdemo.com:60577/UserMessageService.asmx/SubmitUserMessage"];
	//[NSString stringWithFormat:@"http://kata.slalomdemo.com:60577/UserMessageService.asmx/GetTagList"];
	NSURL *url = [NSURL URLWithString:urlString];
	NSString *authHeader = @"Basic d2VidXNlcjpQYXNzQHdvcmQh"; 
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
	[request setHTTPMethod:@"POST"]; 
	[request addValue:authHeader forHTTPHeaderField:@"Authorization"]; 
	[request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; 
	[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	
	NSMutableDictionary *jsonObject = [NSMutableDictionary dictionary];
	[jsonObject setObject:@"jimb" forKey:@"winUserId"];
	[jsonObject setObject:shout forKey:@"msg"];
	[jsonObject setObject:@"MOBILE" forKey:@"tags"];
	NSString *jsonString = jsonObject.JSONRepresentation;
	
	NSLog(jsonString);
	
	[request setHTTPBody: [jsonString dataUsingEncoding: NSASCIIStringEncoding]];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection release];
	[request release];
	/*[jsonObject release];
	 [urlString release];
	 [url release];
	 [authHeader release];
	 */
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(jsonString);
	NSDictionary *results = [jsonString JSONValue];
	/*NSNumber *val = [results objectForKey:@"d"];
	if([val intValue] == 1)
	{
		NSLog(@"are you registered?%@", [val stringValue]);
		errorLabel.text=@"";
		[window addSubview: [tabBarController view]];
	}
	else 
	{
		NSLog(@"test are you registered?%@", [val stringValue]);
		userNameField.text = @"";
		errorLabel.text = @"User does not exist!";
	}*/
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
