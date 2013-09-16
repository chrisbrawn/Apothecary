//
//  StartdateEditView.m
//  Apothecary
//
//
//  Created by Tony on 2011-07-03.
//  Programmers: Tony
//
//  Group 9 Apollo
//
//  Editing start date of prescription.
//
//
//  Changes:
//  
//  Bugs:
// 
#import "StartdateEditView.h"
#import "Prescription.h"
#import "TableViewHelp.h"


@implementation StartdateEditView
@synthesize editPrescription, helpViewController;
@synthesize startDate;
@synthesize textBox, datePicker;


-(id)init{
	
	[[self navigationItem] setTitle: [editPrescription prescriptionName]];
	[[self navigationItem] setHidesBackButton:YES animated:NO];

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


-(void)viewWillAppear:(BOOL)animated {
	[[self navigationItem] setTitle: [editPrescription prescriptionName]];
	//set-up textBox:
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	NSDate *originalDate = [editPrescription startDate];
	[dateFormatter setDateFormat:@"MMM dd, yyyy"];
	NSString *startDateString = [dateFormatter stringFromDate:originalDate];
	[textBox setText: [@"Please enter the correct start date.\nCurrent start date is " stringByAppendingString:startDateString]]; //initial textbox context
	[textBox setEditable:NO];

	startDate = originalDate;
	
	[datePicker setDatePickerMode:UIDatePickerModeDate];
	[datePicker setDate:originalDate animated:YES];
	[textBox reloadInputViews];
}

-(void)continuePressed
{
	startDate = [datePicker date];
	[editPrescription setStartDate:startDate];
	[[self navigationController]popViewControllerAnimated:YES];
}


//invokes help screen
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:4];	//help state for start date = 4
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
	[textBox release];
	[datePicker release];
	[startDate release];
    [super dealloc];
}


@end
