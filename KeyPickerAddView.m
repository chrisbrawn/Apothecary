//
//  KeyPickerAddView.m
//  TestTable
//
//  Created by chris on 11-06-10.
//  Edited by billy on 11-06-22.
//
//	Bugs:
//
//	11-06-22
//	- 'help' implementation

#import "KeyPickerAddView.h"
#import "Prescription.h"
#import "TableViewHelp.h"

#import "ScrollPickerAddView.h"	//Leo's class

@implementation KeyPickerAddView
@synthesize name,addPrescription,helpViewController;

//billy added:
@synthesize state, dosage, dosageArray, startDate, today;
@synthesize textBox, textField, dosagePicker, datePicker;
@synthesize leosView;


-(id)init{
	state = 0;	
	
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

//set up dosagePicker with dosageArray:

//number of columns on scroll
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)dosagePicker;{
	return 1;
}

//setting the number of items on scroll
- (NSInteger)pickerView:(UIPickerView *)dosagePicker numberOfRowsInComponent:(NSInteger)component;{
	return [dosageArray count];
}

//setting labels on scroll
- (NSString *)pickerView:(UIPickerView *)dosagePicker titleForRow:(NSInteger)row forComponent:(NSInteger)component;{
	return [dosageArray objectAtIndex:row];
}

//extracting output from scroll
- (void)pickerView:(UIPickerView *)dosagePicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	dosage = [[dosageArray objectAtIndex:row]intValue];	//the selected quantity is kept in 'dosage' as an integer
}


- (void)viewDidLoad{
	//set-up textBox:
	[textBox setText:@"Please enter the prescription name."]; //initial textbox context
	
	//set-up textField:
	[textField becomeFirstResponder];	//keyBoard appears automatically
	
	//set-up datePicker to date-only mode:
	[datePicker setDatePickerMode:UIDatePickerModeDate];
	
	//set-up dosageArray:
	dosageArray = [[NSMutableArray alloc] init];	//initialize dosageArray
	
	[dosageArray addObject:@" 1 "];		//adding choices onto array
	[dosageArray addObject:@" 2 "];
	[dosageArray addObject:@" 3 "];
	[dosageArray addObject:@" 4 "];
	[dosageArray addObject:@" 5 "];
	[dosageArray addObject:@" 6 "];
	[dosageArray addObject:@" 7 "];
	[dosageArray addObject:@" 8 "];
	[dosageArray addObject:@" 9 "];
	[dosageArray addObject:@" 10 "];
	[dosageArray addObject:@" 11 "];
	[dosageArray addObject:@" 12 "];
	
	[dosagePicker setHidden:YES];		//initially hide Dosage Picker
	[datePicker setHidden:YES];			//initially hide Date Picker
	
	[super viewDidLoad];
}


//===============================================================================

//when done button is pressed:

- (IBAction)dropKeyBoard{		//this method is linked to "DONE" button on keyboard
	if ([[textField text]length] == 0){
		name = @"No Name";
	}
	else {
		name = [textField text];
	}
	
	//add prescription name:
	[addPrescription setPrescriptionName:name];
	NSLog(@"key%@\n",[addPrescription prescriptionName]);
	
	//update interface to ask for dosage quantity:
	[textBox setText:@"Please choose the correct dosage below."]; //updates instructions in textBox
	[dosagePicker selectRow:0 inComponent:0 animated:NO];	//update dosage picker to return to first item
	dosage = 1;	//pre-set dosage value to value of first item incase user does not touch scroll
	[textField setHidden:YES];		//hide textField
	[dosagePicker setHidden:NO];	//show dosagePicker
}

//===============================================================================
//===============================================================================


-(void)continuePressed
{
	if (state == 0){
		//add dosage:
		[addPrescription setDosage:dosage];
		NSLog(@"key%i",[addPrescription dosage]);
		
		//update interface to ask for starting date:
		[textBox setText:@"Please choose the correct starting date below."]; //updates textbox content
		today = [NSDate date];
		[datePicker setDate:today animated:YES];	//update date picker to today's date
		[dosagePicker setHidden:YES];	//hide dosage picker
		[datePicker setHidden:NO];		//show date picker
		state++;
	}
	
	//will invoke next UIViewController
	else if (state == 1){
		//restore view for future use:
		state = 0;
		[textField setText:nil];
		[textBox setText:@"Please enter the prescription name."];	//update text box context
		[textField setHidden:NO];			//show text field for keyboard
		[dosagePicker setHidden:YES];		//hide dosage picker
		[datePicker setHidden:YES];			//hide date picker
		[textField becomeFirstResponder];	//keyboard automatically appears
		
		//add prescription starting date:
		startDate = [datePicker date];
		[addPrescription setStartDate:startDate];
		NSLog(@"key%@\n",[addPrescription startDate]);
		
		//go to Leo's class here
		if(!leosView)
		{
			leosView = [[ScrollPickerAddView alloc]init];
		}
		
		[leosView setAddPrescription:addPrescription];
		[[self navigationController]pushViewController:leosView animated:NO];
	}
	
	
}

	
//invokes help screen
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:state+3];	//help state:
	//dosage = 0+3
	//start date = 1+3
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
	[name release];
	[startDate release];
	[textBox release];
	[textField release];
	[dosagePicker release];
	[datePicker release];
	[dosageArray release];
	[startDate release];
	[leosView release];
    [super dealloc];
}


@end
