//
//  NewMemberViewController.m
//  Canvases
//
//  Created by Joseph Bustamante on 9/28/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import "NewMemberViewController.h"
#import "CoreDataHelper.h"
#import "Users.h"

@interface NewMemberViewController ()

@end

@implementation NewMemberViewController

@synthesize usernameTF, ageTF, passwordTF, nameTF, managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//If the user is already a member simply dismiss the VC
- (IBAction)alreadyMember:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//When done editing keyboard
- (IBAction)checkAndLogin:(id)sender {

    NewMemberViewController *appDelegate = (NewMemberViewController*)[[UIApplication sharedApplication]delegate];
    managedObjectContext = [appDelegate managedObjectContext];
    
    //Textfield Reference
    UITextField *tf = (UITextField *)sender;
    
    //Check tag numbers If its equal to 1 or 2(nameTF or ageTF) then
    if (tf.tag==1||tf.tag==2)
    {
        [sender resignFirstResponder];
        NSLog(@"This is working");
    }
    //If its equal to 3 then this means the username text field is active
    else if (tf.tag == 3)
    {
        [sender resignFirstResponder];
        //do a quick search to see if username is availible
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(username == %@)", [usernameTF text]];        
        NewMemberViewController *appDelegate = (NewMemberViewController*)[[UIApplication sharedApplication]delegate];
        managedObjectContext = [appDelegate managedObjectContext];
        
        //Run the query to check if user exists
        if([CoreDataHelper countForEntity:@"Users" withPredicate:pred andContext:managedObjectContext] > 0)
        {
            //we found a user            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Sorry but that username is taken... Please try another one!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            [usernameTF setText:@""];
        }
        //If we don't find a user then they can input a password and become a user
        else
        {
            [passwordTF becomeFirstResponder];
        }
    }
    else
    {
        //Add the new user!
        Users *user = (Users *)[NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:managedObjectContext];
        [user setUsername:usernameTF.text];
        [user setPassword:passwordTF.text];
        
        //Commit to core data
        NSError *error;
        if (![managedObjectContext save:&error])
            NSLog(@"Failed to add user! with error: %@",[error domain]);
        
        
    }
}
@end
