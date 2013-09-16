//
// DosageEditView.h
//  
//
//  Created by Tony on 2011-06-29.
//  Programmers: Tony
//
//  Group 9 Apollo
//
//  Editing dosage level of prescription.
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>
@class Prescription;
@class TableViewHelp;


@interface DosageEditView : UIViewController<UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
	
	Prescription *editPrescription;
	TableViewHelp *helpViewController;
	
	int dosage;						//to hold dosage quantity
	NSMutableArray *dosageArray;	//array for scroll picker
	IBOutlet UITextView *textBox;				//the instruction text-box
	IBOutlet UIPickerView *dosagePicker;		//scroll for dosage quantity
}

@property (nonatomic, retain) Prescription *editPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;
@property (nonatomic) int dosage;
@property (nonatomic, retain) NSMutableArray *dosageArray;
@property (nonatomic, retain) IBOutlet UITextView *textBox;
@property (nonatomic, assign) IBOutlet UIPickerView *dosagePicker;


@end
