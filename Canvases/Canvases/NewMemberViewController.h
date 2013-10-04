//
//  NewMemberViewController.h
//  Canvases
//
//  Created by Joseph Bustamante on 9/28/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMemberViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UITextField *nameTF;

@property (strong, nonatomic) IBOutlet UITextField *ageTF;

@property (strong, nonatomic) IBOutlet UITextField *usernameTF;

@property (strong, nonatomic) IBOutlet UITextField *passwordTF;

- (IBAction)alreadyMember:(id)sender;
- (IBAction)checkAndLogin:(id)sender;


@end
