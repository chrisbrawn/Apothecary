//  
//  EmailAddView.h
//  
//  Created by Chris on 2011-06-25.
//  Programmers: Chris, Joyce
//  
//  Group 9 Apollo
//  
//  Changes:
//  2011-06-25 add EmailPickerAddView
//  
//  Bugs:
//  
//  

/*
 Will ask if the user want to have a caregiver when the prescription is expired
 */

#import <UIKit/UIKit.h>
@class EmailPickerAddView;
@class Prescription;
@class TableViewHelp;

@interface EmailAddView : UIViewController {
	
	NSString *emailAddress;
	EmailPickerAddView *emailAddController;
	Prescription *addPrescription;
	TableViewHelp *helpViewController;
}

@property (nonatomic, retain) NSString *emailAddress;
@property (nonatomic, retain) EmailPickerAddView *emailAddController;
@property (nonatomic, retain) Prescription *addPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;

@end
