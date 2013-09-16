//  
//  EmailAddView.m
//  
//  Created by Chris on 2011-06-09.
//  Programmers: Chris, Joyce
//  
//  Group 9 Apollo
//  
//  Changes:
//  2011-06-25 added help button and yesPressed method
//  2011-06-25 "No caregiver" will be stored when no button is pressed
//  
//  Bugs:
//  
//  

/*
 Will ask if the user want to have a caregiver when the prescription is expired.
 If Yes, the e-mail address of the caregiver will be asked.
 If No, no e-mails will be sent if the user forget to take the medication.
 */

#import "EmailAddView.h"
#import "GlobalArray.h"
#import "EmailPickerAddView.h"
#import "Prescription.h"
#import "TableViewHelp.h"

@implementation EmailAddView
@synthesize emailAddress;
@synthesize emailAddController,addPrescription,helpViewController;

// creates buttons in the bottom navigation bar
-(id)init{
	
	[[self navigationItem] setTitle:@"Email Notification"];
	[[self navigationItem] setHidesBackButton:YES animated:NO]; // hides back button
	
	UIBarButtonItem *helpBarBtn = [[UIBarButtonItem alloc] 
								   initWithTitle:@"Help"
								   style:  UIBarButtonItemStyleBordered
								   target:self 
								   action:@selector(helpPressed)];
	[helpBarBtn setWidth:125.0];
	
	UIBarButtonItem *yesBarBtn = [[UIBarButtonItem alloc] 
									   initWithTitle:@"Yes" 
									   style:  UIBarButtonItemStyleBordered
									   target:self 
									   action:@selector(yesPressed)];
	[yesBarBtn setWidth:80.0];
	
	UIBarButtonItem *noBarBtn = [[UIBarButtonItem alloc] 
								 initWithTitle:@"No" 
								 style:  UIBarButtonItemStyleBordered
								 target:self 
								 action:@selector(noPressed)];
	[noBarBtn setWidth:80.0];
	
	// take the two buttons created above and put them on the navigation bar
	NSArray *tools=[[NSArray alloc] initWithObjects:helpBarBtn,yesBarBtn,noBarBtn,nil];
	[self setToolbarItems:tools];
	[helpBarBtn release];
	[yesBarBtn release];
	[noBarBtn release];
	
	return self;
}

// when yes button is pressed
-(void)yesPressed{
	
	// brings the user to another screen for inputting the e-mail address of the caregiver
	if(!emailAddController) {
		emailAddController	= [[EmailPickerAddView alloc]init];
	}
	
	[emailAddController setAddPrescription:addPrescription];
	[[self navigationController]pushViewController:emailAddController animated:YES];

}

// when no button is pressed
-(void)noPressed{
	
	// "No Caregiver" will be saved
	emailAddress = @"No Caregiver";
	[addPrescription setEmailAddress:emailAddress];
	NSLog(@"key%@\n",[addPrescription emailAddress]);
	
	// then it is returned to the main screen of the app
	GlobalArray *newArray=[GlobalArray sharedArray];
	[newArray addObject:addPrescription];

	[[self navigationController]popToRootViewControllerAnimated:YES];
	
}


// invoke TableHelpView Class. There is only one object instantiated and we pass it between the ViewControllers
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:8];	// help state for email = 8
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
	[addPrescription release];
	[helpViewController release];
    [super dealloc];
}

@end
