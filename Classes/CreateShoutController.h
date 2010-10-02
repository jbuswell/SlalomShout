//
//  CreateChoutController.h
//  SlalomShout
//
//  Created by Jim Buswell on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreateShoutController : UIViewController {
	
	IBOutlet UITextField *textField;
	IBOutlet UILabel *label;
}

@property(nonatomic, retain) IBOutlet UITextField *textField;
@property(nonatomic, retain) IBOutlet UILabel *label;

- (IBAction)shout:(id)sender;

@end
