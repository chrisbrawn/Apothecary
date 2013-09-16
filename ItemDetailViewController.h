//
// ItemDetailViewController.h
//  
//
//  Created by Chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  Shows picture of prescription packaging and dosage information. 
//  If user continues, will have ability to see and edit prescription information.
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>
@class Prescription;
@class TableDetailViewController;
@class TableViewHelp;

@interface ItemDetailViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
//	
	IBOutlet UILabel *valueField;
	Prescription *editingPrescriptions;
	IBOutlet UIImageView *imageView;
	TableDetailViewController *newTableDetailView;
	TableViewHelp *helpViewController;

}
@property (nonatomic,assign)Prescription *editingPrescriptions;
@property (nonatomic, assign) TableViewHelp *helpViewController;
@end
