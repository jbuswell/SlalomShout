//
//  GetMessages.m
//  SlalomShout
//
//  Created by Jim Buswell on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GetMessages.h"
#import "SlalomShoutAppDelegate.h"
#import "JSON/JSON.h"

@implementation GetMessages
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(jsonString);
	//NSDictionary *results = [jsonString JSONValue];
	//NSNumber *val = [results objectForKey:@"d"];
	
}
- (void)populateMessages
{
	NSString *urlString = 
	[NSString stringWithFormat:@"http://kata.slalomdemo.com:60577/UserMessageService.asmx/GetMessages"];
	
	NSURL *url = [NSURL URLWithString:urlString];
	NSString *authHeader = @"Basic d2VidXNlcjpQYXNzQHdvcmQh"; 
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
	[request setHTTPMethod:@"POST"]; 
	[request addValue:authHeader forHTTPHeaderField:@"Authorization"]; 
	[request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; 
	[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	
	NSMutableDictionary *jsonObject = [NSMutableDictionary dictionary];	
	NSString *userName = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] userName];
	[jsonObject setObject:userName forKey:@"winUserId"];
	//[jsonObject setObject:@"15" forKey:@"count"];
	//[jsonObject setObject:@"false" forKey:@"onlyRequestor"];
	NSString *jsonString = jsonObject.JSONRepresentation;
	
	NSLog(jsonString);
	
	[request setHTTPBody: [jsonString dataUsingEncoding: NSASCIIStringEncoding]];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection release];
	[request release];
	[userName release];
}
@end
