//
// EmailEditView.h
//  
//
//  Created by Tony on 2011-07-05.
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


@interface EmailEditView : UIViewController<UINavigationControllerDelegate, UITextFieldDelegate> {
	
	NSString *emailAddress;
	Prescription *editPrescription;
	TableViewHelp *helpViewController;
	IBOutlet UITextView *textBox;				//the instruction text-box
	IBOutlet UITextField *textField;
}

@property (nonatomic, retain) NSString *emailAddress;
@property (nonatomic, retain) Prescription *editPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;
@property (nonatomic, retain) IBOutlet UITextView *textBox;
@property (nonatomic, retain) IBOutlet UITextField *textField;

-(IBAction) dropKeyBoard;

@end
