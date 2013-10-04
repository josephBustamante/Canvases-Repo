//
//  LoginViewController.h
//  Canvases
//
//  Created by Joseph Bustamante on 9/21/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

-(IBAction)resignAndLogin:(id)sender;




@end
