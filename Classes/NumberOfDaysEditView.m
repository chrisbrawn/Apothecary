//
//  NumberOfDaysEditView.m
//  Apothecary
//
//
//  Created by Tony on 2011-07-03.
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
#import "NumberOfDaysEditView.h"
#import "Prescription.h"
#import "TableViewHelp.h"


@implementation NumberOfDaysEditView
@synthesize editPrescription, helpViewController;
@synthesize numberOfDays, numberOfDaysArray;
@synthesize textBox, numberOfDaysPicker;


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


//number of columns on scroll
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)numberOfDaysPicker;{
	return 1;
}

//setting the number of items on scroll
- (NSInteger)pickerView:(UIPickerView *)numberOfDaysPicker numberOfRowsInComponent:(NSInteger)component;{
	return [numberOfDaysArray count];
}

//setting labels on scroll
- (NSString *)pickerView:(UIPickerView *)numberOfDaysPicker titleForRow:(NSInteger)row forComponent:(NSInteger)component;{
	return [numberOfDaysArray objectAtIndex:row];
}

//extracting output from scroll
- (void)pickerView:(UIPickerView *)numberOfDaysPicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	numberOfDays = [[numberOfDaysArray objectAtIndex:row]intValue];
}


-(void)viewWillAppear:(BOOL)animated {
	[[self navigationItem] setTitle: [editPrescription prescriptionName]];
	//set-up textBox:
	NSInteger currentNumberOfDays = (NSInteger) [editPrescription dosageDays];
	[textBox setText: [@"Please enter the correct number of days.\nCurrent number of days is " stringByAppendingFormat:@"%d", currentNumberOfDays]]; //initial textbox context
	[textBox setEditable:NO];

	//set-up dosageArray:
	numberOfDaysArray = [[NSMutableArray alloc] init];
	
	for (int i=1; i<=30; i++){
		[numberOfDaysArray addObject:[NSString stringWithFormat:@"%d", i]];
	}
	
	numberOfDays = currentNumberOfDays;
	[numberOfDaysPicker reloadAllComponents];
	[numberOfDaysPicker selectRow:currentNumberOfDays - 1 inComponent:0 animated:YES];

	[textBox reloadInputViews];
}

-(void)continuePressed
{
	[editPrescription setDosageDays:numberOfDays];
	[[self navigationController]popViewControllerAnimated:YES];

}


//invokes help screen
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:5];	//help state for numOfDays = 5
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
	[numberOfDaysPicker release];
	[numberOfDaysArray release];
    [super dealloc];
}


@end
