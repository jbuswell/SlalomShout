//
//  SlalomShoutAppDelegate.h
//  SlalomShout
//
//  Created by Jim Buswell on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Login.h"

@interface SlalomShoutAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
	IBOutlet UITabBarController *tabBarController;
	IBOutlet UITextField *userNameField;
	IBOutlet UILabel *userNameLabel;
	IBOutlet UILabel *errorLabel;
	NSMutableData *responseData;
	NSString *userName;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UITextField *userNameField;
@property (nonatomic, retain) IBOutlet UILabel *userNameLabel;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) IBOutlet UILabel *errorLabel;
- (IBAction)login:(id)sender; 

@end

