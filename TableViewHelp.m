//
// TableViewHelp.m
//  
//
//  Created by chris on 2011-06-09.
//  Edited by billy on 2011-07-08.
//
//  Programmers: Chris
//
//  Group 9 Apollo
//
//	Help screen object to display different help information around the app. 
//  Uses an index sent from calling class to decide what help to offer the user.
//
//
//  Changes:
//
//  Bugs:
// 

#import "TableViewHelp.h"


@implementation TableViewHelp
@synthesize stateValue;

-(id)init{
	[[self navigationItem]setTitle:@"Help"];
	stateValue=0;
	return self;
}	
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */

- (void)viewWillAppear:(BOOL)animated {
	[helpText setFont: [UIFont fontWithName:@"HelveticaNeue" size:20.0f]];	//set helpText font and size
	[helpText setBackgroundColor:[UIColor clearColor]];		//set helpText background color to transparent
	[helpText sendSubviewToBack: bgImage]; 
	
	//0. main screen:
	if (stateValue==0){
		[helpText setText:
		 @"The main screen displays the list of prescriptions that has been added to the system. "
		 "If a prescription is expired, it will appear 'red' on the prescriptions list."
		 
		 "\n______________________________"
		 
		 "\n\n'+' BUTTON: \n\nTo add a new prescription to the system."
		 
		 "\n______________________________"
		 
		 "\n\n'EDIT' BUTTON: \n\nTo enable re-arrangement and deletion of existing prescriptions on the prescriptions list."
		 
		 "\n\nTo rearrange a prescription on the list, simply hold your finger down onto the 'bars' on the right side of the prescription name and "
		 "drag it to the position you prefer."
		 
		 "\n\nTo delete a prescription, touch the 'red round button' on the left side of the prescription name and "
		 "then touch 'delete' on right side of the name. Once a prescription is deleted it can not be recovered."
		 
		 "\n\nOnce you are finished with editing the prescriptions list, touch the 'EDIT' button again to disable the editing functions."
		 
		 "\n______________________________"
		 
		 "\n\nPRESCRIPTION INFORMATION: \n\nA prescriptions details can be accessed by touching its name on the prescriptions list."
		 "The prescriptions dosage quantity can be edited inside the second prescriptions details screen."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//1. camera 1:
	if (stateValue==1){ 
		[helpText setText:
		 @"Touch the 'Continue' button to access the camera."
		 
		 "\n\nIf the device does not have a camera, then touching the 'Continue' button will bring the user to the photo album."
		 
		 "\n______________________________"
		 
		 "\n\nCAMERA: \n\nOnce user is in the camera view, position your camera with the prescription bottle until the prescription label "
		 "appears clearly on the screen. Maintain this position and touch the 'Camera' button at the bottom of the screen to record the picture."
		 
		 "\n______________________________"
		 
		 "\n\nPHOTO ALBUM: \n\nPhotos from the photo album can be used if the device does not have a camera built in. The system will automatically "
		 "proceed to the next screen once an image is selected from the photo album."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//2. camera 2:
	if (stateValue==2){
		[helpText setText:
		 @"Touch the 'Continue' button to access the camera."
		 
		 "\n\nIf the device does not have a camera, then touching the 'Continue' button will bring the user to the photo album."
		 
		 "\n______________________________"
		 
		 "\n\nCAMERA: \n\nOnce user is in the camera view, position the camera so that the prescription pills appears clearly "
		 "on the screen. Maintain this position and touch the 'Camera' button at the bottom of the screen to record the picture."
		 
		 "\n______________________________"
		 
		 "\n\nPHOTO ALBUM: \n\nPhotos from the photo album can be used if the device does not have a camera built in. The system will automatically "
		 "proceed to the next screen once an image is selected from the photo album."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//3. dosage:
	if (stateValue==3) {
		[helpText setText:
		 @"'Dosage' is the required number of pills to intake at one time."
		 
		 "\n______________________________"
		 
		 "\n\nSCROLL PICKING: \n\nTo choose the correct dosage, user must drag his/her finger up and down on the scroll picker."
		 "The highlighted value on the scroll picker is the currently selected value. Once the correct dosage quantity is selected "
		 "on the scroll picker, touch the 'Continue' button to proceed to the next step."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//4. start date:
	if (stateValue==4) {
		[helpText setText:
		 @"'Starting Date' is the day that user will begin the medication."
		 
		 "\n______________________________"
		 
		 "\n\nSCROLL PICKING: \n\nThe left column on the scroll corresponds to 'month', the middle column corresponds to 'day', and the "
		 "right column corresponds to 'year'. \n\nUser must drag his/her finger up and down each column of the scroll to choose the correct "
		 "values in each column. The highlighted values on the scroll picker are the currently selected value of each column. Once the "
		 "correct values for each column is selected, touch the 'Continue' button to proceed to the next step."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//5. number of days:
	if (stateValue==5) {
		[helpText setText:
		 @"'Number of days' is the total number of days the prescription will last since the 'Start Date'."
		 
		 "\n______________________________"
		 
		 "\n\nSCROLL PICKING: \n\nTo choose the correct number of days, user must drag his/her finger up and down on the scroll picker."
		 "The highlighted value on the scroll picker is the currently selected value. Once the correct number of days is selected, "
		 " touch the 'Continue' button to proceed to the next step."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//6. number of intakes per day:
	if (stateValue==6) {
		[helpText setText:
		 @"'Number of intakes' is the total number of times required to intake the prescription for one day."
		 
		 "\n______________________________"
		 
		 "\n\nBEFORE/AFTER EVERY MEAL: \n\nThis choice assumes that the user will have 3 meals each day."
		 
		 "\n______________________________"
		 
		 "\n\nSCROLL PICKING: \n\nUser must drag his/her finger up and down on the scroll picker to choose the correct number of times. "
		 "The highlighted choice on the scroll picker is the currently selected choice. Once the correct choice is selected, "
		 " touch the 'Continue' button to proceed to the next step."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//7. pick time:
	if (stateValue==7) {
		[helpText setText:
		 @"'Intake Time' is the time when the user should intake their prescription. If the prescription requires 'x' intakes per day, "
		 "then the user is required to specify the 'x' times. The current input number is shown above the scroll picker in red."
		 
		 "\n______________________________"
		 
		 "\n\nSCROLL PICKING: \n\nThe left column on the scroll corresponds to 'hour'. The middle column corresponds to 'minutes' and the "
		 "right column corresponds to 'meridiem'\n\nUser must drag his/her finger up and down each column of the scroll to choose the "
		 "correct values in each column. The highlighted values on the scroll picker are the currently selected values in eahc column. Once "
		 "the correct values for each component is selected, touch the 'Continue' button to proceed to the next step."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//8. caregiver's email:
	if (stateValue==8) {
		[helpText setText:
		 @"'Caregiver' is the person responsible for monitoring the user's prescription intake."
		 
		 "\n______________________________"
		 
		 "\n\n'NO' BUTTON: \n\nIf there is no caregiver responsible for this prescription, touch 'No' to proceed back to the main screen."
		 
		 "\n______________________________"
		 
		 "\n\n'YES' BUTTON: \n\nIf you have a caregiver responsible for this prescription, touch 'Yes' to proceed to adding caregiver's e-mail."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen." ];
	}
	
	//9. item detail view:
	if (stateValue==9) {
		[helpText setText:
		 @"An image of the corresponding prescription bottle is displayed here along with its required dosage quantity. "
		 "Please touch 'Continue' to proceed to the details of this prescription."
		 
		 "\n\nTo return to the main screen, touch the button located at the top left corner of the screen."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	
	//10. item detail view 2:
	if (stateValue==10) {
		[helpText setText:
		 @"A list of the prescription details are displayed here along with the image of the corresponding prescription pills at the bottom of the list. "
		 "User may edit the prescriptions dosage by touching the dosage component on the list. Other prescriptions details are not editable."
		 
		 "\n\nIf editing other components of the prescription is needed, then user should delete the incorrect prescription and then add a new correct "
		 "prescription to the system."
		 
		 "\n\nTo return to the first prescription details screen, touch the button located at the top left corner of the screen."
		 
		 "\n______________________________"
		 
		 "\n\n'INFO' BUTTON: \n\nProvides additional information about the prescription through the web browser. The additional prescription information is "
		 "provided by an online drug index called RxList. "
		 
		 "\n\nFrom the web browser screen, users may return to the prescription detail screen by touching "
		 "the back button located at the top left corner of the browser screen. "
		 
		 "\n\nFor this feature to execute properly, the device must be connected to the internet."
		 
		 "\n______________________________"
		 
		 "\n\nTouch the button at top left corner of this screen to leave this help screen."];
	}
	[helpText scrollRangeToVisible:NSMakeRange(0, 0)];	//reset scroll to top
	
	[super viewWillAppear:animated];
}



- (void)viewDidLoad {
	
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
