//
//  GetMessages.h
//  SlalomShout
//
//  Created by Jim Buswell on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GetMessages : NSObject {
	NSMutableData *responseData;
}

@property(nonatomic, retain) NSMutableData *responseData;

- (void)populateMessages;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data ;

@end
