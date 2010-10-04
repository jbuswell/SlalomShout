    //
//  CreateChoutController.m
//  SlalomShout
//
//  Created by Jim Buswell on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CreateShoutController.h"
#import "JSON/JSON.h"

@implementation CreateShoutController

@synthesize textField;
@synthesize label;

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction) shout:(id)sender {
	NSLog(@"Hello World %@", textField.text);
	
	NSString *urlString = 
	[NSString stringWithFormat:@"http://kata.slalomdemo.com:60577/UserMessageService.asmx/SubmitUserMessage"];
	NSURL *url = [NSURL URLWithString:urlString];
	NSString *authHeader = @"Basic d2VidXNlcjpQYXNzQHdvcmQh"; 
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
	[request setHTTPMethod:@"POST"]; 
	[request addValue:authHeader forHTTPHeaderField:@"Authorization"]; 
	[request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; 
	[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	
	NSMutableDictionary *jsonObject = [NSMutableDictionary dictionary];
	[jsonObject setObject:@"jimb" forKey:@"winUserId"];
	[jsonObject setObject:textField.text forKey:@"msg"];
	[jsonObject setObject:@"MOBILE" forKey:@"tags"];
	NSString *jsonString = jsonObject.JSONRepresentation;
	
	NSLog(jsonString);
	
	[request setHTTPBody: [jsonString dataUsingEncoding: NSASCIIStringEncoding]];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection release];
	[request release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(jsonString);
	NSDictionary *results = [jsonString JSONValue];
	label.text = @"Shout saved.";
	[textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)dealloc {
    [super dealloc];
}


@end
