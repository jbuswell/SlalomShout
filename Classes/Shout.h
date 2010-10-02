//
//  Shout.h
//  SlalomShout
//
//  Created by Jim Buswell on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Shout : NSObject {
	NSString *message;
	NSString *user;
}

@property(nonatomic, retain) NSString *message;
@property(nonatomic, retain) NSString *user;

@end
