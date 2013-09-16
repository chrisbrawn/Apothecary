//
// NumberOfDaysEditView.h
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

#import <UIKit/UIKit.h>
@class Prescription;
@class TableViewHelp;


@interface NumberOfDaysEditView : UIViewController<UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
	
	Prescription *editPrescription;
	TableViewHelp *helpViewController;
	
	int numberOfDays;								//to hold number of days
	NSMutableArray *numberOfDaysArray;				//array for scroll picker
	IBOutlet UITextView *textBox;					//the instruction text-box
	IBOutlet UIPickerView *numberOfDaysPicker;		//scroll for dosage quantity
}

@property (nonatomic, retain) Prescription *editPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;
@property (nonatomic) int numberOfDays;
@property (nonatomic, retain) NSMutableArray *numberOfDaysArray;
@property (nonatomic, retain) IBOutlet UITextView *textBox;
@property (nonatomic, assign) IBOutlet UIPickerView *numberOfDaysPicker;


@end
