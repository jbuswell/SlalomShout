//
//  SendShoutController.h
//  SlalomShout
//
//  Created by Jim Buswell on 10/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewShoutsController : UITableViewController {
	NSMutableArray *messages;	
}

@property(nonatomic, retain) NSMutableArray *messages;

@end
