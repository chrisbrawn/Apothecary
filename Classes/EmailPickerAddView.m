//  
//  EmailPickerAddView.m
//  
//  Created by Joyce on 2011-06-24.
//  Programmers: Joyce
//  
//  Group 9 Apollo
//  
//  Changes:
//  2011-06-25 edited dropKeyBoard method
//  2011-06-25 "No caregiver" will be saved if nothing is typed in the text field
//  2011-07-07 An e-mail will be generated and sent to the caregiver
//  2011-07-10 Changed help state
//  
//  Bugs:
//  2011-06-24 No reaction after pressing "Done"
//  

/*
 The e-mail address of a caregiver will be asked for input from the user.
 */

#import "EmailPickerAddView.h"
#import "GlobalArray.h"
#import "Prescription.h"
#import "TableViewHelp.h"

@implementation EmailPickerAddView
@synthesize emailAddress,addPrescription,helpViewController;
@synthesize textField;


// creates buttons in the bottom navigation bar
-(id)init {
	
	[[self navigationItem] setTitle:@"Name Prescription"];
	[[self navigationItem] setHidesBackButton:YES animated:NO]; //hides back button
	
	UIBarButtonItem *helpBarBtn = [[UIBarButtonItem alloc] 
								   initWithTitle:@"Help"
								   style:  UIBarButtonItemStyleBordered
								   target:self 
								   action:@selector(helpPressed)];
	[helpBarBtn setWidth:125.0];
	
	UIBarButtonItem *continueBarBtn = [[UIBarButtonItem alloc] 
									   initWithTitle:@"Continue" 
									   style:  UIBarButtonItemStyleBordered
									   target:self 
									   action:@selector(continuePressed)];
	[continueBarBtn setWidth:125.0];
	
	//take the two buttons created above and put them on the navigation bar
	NSArray *tools=[[NSArray alloc] initWithObjects:helpBarBtn,continueBarBtn,nil];
	[self setToolbarItems:tools];
	[helpBarBtn release];
	[continueBarBtn release];
	
	return self;
}


- (void)viewDidLoad {
	
	// set-up textField:
	[textField becomeFirstResponder];	// keyBoard appears automatically
	
	[super viewDidLoad];
}


// when done button on the keyboard is pressed, save e-mail address of caregiver
- (IBAction)dropKeyBoard {		// this method is linked to "DONE" button on keyboard
	
	// if the text field is empty
	if ([[textField text]length] == 0){
		emailAddress = @"No Caregiver";
		[addPrescription setEmailAddress:emailAddress];
		NSLog(@"key%@\n",[addPrescription emailAddress]);
		
		// back to the main window
		GlobalArray *newArray=[GlobalArray sharedArray];
		[newArray addObject:addPrescription];
		[[self navigationController]popToRootViewControllerAnimated:YES];
	}
	
	// if the text field is not empty
	else {
		emailAddress = [textField text];
	
		[addPrescription setEmailAddress:emailAddress];
		NSLog(@"key%@\n",[addPrescription emailAddress]);
		
		// compose an e-mail to the caregiver
		MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
		mailComposer.mailComposeDelegate = self;
	
		if ([MFMailComposeViewController canSendMail]) {
			[mailComposer setToRecipients:[NSArray arrayWithObjects:emailAddress, nil]];
			[mailComposer setSubject:[@"[Apothecary] New Prescription: " stringByAppendingString:[addPrescription prescriptionName]]];
			[mailComposer setMessageBody:[addPrescription emailMessage] isHTML:NO];
		
			[self presentModalViewController:mailComposer animated:YES];
		}
	}
}


// when continue button is pressed, save e-mail address of caregiver
-(void)continuePressed {
	
	// if the text field is empty
	if ([[textField text]length] == 0){
		emailAddress = @"No Caregiver";
		[addPrescription setEmailAddress:emailAddress];
		NSLog(@"key%@\n",[addPrescription emailAddress]);
		
		// back to the main window
		GlobalArray *newArray=[GlobalArray sharedArray];
		[newArray addObject:addPrescription];
		[[self navigationController]popToRootViewControllerAnimated:YES];
	}
	
	// if the text field is not empty
	else {
		emailAddress = [textField text];
	
		[addPrescription setEmailAddress:emailAddress];
		NSLog(@"key%@\n",[addPrescription emailAddress]);
	
	
		// compose an e-mail to the caregiver
		MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
		mailComposer.mailComposeDelegate = self;
	
		if ([MFMailComposeViewController canSendMail]) {
			[mailComposer setToRecipients:[NSArray arrayWithObjects:emailAddress, nil]];
			[mailComposer setSubject:[@"[Apothecary] New Prescription: " stringByAppendingString:[addPrescription prescriptionName]]];
			[mailComposer setMessageBody:[addPrescription emailMessage] isHTML:NO];
		
			[self presentModalViewController:mailComposer animated:YES];
		}
	}
}


// invokes help screen
-(void)helpPressed {
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:8];	// help state for e-mailing caregiver = 8
	[[self navigationController]pushViewController:helpViewController animated:YES];
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	
	//[self dismissModalViewControllerAnimated:YES];
	
	if (result == MFMailComposeResultSent) {
		NSLog(@"E-mail is sent successfully.");
	}
	
	if (result == MFMailComposeResultFailed) {
		
		NSLog(@"E-mail has failed to send.");
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Sorry, we were unable to send the e-mail" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	[self dismissModalViewControllerAnimated:YES];
	
	GlobalArray *newArray=[GlobalArray sharedArray];
	[newArray addObject:addPrescription];
	[[self navigationController]popToRootViewControllerAnimated:YES];
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[addPrescription release];
	[helpViewController release];
	[emailAddress release];
	[textField release];
    [super dealloc];
}


@end
