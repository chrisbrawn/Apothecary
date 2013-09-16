//  
//  EmailPickerAddView.h
//  
//  Created by Joyce on 2011-06-24.
//  Programmers: Joyce
//  
//  Group 9 Apollo
//  
//  Changes:
//  2011-07-07 added MessageUI.framework
//  
//  
//  Bugs:
//  
//  

/*
  The e-mail address of a caregiver will be asked for input from the user.
*/

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@class Prescription;
@class TableViewHelp;

@interface EmailPickerAddView : UIViewController<UINavigationControllerDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate> {

	NSString *emailAddress;
	Prescription *addPrescription;
	TableViewHelp *helpViewController;
		
	IBOutlet UITextField *textField;	// text-field for user input

}

@property (nonatomic, retain) NSString *emailAddress;
@property (nonatomic, retain) Prescription *addPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;

@property (nonatomic, retain) IBOutlet UITextField *textField;

- (IBAction) dropKeyBoard;	// method responsible for events after "done" is pressed on keyboard

@end
