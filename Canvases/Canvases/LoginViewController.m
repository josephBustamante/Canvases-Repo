//
//  LoginViewController.m
//  Canvases
//
//  Created by Joseph Bustamante on 9/21/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import "LoginViewController.h"
#import "CoreDataHelper.h"

@implementation LoginViewController

//  Synthesize accessors
@synthesize managedObjectContext, usernameField, passwordField;

//  When we are done editing on the keyboard
- (IBAction)resignAndLogin:(id)sender
{
    //  Get a reference to the text field on which the done button was pressed
    UITextField *tf = (UITextField *)sender;
    
    //  Check the tag. If this is the username field, then jump to the password field automatically
    if (tf.tag == 1) {
        
        [passwordField becomeFirstResponder];
        
        //  Otherwise we pressed done on the password field, and want to attempt login
    } else {
        
        //  First put away the keyboard
        [sender resignFirstResponder];
        
        //  Set up a predicate (or search criteria) for checking the username and password
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(username == %@ && password == %@)", [usernameField text], [passwordField text]];
        
        //  Actually run the query in Core Data and return the count of found users with these details
        //  Obviously if it found ANY then we got the username and password right!
        if ([CoreDataHelper countForEntity:@"Users" withPredicate:pred andContext:managedObjectContext] > 0)
            
            //  We found a matching login user!  Force the segue transition to the next view
            [self performSegueWithIdentifier:@"LoginSegue" sender:sender];
        
        else
            
            //  We didn't find any matching login users. Wipe the password field to re-enter
            [passwordField setText:@""];
    }
}



//  When the view reappears after logout we want to wipe the username and password fields
- (void)viewWillAppear:(BOOL)animated
{
    [usernameField setText:@""];
    [passwordField setText:@""];
}

@end