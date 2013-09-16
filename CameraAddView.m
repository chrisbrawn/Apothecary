//
// CameraAddView.m
//  
//
//  Created by Chris on 2011-06-09.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  User prompted to take two pictures with camera. 
//  The ViewController for the Camera Screen. Will prompt use for 2 pictures and programatically
//  change the information screen while saving hashkeys for each image in the Singleton object addPrescription.
//  On pressing continue we load up the next screen->KeyPickAddView Class
//  
//
//
//  Changes:
//  July 10-Updated code to reload main screen for additional inputs
//
//
//  Bugs:
// 



#import "CameraAddView.h"
#import "ImageCache.h"
#import	"KeyPickerAddView.h"
#import "Prescription.h"
#import "TableViewHelp.h"



@implementation CameraAddView
@synthesize drugKey;
@synthesize photo;
@synthesize dialog,dosageKey;
@synthesize addPrescription;
@synthesize helpViewController;


-(id)init{
		
	state=0; //set state to be 0 for initial camera screen we change info programatically
	
	[[self navigationItem]setTitle:@"Add Prescription"];
	[[self navigationItem] setHidesBackButton:YES animated:NO]; //hides back button

	UIBarButtonItem *helpBarBtn = [[UIBarButtonItem alloc] 
								   initWithTitle:@"Help" 
								   style:UIBarButtonItemStyleBordered
								   target:self 
								   action:@selector(helpPressed)];
	
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




//we are going to programatically fill up the image and text
- (void)viewDidLoad {
	[dialog setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0]];
	[dialog setText:@"To enter your prescription we need to take a picture.\nUse the picture below as a guide"];
	UIImage *image = [UIImage imageNamed: @"pillbottle.png"];
	[photo setImage:image];
    [super viewDidLoad];
}


//when continue button is pressed, bring up camera
-(void)continuePressed
{
	[[self view]endEditing:YES];
	UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		[imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
	}
	else {
		[imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
	}
	[imagePicker setDelegate:self];
	[self presentModalViewController:imagePicker animated:YES];
	[imagePicker release];
	
}

//delegate method called as camera is put away//
//state 0 refers to the first photo taken and state 1=second photo.
//we are creating UniqueID's of the photos to be store in our Singleton object so that
//the photos can be retrieved at a later date. The images are stored in an ImageCache.
//state=1 finalises by invoking the keyViewController
-(void)imagePickerController:(UIImagePickerController*)picker
didFinishPickingMediaWithInfo:(NSDictionary*)info
{
	if (state==0){
		//set our singleton Prescription to 0 everytime we start adding new Prescription
		/*
		[addPrescription setDosage:0];
		[addPrescription setPrescriptionName:@""];
		[addPrescription setDosageKey:nil];
		[addPrescription setDrugKey:nil];
		[addPrescription setStartDate:nil];
		[addPrescription setDosageTimes:nil];
		[addPrescription setEndDate:nil];
		[addPrescription setDosageIntakeRule:@""];
		if ([[addPrescription dosageTimes] count]>0) {
			[[addPrescription dosageTimes] removeAllObjects];
		}
		if ([[addPrescription notificationTickets]count]>0 ) {
			[[addPrescription notificationTickets] removeAllObjects];
		}
		 */
		
	UIImage *imagePic=[info objectForKey:UIImagePickerControllerOriginalImage];
	CFUUIDRef newUniqueID=CFUUIDCreate(kCFAllocatorDefault);
	
	CFStringRef newUniqueIDString=CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
	[addPrescription setDrugKey:(NSString*)newUniqueIDString];
	CFRelease(newUniqueIDString);
	CFRelease(newUniqueID);
	[[ImageCache sharedImageCache]setImage:imagePic forKey:[addPrescription drugKey]];
	NSLog(@"key%@\n",[addPrescription drugKey]);
	//puts images on screen//
	[self dismissModalViewControllerAnimated:YES];
	[dialog setText:@"Next we need to take a picture of your dosage"];
	UIImage *image = [UIImage imageNamed: @"dose.png"];
	
	[photo setImage:image];
		state++;
	}
	else {
		UIImage *imagePic=[info objectForKey:UIImagePickerControllerOriginalImage];
		CFUUIDRef newUniqueID=CFUUIDCreate(kCFAllocatorDefault);
		
		CFStringRef newUniqueIDString=CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
		[addPrescription setDosageKey:(NSString*)newUniqueIDString];
		CFRelease(newUniqueIDString);
		CFRelease(newUniqueID);
		[[ImageCache sharedImageCache]setImage:imagePic forKey:[addPrescription dosageKey]];
		NSLog(@"key%@\n",[addPrescription dosageKey]);
		//puts images on screen//
		[self dismissModalViewControllerAnimated:YES];
		if(!KeyViewController){
			KeyViewController=[[KeyPickerAddView alloc]init];
			
		}
		//push help view on nav controller
		state=0;
		[dialog setText:@"To enter your prescription we need to take a picture.\nUse the picture below as a guide"];
		UIImage *image = [UIImage imageNamed: @"pillbottle.png"];
		[photo setImage:image];
		
		[self setDosageKey:@""];
		[self setDrugKey:@""];
		[KeyViewController setHelpViewController:helpViewController];
		[KeyViewController setAddPrescription:addPrescription];
		[[self navigationController]pushViewController:KeyViewController animated:YES];
		
	}

}

//invoke TableHelpView Class. There is only one object instantiated and we pass it between the ViewControllers
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	NSLog(@"key%i",state+1);
	[helpViewController setStateValue:state+1];	//help state:
												//camera 1 = 1+0
												//camera 2 = 1+1
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
	[KeyViewController release];
	[addPrescription release];
	[helpViewController release];
	[photo release];
	[dialog release];
	[drugKey release];
	[dosageKey release];
    [super dealloc];
}


@end
