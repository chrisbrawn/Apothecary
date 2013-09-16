//
// StartdateEditView.h
//  
//
//  Created by Tony on 2011-07-03.
//  Programmers: Tony
//
//  Group 9 Apollo
//
//  Editing Start date of prescription.
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>
@class Prescription;
@class TableViewHelp;


@interface StartdateEditView : UIViewController<UINavigationControllerDelegate> {
	
	Prescription *editPrescription;
	TableViewHelp *helpViewController;
	
	NSDate *startDate;								//to hold start date of prescription
	IBOutlet UITextView *textBox;					//the instruction text-box
	IBOutlet UIDatePicker *datePicker;			//scroll for date
}

@property (nonatomic, retain) Prescription *editPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) IBOutlet UITextView *textBox;
@property (nonatomic, assign) IBOutlet UIDatePicker *datePicker;



@end
