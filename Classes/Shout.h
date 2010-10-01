//
//  Shout.h
//  SlalomShout
//
//  Created by Jim Buswell on 9/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Shout : NSObject <UIApplicationDelegate> {
	IBOutlet UITextField *textField;
	NSString *shout;
}

@property(nonatomic, retain) IBOutlet UITextField *textField;
@property(nonatomic, retain) NSString *shout;


- (IBAction)shout:(id)sender;

@end
