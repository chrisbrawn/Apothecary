//
// ScrollPickerView.m
//  
//
//  Created by Leo on 2011-06-23.
//  Programmers: Leo,Chris,Joyce
//
//  Group 9 Apollo
//
//  Scroll picker to choose number of times a day prescription is required and number of days 
//  Will create notifications in this class to alert user.
//
//
//  Changes:
//  2011-07-10: notifications fire and work
//	2011-07-10: notifications functioning
//  2011-07-19: changed emailMsg
//  
//  Bugs: 
// 

#import "ScrollPickerAddView.h"
#import "Prescription.h"
#import "TableViewHelp.h"
#import "EmailAddView.h"

#import <stdlib.h>

@implementation ScrollPickerAddView

@synthesize addPrescription,helpViewController;
@synthesize newView, caseView, loopCount,emailViewController;
@synthesize notificationTickets;
//@synthesize emailMsg;


//Uncommented if need to access outside
//@synthesize pickedDate, dosageDays, scrollPicker, dateScollPicker;

-(id)init{
	caseView = 1;
	
	/*
	 Unchanged
	 */
	[[self navigationItem] setTitle:@"Name Prescription"];
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
	
	NSArray *tools=[[NSArray alloc] initWithObjects:helpBarBtn,continueBarBtn,nil];
	[self setToolbarItems:tools];
	[helpBarBtn release];
	[continueBarBtn release];
	
	return self;
	/*
	 */
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)scrollPicker
{
	/*
	 Number of components in view 1 and view 2
	 In view 3, UIPickerView is hidden
	 */
	return 1;
	
}

- (NSInteger)pickerView:(UIPickerView *)scrollPicker numberOfRowsInComponent:(NSInteger)component
{
	/*
	 Number of rows in view 1 and view 2
	 In view 3, UIPickerView is hidden
	 */
	
	return [pickerArray count];
}

- (NSString *)pickerView :(UIPickerView *)scrollPicker titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	/*
	 Title for each row in view 1 and view 2
	 In view 3, UIPickerView is hidden
	 */
	return  [pickerArray objectAtIndex: row];	
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	/*
	 Storing the information selected in the UIPickerView into different variables
	 according to the situation
	 */
	
	/*
	 Switch between case views
	 */
	switch (caseView) {
		case 1:
			dosageDays = [[pickerArray objectAtIndex:[thePickerView selectedRowInComponent:0]] intValue];
			//NSLog(@"%d", dosageDays);
			break;
		case 2:
			dosageIntakeRule = [pickerArray objectAtIndex:[thePickerView selectedRowInComponent:0]];
			//NSLog(dosageIntakeRule);
			break;
		default:
			break;
	}
}

