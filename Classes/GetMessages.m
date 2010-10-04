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
#import "Shout.h"

@implementation GetMessages

@synthesize responseData;

-(id)init
{
	responseData = [[NSMutableData data] retain];
	return self;
}

- (void)populateMessages
{
	NSString *urlString = 
	[NSString stringWithFormat:@"http://kata.slalomdemo.com:60577/UserMessageService.asmx/GetAllMessages"];
	
	NSURL *url = [NSURL URLWithString:urlString];
	NSString *authHeader = @"Basic d2VidXNlcjpQYXNzQHdvcmQh"; 
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
	[request setHTTPMethod:@"POST"]; 
	[request addValue:authHeader forHTTPHeaderField:@"Authorization"]; 
	[request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; 
	[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	
	//NSMutableDictionary *jsonObject = [NSMutableDictionary dictionary];	
	//NSString *userName = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] userName];
	//[jsonObject setObject:@"" forKey:@"winUserId"];
	//[jsonObject setObject:@"15" forKey:@"count"];
	//[jsonObject setObject:@"false" forKey:@"onlyRequestor"];
	//NSString *jsonString = jsonObject.JSONRepresentation;
	
	//NSLog(jsonString);
	
	//[request setHTTPBody: [jsonString dataUsingEncoding: NSASCIIStringEncoding]];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection release];
	[request release];
	//[userName release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	[responseData appendData: data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	NSLog(jsonString);
	/*
	 jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\\/" withString:@""];
	jsonString = [jsonString stringByReplacingOccurrencesOfString:@"Date(" withString:@""];
	jsonString = [jsonString stringByReplacingOccurrencesOfString:@")" withString:@""];
	NSLog(jsonString);
	 */
	SlalomShoutAppDelegate *delegate = (SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate];
	//delegate.messages = [[NSMutableArray alloc] initWithObjects:shout, nil];									
	NSMutableArray *messages = [(SlalomShoutAppDelegate *)[[UIApplication sharedApplication] delegate] messages];
	
	NSDictionary *results = [jsonString JSONValue];
	NSArray *val = [results objectForKey:@"d"];
	for(NSDictionary *d in val)
	{
		NSDictionary *user = [d objectForKey:@"CDUser"];
		NSString *userName = [user objectForKey:@"FirstName"];
		NSString *text = [d objectForKey:@"ShortText"];
		Shout *shout =[[Shout alloc] initWithUser:userName message:text];
		[messages addObject:shout];
		/*[text release];
		[userName release];
		[text release];
		[shout release];*/
	}
	//[val release];
	//[results release];
	//[jsonString release];
}
@end
