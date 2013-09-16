//
// DosageEditView.m
//
//
//  Created by Tony on 2011-06-29.
//  Programmers: Tony
//
//  Group 9 Apollo
//
//  Editing dosage level of prescription.
//
//
//  Changes:
//  
//  Bugs:
//  Seems to be too many notification tickets.

#import "DosageEditView.h"
#import "Prescription.h"
#import "TableViewHelp.h"


@implementation DosageEditView
@synthesize editPrescription, helpViewController;
@synthesize dosage, dosageArray;
@synthesize textBox, dosagePicker;


-(id)init{
	
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


-(void)viewWillAppear:(BOOL)animated {
	[[self navigationItem] setTitle: [editPrescription prescriptionName]];
	//set-up textBox:
	NSInteger currentDosage = [editPrescription dosage];
	[textBox setText: [@"Please enter the correct dosage level.\nCurrent dosage level is " stringByAppendingFormat:@"%d", currentDosage]]; //initial textbox context
	[textBox setEditable:NO];
	
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


	dosage = currentDosage;
	[dosagePicker selectRow:currentDosage - 1 inComponent:0 animated:YES];
	[dosagePicker reloadAllComponents];		//initially hide Dosage Picker
	[textBox reloadInputViews];
	
		
}

-(void)continuePressed
{
		[editPrescription setDosage:dosage];
		[[self navigationController]popViewControllerAnimated:YES];
}


//invokes help screen
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:3];	//help state for dosage = 3
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
	[dosagePicker release];
	[dosageArray release];
    [super dealloc];
}


@end
