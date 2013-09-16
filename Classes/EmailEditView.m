//
//  EmailEditView.m
//  Apothecary
//
//
//  Created by Tony on 2011-07-05.
//  Programmers: Tony
//
//  Group 9 Apollo
//
//  Editing number of days of prescription.
//
//
//  Changes:
//  
//  Bugs:
//

#import "EmailEditView.h"
#import "Prescription.h"
#import "TableViewHelp.h"


@implementation EmailEditView

@synthesize emailAddress,editPrescription,helpViewController;
@synthesize textField, textBox;


// creates buttons in the bottom navigation bar
-(id)init {
	
	[[self navigationItem] setTitle: [editPrescription prescriptionName]];
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
	[[self navigationItem] setTitle: [editPrescription prescriptionName]];
	//set-up textBox:
	[textBox setText: [@"Please enter the e-mail address of your caregiver.\nCurrent caregiver is\n" stringByAppendingString:[editPrescription emailAddress]]]; //initial textbox context
	[textBox setEditable:NO];

	emailAddress = [editPrescription emailAddress];
	// set-up textField:
	[textField becomeFirstResponder];	// keyBoard appears automatically
	
	[super viewDidLoad];
}


// when done button on the keyboard is pressed
- (IBAction)dropKeyBoard {		// this method is linked to "DONE" button on keyboard
	
	// save e-mail address of caregiver	
	if ([[textField text]length] == 0){
		emailAddress = @"No Caregiver";
	}
	
	else {
		emailAddress = [textField text];
	}
	[editPrescription setEmailAddress:emailAddress];
	[[self navigationController]popViewControllerAnimated:YES];
}


// when continue button is pressed
-(void)continuePressed {
		
	// save e-mail address of caregiver	
	if ([[textField text]length] == 0){
		emailAddress = @"No Caregiver";
	}
	
	else {
		emailAddress = [textField text];
	}
	[editPrescription setEmailAddress:emailAddress];
	[[self navigationController]popViewControllerAnimated:YES];
}


// invokes help screen
-(void)helpPressed {
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:2];	// help state for keyboard = 2
	[[self navigationController]pushViewController:helpViewController animated:YES];
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
	[editPrescription release];
	[helpViewController release];
	[emailAddress release];
	[textField release];
    [super dealloc];
}


@end