- (void)viewDidLoad{
		/*
	 Case 1: User picks the total number of days for the medication
	 Case 2: User picks the rules for the prescription
	 E.g. "After every meal"
	 Case 3: user picks the time for
	 
	 This method excluded "switch" because you cant declare new variable
	 within "case" scope.
	 But switch statement included, but commented out.
	 
	 */
	
	 

	 
	/******
	 switch code
	 
	 switch (caseView) {
	 case 1:
	 pickerArray= [[NSMutableArray alloc] init];
	 for (int i=1; i<=30; i++){
	 myString = [NSString stringWithFormat:@"%d", i];
	 [pickerArray addObject:myString];
	 }
	 break;
	 case 2:
	 pickerArray= [[NSMutableArray alloc] init];
	 
	 //Set titles
	 [viewTitle setText:@"Choose number of times each day for the prescription"];
	 
	 [pickerArray addObject:@"Before Every Meal"];
	 [pickerArray addObject:@"1 Times/Day (Daily)"];
	 [pickerArray addObject:@"After Every Meal"];
	 break;
	 case 3:
	 counter = 1; //counter for loop display in time picking view
	 
	
	 
	 
	 //Hide UIPickerView
	 [scrollPicker setHidden:YES];
	 [timesForDosageLabel setHidden:NO];
	 [timesForDosageLabel setText:@"Time 1"];
	 
	 //Set titles and labels for the UIPickerView
	 [viewTitle setText:@"Choose the time for each intake of the prescription"];
	 break;
	 default:
	 break;
	 }******/
	
	
	[dateScollPicker setDatePickerMode:UIDatePickerModeTime];
	NSString *myString;
	pickerArray= [[NSMutableArray alloc] init];
	
	
	
	
	/*
	 Switch between case views
	 */
	if (caseView == 1){
		dosageDays = 2; //Default
		
		/*
		 Set titles and labels for the UIPickerView
		 */
		[viewTitle setText:@"Length of prescription in days"];
		for (int i=1; i<=30; i++){
			myString = [NSString stringWithFormat:@"%d", i];
			[pickerArray addObject:myString];
		}
		
	}
	else if (caseView == 2){
		dosageIntakeRule = @"After Every Meal"; //Default
		
		/*
		 Set titles and labels for the UIPickerView
		 */
		[viewTitle setText:@"Number of intakes per day"];
		
		
		/*
		 Add prescription in-take rules into array
		 */
		[pickerArray addObject:@"Before Every Meal"];
		[pickerArray addObject:@"After Every Meal"];
		for (int i=1; i<=6; i++){
			[pickerArray addObject:[NSString stringWithFormat:@"%d Times/Day", i]];
		}
	}
	else{
		counter = 1; //counter for loop display in time picking view
		emailMsg = NULL;
		timeArray = [[NSMutableArray alloc] init];
		
		
		
		
		/*
		 Hide UIPickerView
		 */
		[scrollPicker setHidden:YES];
		
	

		
			[timesForDosageLabel setHidden:NO];
		[timesForDosageLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
		[timesForDosageLabel setTextColor:[UIColor redColor]];
		[timesForDosageLabel setText:@"#1"];
		
		//[timesForDosageLabel setAdjustsFontSizeToFitWidth:YES];
		[dosageTimeTitle setHidden:NO];
		[dosageTimeTitle setText:@"Intake Time"];
		/*
		 Set titles and labels for the UIPickerView
		 */
		[viewTitle setText:@"Choose the prescription time"];
		
		
	}
	
	[scrollPicker selectRow:1 inComponent:0 animated:NO];
	[super viewDidLoad];
}

//Set addPrescription and invoker next View
-(void)continuePressed
{	
	/*
	 Local variable declaration
	 */
	int tempInt, i, j;
	NSArray *tempArray;
	
	/****************************************************
	 Declaring NSDateFormatter for e-mail and Notification NSDate
	 
	 */
	dateFormat = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormat setDateFormat:@"yyyy-MM-dd"];
	
	timeFormat = [[[NSDateFormatter alloc] init] autorelease];
	[timeFormat setDateFormat:@"HH:mm"];
	
	timeFormatWithSec = [[[NSDateFormatter alloc] init] autorelease];
	[timeFormatWithSec setDateFormat:@"HH:mm:ss"];
	
	notifFormat = [[[NSDateFormatter alloc] init] autorelease];
	[notifFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
	
	
	
	
	NSString *tempTimeEachDay;
	/****************************************************/
	
	
	/********/
	/********/
	/* Declaring UILocalNotification object */
	// Class notifClass = NSClassFromString(@"UILocalNotification");
	// if (notifClass){
	//		notifClass *notification = [[notifClass alloc] init];
	// }
	/********/
	/********/
	
	
	
	
	/*
	 Switch between case views
	 */
	switch (caseView) {
		case 1:
			NSLog(@"We are in first,  value to be passed: %d", dosageDays);
			
			[addPrescription setDosageDays:dosageDays]; //Update Prescription here
			
			/*
			 Declare next view and set some global variable
			 */
			newView=[[ScrollPickerAddView alloc]init];
			[newView setCaseView:2];
			[newView setAddPrescription:addPrescription];
			[[self navigationController]pushViewController:newView animated:YES];
			break;
			
			
			
		case 2:
			NSLog(@"We are in 2nd, value to be passed: \n %@", dosageIntakeRule);
			NSLog(@"Value passed previously:  %d", [addPrescription dosageDays]);
			
			[addPrescription setDosageIntakeRule:dosageIntakeRule]; //update prescription here
			
			/*
			 Declare next view and set some global variable
			 */
			newView=[[ScrollPickerAddView alloc]init];
			if([dosageIntakeRule isEqual:@"Before Every Meal"] || [dosageIntakeRule isEqual:@"After Every Meal"])
			{
				[newView setLoopCount:3];
			}
			else{
				tempArray = [dosageIntakeRule componentsSeparatedByString:@" "];
				tempInt = [[tempArray objectAtIndex:0] intValue];
				[newView setLoopCount:tempInt];
			}
			[newView setCaseView:3];
			[newView setAddPrescription:addPrescription];
			[newView setNotificationTickets:notificationTickets];
			[[self navigationController]pushViewController:newView animated:YES];
			break;
			
			
			
		default: //CaseView 3, in default for local variable declaration
			
			/*
			 Looping for each prescription time according to the selection
			 in prior view
			 */
			if (counter <= loopCount){
				
				
				
				pickedDate = [dateScollPicker date];
				
				/*Quick Hot Fix*/
	 
	 			NSString *fixString = [dateFormat stringFromDate:pickedDate];
	 			NSString *fixString2 = [timeFormat stringFromDate:pickedDate];
	 			NSLog(@"Testing the initial time: %@\n", fixString2);
	 			if ([fixString2 isEqual:@"12:08"]){
	 				fixString2 = [NSString stringWithFormat:@"12:05:00"];
	 				NSString *fixString3 = [NSString stringWithFormat:@"%@ %@ -0700", fixString, fixString2];
	 				pickedDate = [notifFormat dateFromString:fixString3];
	 			}
	 			
	 			/*Quick Hot Fix*/
				
				[timeForEachDosage addObject:pickedDate];
				
				
				/****************************************************
					Storing time to generate E-mail and notification NSDate
				 */
				NSString *time = [timeFormat stringFromDate:pickedDate]; //For E-mail
				tempTimeEachDay = [timeFormatWithSec stringFromDate:pickedDate]; //For Notification
				
				/****************************************************/
				
				
				[timeArray addObject:time]; //Storing time into a temp array for e-mail generating purpose
				[timeArray addObject:tempTimeEachDay];
				
				
				
				[addPrescription setDosageTimes:timeForEachDosage]; //Update Prescription here
				
				
				if (counter != loopCount)
				{
					[timesForDosageLabel setText:@" "];
					[timesForDosageLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
					[timesForDosageLabel setTextColor:[UIColor redColor]];
					[timesForDosageLabel setText:[NSString stringWithFormat:@"#%d", (counter+1)]];
					
					//[timesForDosageLabel setAdjustsFontSizeToFitWidth:YES];
				}
				
				NSLog(@"We are in 3rd, value to be passed: \n %@", pickedDate);
				NSLog(@"Value passed previously:  %@", [addPrescription dosageIntakeRule]);
				
				if(counter == loopCount)
				{
					/****************************************************
						Generating E-mail Message
					 */
					emailMsg = [NSString stringWithFormat:@"** This is Apothecary automatic message ** \n\n"
								"Hello! This e-mail is sent from Apothecary. \n"
								"You have become the caregiver of %@ and he/she has just added a new prescription. \n"
								"Detail of the new prescription is listed below.\n\n",[[UIDevice currentDevice] name]];
					
					emailMsg = [emailMsg stringByAppendingString:[NSString stringWithFormat:
								@"---Prescription Information---\nPrescription Name: %@\nDosage: %d\nNumber of Days: %d\nStarting Date: %@\nIntake Rules: %@\n",
								[addPrescription prescriptionName],
								[addPrescription dosage],
								[addPrescription dosageDays],
								[dateFormat stringFromDate:[addPrescription startDate]],
								[addPrescription dosageIntakeRule]]];
					
					emailMsg = [emailMsg stringByAppendingString:@"\n---Intake time for each day---"];
					emailMsg = [emailMsg stringByAppendingString:@"\nTime is in 24 hour format\n"];
					for (i = 0; i < (loopCount*2); i+=2){
						emailMsg = [emailMsg stringByAppendingString:[NSString stringWithFormat:@"Intake Time #%d: ", ((i/2)+1)]];
						emailMsg = [emailMsg stringByAppendingString:[timeArray objectAtIndex:i]];
						emailMsg = [emailMsg stringByAppendingString:@"\n"];
					}
					NSLog(@"Testing E-mail Message: \n%@\n", emailMsg);
					[addPrescription setEmailMessage:emailMsg]; //Update the e-mail message
					/*
						E-mail generation complete
					 ****************************************************/
					
					
					
					/****************************************************
						Generating Notification NSDate 
						1st Loop for number of days
						2nd Loop for number of times each day
					 */
										for (i = 0; i < [addPrescription dosageDays]; i++){
											NSTimeInterval interval=(60*60*24*i);
											tempStartDate = [dateFormat stringFromDate:[[addPrescription startDate] dateByAddingTimeInterval:interval]]; //works fine
											NSLog(@"tempStartDate %@",tempStartDate);
											for (j = 1; j <= (loopCount *2); j+=2){
												NSString *tempString = [timeArray objectAtIndex:j];
												NSString *formatString=[NSString stringWithFormat:@"%@ %@ -0700", tempStartDate, tempString];
												NSLog(@"format String %@",formatString);
												
												[notifFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
												NSDate *pickerDate=[[NSDate alloc]init];
												pickerDate=[notifFormat dateFromString:formatString];
												NSLog(@"Testing Notification NSDate: %@\n", pickerDate);
												
												NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
												
																															
												// Break the date up into components
												NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit ) 
																							   fromDate:pickerDate];
												NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) 
																							   fromDate:pickerDate];
												
												// Set up the fire time
												NSDateComponents *dateComps = [[NSDateComponents alloc] init];
												[dateComps setDay:[dateComponents day]];
												[dateComps setMonth:[dateComponents month]];
												[dateComps setYear:[dateComponents year]];
												[dateComps setHour:[timeComponents hour]];
												// Notification will fire in one minute
												[dateComps setMinute:[timeComponents minute]];
												[dateComps setSecond:[timeComponents second]];
												NSDate *itemDate = [calendar dateFromComponents:dateComps];
												[dateComps release];
												
												UILocalNotification *localNotif = [[UILocalNotification alloc] init];
												if (localNotif == nil)
													return;
												localNotif.fireDate = itemDate;
												localNotif.timeZone = [NSTimeZone defaultTimeZone];
												
												// Notification details
												localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"Please take your prescription %@ now" , nil),
				[addPrescription prescriptionName]];
												// Set the action button
												localNotif.alertAction = @"View";
												
												localNotif.soundName = UILocalNotificationDefaultSoundName;
												localNotif.applicationIconBadgeNumber = 1;
												
												// Specify custom data for the notification
												NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
												localNotif.userInfo = infoDict;
												
												// Schedule the notification
												
												[[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
												
												//store the notification so we can use delete it later if need be.
												
												NSMutableArray *storeNotif=[addPrescription notificationTickets];
												[storeNotif addObject:localNotif];
												[addPrescription setNotificationTickets:storeNotif];
												
												[localNotif release];
												
						}
					}
									
					
					if(!emailViewController){
						emailViewController=[[EmailAddView alloc]init];
						
					}	
					[emailViewController setAddPrescription:addPrescription];
					[[self navigationController]pushViewController:emailViewController animated:YES];
				}
			}
			counter++;
			break;
	}
	
	//Test for catching notifications
	/*
	NSMutableArray *testLoop=[addPrescription notificationTickets];
	for (int i=0; i<[testLoop count]; i++) {
		UILocalNotification *tempbot=[testLoop objectAtIndex:i];
		NSLog(@"Notification tickets: %@",tempbot);
	}
	*/
}

//invokes help screen
-(void)helpPressed{
	if(!helpViewController){
		helpViewController=[[TableViewHelp alloc]init];
	}
	[helpViewController setStateValue:caseView+4];   //help state for Keyboard picker screen
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
	[scrollPicker release];
	[pickerArray release];
	[timeForEachDosage release];
	[newView release];
    [super dealloc];
}


@end
