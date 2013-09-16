//
// ScrollPickerView.h
//  
//
//  Created by Leo on 2011-06-23.
//  Programmers: Leo
//
//  Group 9 Apollo
//
//  Scroll picker to choose number of times a day prescription is required and number of days 
//  Will create notifications in this class to alert user.
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>

@class Prescription;
@class TableViewHelp;
@class ScrollPickerAddView;
@class EmailAddView;

@interface ScrollPickerAddView : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
	Prescription *addPrescription;
	TableViewHelp *helpViewController;
	ScrollPickerAddView *newView;
	EmailAddView *emailViewController;
	
	/****************************************************
		Added Global Variables for generating
		1. E-mail Message
		2. Notification NSDate
	 */
	NSMutableArray *notificationTickets;
	NSMutableArray *timeArray;
	NSDateFormatter *dateFormat, *timeFormat, *timeFormatWithSec, *notifFormat;
	NSString *emailMsg;
	NSDate *notifDate;
	NSString *tempStartDate;
	/****************************************************/
	
	
	UIPickerView *scrollPicker;
	UIDatePicker *dateScollPicker;
	NSMutableArray *pickerArray, *timeForEachDosage;
	IBOutlet UILabel *viewTitle, *timesForDosageLabel, *dosageTimeTitle;
	NSDate *pickedDate;
	NSString *dosageIntakeRule;
	
	int dosageDays;
	int caseView;
	int loopCount;
	int counter;
}

//Uncomment if need to access outside
//@property (nonatomic) int dosageDays;
//@property (nonatomic, retain) NSMutableArray *pickerArray, *pickerArray2, *pickerArray3, *pickerArray4;
//@property (nonatomic, retain) IBOutlet UIPickerView *scrollPicker;
//@property (nonatomic, retain) IBOutlet UIDatePicker *dateScollPicker;
//@property (nonatomic, assign) NSDate *pickedDate;

//@property (nonatomic, copy) NSString *emailMsg;

@property (nonatomic, assign)Prescription *addPrescription;

@property (nonatomic) int caseView;

@property (nonatomic) int loopCount;

@property (nonatomic, assign) TableViewHelp *helpViewController;

@property (nonatomic, retain) ScrollPickerAddView *newView;

@property (nonatomic, assign) EmailAddView *emailViewController;

@property (nonatomic,retain)NSMutableArray *notificationTickets;


@end
