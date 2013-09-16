//
//  KeyPickerAddView.h
//  TestTable
//
//  Created by chris on 11-06-10.
//	Edited by billy on 11-06-15.
//  
//	KeyPicker Class is invoked to provide the name information and other dosage data

#import <UIKit/UIKit.h>
@class Prescription;
@class TableViewHelp;

@class ScrollPickerAddView;	//Leo's class

@interface KeyPickerAddView : UIViewController<UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {

	NSString *name;
	Prescription *addPrescription;
	TableViewHelp *helpViewController;
	
	//billy added:
	int state;						//to hold state value
	int dosage;						//to hold dosage quantity
	NSMutableArray *dosageArray;	//array for scroll picker
	NSDate *startDate;				//to hold starting date
	NSDate *today;				//to hold today's date
	
	IBOutlet UITextView *textBox;				//the instruction text-box
	IBOutlet UITextField *textField;			//text-field for user input
	IBOutlet UIPickerView *dosagePicker;		//scroll for dosage quantity
	IBOutlet UIDatePicker *datePicker;			//scroll for date
	
	ScrollPickerAddView *leosView;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) Prescription *addPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;

//billy added:
@property (nonatomic) int state;
@property (nonatomic) int dosage;
@property (nonatomic, retain) NSMutableArray *dosageArray;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSDate *today;

@property (nonatomic, retain) IBOutlet UITextView *textBox;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, assign) IBOutlet UIPickerView *dosagePicker;
@property (nonatomic, assign) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, retain) ScrollPickerAddView *leosView;

- (IBAction) dropKeyBoard;		//method responsible for events after "done" is pressed on keyboard

@end
