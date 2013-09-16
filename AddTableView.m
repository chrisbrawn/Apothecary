//
// AddTableView.h
//  
//
//  Created by chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  Master TableView. The main screen of our app. controls table view and invokes all other screens 
//  in program.
//
//
//  Changes:
//  
//  Bugs:
// 
//  needs to delete notifications if prescription deleted

#import "AddTableView.h"
#import "Prescription.h"
#import "ItemDetailViewController.h"
#import "TableViewHelp.h"
#import "CameraAddView.h"
#import "Prescription.h"
#import "GlobalArray.h"

@implementation AddTableView
@synthesize mainTableView;
@synthesize addPrescription;


-(id)init
{
	//set up Nav bar//
	UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] 
								   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
								   target:self 
								   action:@selector(btnPressed)];
	
	[[self navigationItem] setRightBarButtonItem:[self editButtonItem]];
	[[self navigationItem] setLeftBarButtonItem:leftBarBtn];
	[[self navigationItem]setTitle:@"Prescriptions"];
	
	UIBarButtonItem *helpBarBtn = [[UIBarButtonItem alloc]
								   initWithTitle:@"Help" 
								   style:UIBarButtonItemStyleBordered
								   target:self 
								   action:@selector(helpPressed)];
	[helpBarBtn setWidth:125.0];
	
	NSArray *tools=[[NSArray alloc] initWithObjects:helpBarBtn,nil];
	[self setToolbarItems:tools];
	[leftBarBtn release];
	[helpBarBtn release];
	
	return self;
}

//gets called by editButtonItem and enters table edit mode //
- (void)setEditing:(BOOL)editing animated:(BOOL)animate
{
	
	[super setEditing:editing animated:animate];
    if(editing)
    {
        NSLog(@"editMode on");
		[mainTableView setEditing:YES animated:YES];

    }
    else
    {
        NSLog(@"Done leave editmode");
		[mainTableView setEditing:NO animated:YES];

    }
/*	if([mainTableView isEditing]){
		[mainTableView setEditing:NO animated:YES];

	}
	else 
	{
				[mainTableView setEditing:YES animated:YES];
	
			}	*/
}



//when add button pressed goto CameraViewController
-(void)btnPressed
{
	if(!cameraViewController){
		cameraViewController=[[CameraAddView alloc]init];
		
	}
	//push help view on nav controller
//	if(!addPrescription){
//		addPrescription=[[SingletonPrescription alloc]init];
//	}
	Prescription *newPrescription=[[Prescription alloc]init];
		[cameraViewController setAddPrescription:newPrescription];
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
		
	}
	[cameraViewController setHelpViewController:helpViewController];
	
	[[self navigationController]pushViewController:cameraViewController animated:YES];
	
}



//To invoke a help screen on table View
-(void)helpPressed
{
	//if we don't have an object make one
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
		
	}
	[helpViewController setStateValue:0]; //O is the help state for tableview
	//push help view on nav controller
	[[self navigationController]pushViewController:helpViewController animated:YES];

}


//To update changed fields in the table //
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[mainTableView reloadData];
}

-(void)tableView:(UITableView*)aTableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	if(!detailViewController){
		detailViewController=[[ItemDetailViewController alloc]init];
	}
	//sends the prescription object to detailViewController to setEditingPrescription//
	GlobalArray *newArray=[GlobalArray sharedArray];
	[detailViewController setEditingPrescriptions:[newArray objectAtIndex:[indexPath row]]];
	[[self navigationController]pushViewController:detailViewController animated:YES];
}




//allows deletion of cell//
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath*)indexPath
{
	if (editingStyle==UITableViewCellEditingStyleDelete){
		GlobalArray *newArray=[GlobalArray sharedArray];
		Prescription *removeNotif=[newArray objectAtIndex:[indexPath row]];
		
				
		//The command to delete the notifications, theNotification is the object held in our array notificationTickets
		
		NSMutableArray *tempLoc=[removeNotif notificationTickets];
		NSLog(@"Notification tickets before: %@",tempLoc);
		//check for notif
		for (int i=0; i<[tempLoc count]; i++) {
			UILocalNotification *tempbot=[tempLoc objectAtIndex:i];
			NSLog(@"Notification tickets before: %@",tempbot);
		}
		
		for (int i=0; i<[tempLoc count]; i++) {
			UILocalNotification	*deleteNotif=[tempLoc objectAtIndex:i];
			[[UIApplication sharedApplication] cancelLocalNotification:deleteNotif];
		}
		while ([tempLoc count]>0) {
			[tempLoc removeLastObject];
		}
		
				
		[removeNotif setNotificationTickets:tempLoc];
		
		NSLog(@"%@",tempLoc);
		
				
		
		[newArray removeObjectAtIndex:[indexPath row]];

		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
						 withRowAnimation:UITableViewRowAnimationFade];
	}
}
//allows movement of cells//
-(void)tableView:(UITableView*)tableView moveRowAtIndexPath:(NSIndexPath*)fromIndexPath toIndexPath:(NSIndexPath*)toIndexPath
{
	GlobalArray *newArray=[GlobalArray sharedArray];
	Prescription *p=[newArray objectAtIndex:[fromIndexPath row]];
	[p retain];
	[newArray removeObjectAtIndex:[fromIndexPath row]];
	[newArray insertObject:p atIndex:[toIndexPath row]];
	[p release];
}


//returns size of array so table knows how many rows to be.
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	GlobalArray *newArray=[GlobalArray sharedArray];
	return [newArray arrayCount];
}

//delegate method to fill value in row
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	
	if (!cell) {
		cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1
									reuseIdentifier:@"UITableViewCell"]autorelease];}
	GlobalArray *newArray=[GlobalArray sharedArray];
	Prescription *p=[newArray objectAtIndex:[indexPath row]];
	
	//If the prescription is expired make table entry red//
	NSDate *d=[NSDate dateWithTimeInterval:(86400*[p dosageDays])sinceDate:[p startDate]]; //add dosageDays to startDate
	// NSLog(@"start date %@\n",[p startDate]);
	// NSLog(@"Start+1 %@\n",d);
	NSComparisonResult result=[d compare:[NSDate date]]; //is the date in the past?
	
	//if so make text red else black//
	if(result==NSOrderedAscending){
	[cell.textLabel setTextColor:[UIColor redColor]];
	}
	else {
		[cell.textLabel setTextColor:[UIColor blackColor]];
	}
	NSString *labelName=[NSString stringWithFormat:@"%@",[p description]];
	NSString *detailName=[NSString stringWithFormat:@"Dosage: %d",[p dosage]];
	
	cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
	cell.detailTextLabel.textColor=[UIColor blackColor];
	cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];

	[[cell textLabel]setText:labelName];
	[[cell detailTextLabel]setText:detailName];
	return cell;
}




- (void)viewDidLoad {
	
    [super viewDidLoad];
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
	    [super dealloc];
}


@end
