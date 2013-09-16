//
// TableDetailViewController.m
//  
//
//  Created by chris on 2011-06-16.
//  Programmers: Tony,Chris
//
//  Group 9 Apollo
//
//	TableView for single Prescriptions. Users my edit their prescription information 
//  From this table.
//
//
//  Changes:
//  
//  Bugs:
// 

#import "TableDetailViewController.h"
#import "Prescription.h"
#import "TableViewHelp.h"
#import "DosageEditView.h"
#import "StartdateEditView.h"
#import "NumberOfDaysEditView.h"
#import "EmailEditView.h"
#import "BrowserView.h"
#import "AddTableView.h"
#import "ImageCache.h"

@implementation TableDetailViewController
NSMutableArray *source;

@synthesize editingPrescription,helpViewController,photo,detailTableView;
@synthesize dosageEditViewController, startdateEditViewController, numberOfDaysEditViewController, emailEditViewController, browserViewController;

-(id)init {
	UIBarButtonItem *helpBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"Help" 
															style:UIBarButtonItemStyleBordered
															target:self 
															action:@selector(helpPressed)];

	[helpBarBtn setWidth:125.0];
	UIBarButtonItem *searchBarBtn = [[UIBarButtonItem alloc] 
									   initWithTitle:@"Info" 
									   style:  UIBarButtonItemStyleBordered
									   target:self 
									   action:@selector(searchPressed)];
	[searchBarBtn setWidth:125.0];
	
	//take the two buttons created above and put them on the navigation bar
	NSArray *tools=[[NSArray alloc] initWithObjects:helpBarBtn,searchBarBtn,nil];
	[self setToolbarItems:tools];
	[helpBarBtn release];
	[searchBarBtn release];
	
	return self;
}

-(void)searchPressed
{
	if(!browserViewController) {
		browserViewController = [[BrowserView alloc] init];
	}
	[browserViewController setEditPrescription:editingPrescription];
	[[self navigationController]pushViewController:browserViewController animated:NO];
}

//invoke TableHelpView Class. There is only one object instantiated and we pass it between the ViewControllers
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:10];	//help state for TableDetailView=4
	[[self navigationController]pushViewController:helpViewController animated:YES];
}

//To update changed fields in the table //
-(void)viewWillAppear:(BOOL)animated {

	[[self navigationItem]setTitle:[editingPrescription prescriptionName]];

	source = [[NSMutableArray alloc] init];
	
	//add Dosage
	[source addObject:[@"Dosage: " stringByAppendingString:[NSString stringWithFormat:@"%d", [editingPrescription dosage]]]];
	
	//add start date
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"MMM dd, yyyy"];
	NSString *startDateString = [dateFormatter stringFromDate:[editingPrescription startDate]];
	[source addObject:[@"Start Date: " stringByAppendingString:startDateString]];
	[dateFormatter dealloc];
	
	//add number of days
	[source addObject:[@"Number of Days: " stringByAppendingString:[NSString stringWithFormat:@"%d", [editingPrescription dosageDays]]]];

	//add frequency of dosage
//	[source addObject:[@"Frequency: " stringByAppendingString:[NSString stringWithFormat:@"%d", [[editingPrescription dosageTimes] count]]]];

	//add email address if exists
//	if (![[editingPrescription emailAddress] isEqualToString:@"No Caregiver"]) {
	[source addObject:[@"Email: " stringByAppendingString:[editingPrescription emailAddress]]];
//	}
	
	NSString *imageKey=[editingPrescription dosageKey];
	if (imageKey){
		UIImage *imageToDisplay=[[ImageCache sharedImageCache]imageForKey:imageKey];
		[photo setImage:imageToDisplay];
	}else {
		[photo setImage:nil];
	}

	[detailTableView reloadData];
	[detailTableView setScrollEnabled:NO];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


//needs to be done
-(void)tableView:(UITableView*)aTableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	if ([indexPath row] == 0) {
		if(!dosageEditViewController) {
			dosageEditViewController = [[DosageEditView alloc]init];
		}
		
		[dosageEditViewController setEditPrescription:editingPrescription];
		[[self navigationController]pushViewController:dosageEditViewController animated:NO];
	}/*
	else if ([indexPath row] == 1) {
		if(!startdateEditViewController) {
			startdateEditViewController = [[StartdateEditView alloc]init];
		}
		[startdateEditViewController setEditPrescription:editingPrescription];
		[[self navigationController]pushViewController:startdateEditViewController animated:NO];
	}
	else if ([indexPath row] == 2) {
		if(!numberOfDaysEditViewController) {
			numberOfDaysEditViewController = [[NumberOfDaysEditView alloc]init];
		}
		[numberOfDaysEditViewController setEditPrescription:editingPrescription];
		[[self navigationController]pushViewController:numberOfDaysEditViewController animated:NO];
	}
	else if ([indexPath row] == 3) {
		if(!emailEditViewController) {
			emailEditViewController = [[EmailEditView alloc]init];
		}
		[emailEditViewController setEditPrescription:editingPrescription];
		[[self navigationController]pushViewController:emailEditViewController animated:NO];
	}
	else {
		
		NSString *msg=[NSString stringWithFormat:@"%d" , [indexPath row]];
		
		UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];	
		[alert show];
		
		[alert release];
	}*/

}

//returns size of array so table knows how many rows to be. SHOULD BE THE NUMBER OF ITEMS IN PRESCRIPTION
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return [source count];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidLoad {

}

//delegate method to fill value in row.NEED TO FIGURE HOW TO GET PRESCRIPTION VALUES IN TABLE
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	
	if (cell==nil) {
		cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"]autorelease];}
	
	[[cell textLabel]setText:[source objectAtIndex:[indexPath row]]];
	if([indexPath row] > 0) {
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	}

	return cell;
}


- (void)dealloc {
    [super dealloc];
}


@end
