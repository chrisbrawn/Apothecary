//
// ItemDetailViewController.m
//  
//
//  Created by Chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  Shows picture of prescription packaging and dosage information. 
//  If user continues, will have ability to see and edit prescription information.
//
//
//  Changes:
//  
//  Bugs:
// 

#import "ItemDetailViewController.h"
#import "Prescription.h"
#import "ImageCache.h"
#import "TableDetailViewController.h"
#import	"TableViewHelp.h"

@implementation ItemDetailViewController
@synthesize editingPrescriptions,helpViewController;


-(id)init
{
	//put camera icon in topbar to take pictures//
	[super initWithNibName:@"ItemDetailViewController" bundle:nil];
	UIBarButtonItem *helpBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:  UIBarButtonItemStyleBordered
																  target:self action:@selector(helpPressed)];
	[helpBarBtn setWidth:125.0];
	UIBarButtonItem *continueBarBtn = [[UIBarButtonItem alloc] 
									   initWithTitle:@"Continue" 
									   style:  UIBarButtonItemStyleBordered
									   target:self 
									   action:@selector(continuePressed)];
	
	[continueBarBtn setWidth:125.0];
	
	NSArray *tools=[[NSArray alloc] initWithObjects:helpBarBtn,continueBarBtn,nil];
	[self setToolbarItems:tools];
	[helpBarBtn release];
	[continueBarBtn release];
	return self;
}




//sets the possession object values before resigning the screen//
-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];


	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}



-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

		[[self navigationItem]setTitle:[editingPrescriptions prescriptionName]];
	NSString *tempString=[NSString stringWithFormat:@"%d",[editingPrescriptions dosage]];
	NSString *imageKey=[editingPrescriptions drugKey];
	if (imageKey){
		UIImage *imageToDisplay=[[ImageCache sharedImageCache]imageForKey:imageKey];
		[imageView setImage:imageToDisplay];
	}else {
		[imageView setImage:nil];
	}

	
	[valueField setText:tempString];


}



//when continue button is pressed, bring up camera
-(void)continuePressed
{
	if(!newTableDetailView){
		newTableDetailView=[[TableDetailViewController alloc]init];
		
	}
	[newTableDetailView setHelpViewController:helpViewController];
	[newTableDetailView setEditingPrescription:editingPrescriptions];
	[[self navigationController]pushViewController:newTableDetailView animated:NO];
	
	
}

//makes the keyboard go away delagate when swapping to camera//
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
//		[valueField release];
	valueField=nil;
		[imageView release];
	imageView=nil;
	
	
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//invoke TableHelpView Class. There is only one object instantiated and we pass it between the ViewControllers
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:9];	//help state for ItemDetailView
	[[self navigationController]pushViewController:helpViewController animated:YES];
}


- (void)dealloc {
	
	[valueField release];
	[imageView release];

    [super dealloc];
}


@end
