//
//  Shout.m
//  SlalomShout
//
//  Created by Jim Buswell on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Shout.h"


@implementation Shout

@synthesize user;
@synthesize message;

-(id)initWithUser: (NSString *)usr message:(NSString *) msg {
	self.user = usr;
	self.message = msg;
	return self;
}

@end
