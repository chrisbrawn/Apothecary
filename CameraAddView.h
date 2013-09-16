//
// CameraAddView.h
//  
//
//  Created by Chris on 2011-06-09.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  User prompted to take two pictures with camera. 
//  
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>
@class KeyPickerAddView;
@class Prescription;
@class TableViewHelp;

@interface CameraAddView : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate> {

	NSString *drugKey;  //stores hashed imagename of camera pic
	NSString *dosageKey; 
	IBOutlet UIImageView *photo;
	IBOutlet UITextView *dialog;
	KeyPickerAddView *KeyViewController;
	int state;
	Prescription *addPrescription;
	TableViewHelp *helpViewController;
}
@property (nonatomic,retain)NSString *drugKey;
@property (nonatomic, retain) IBOutlet UIImageView *photo;
@property (nonatomic, retain) IBOutlet UITextView *dialog;
@property (nonatomic,retain)NSString *dosageKey;
@property (nonatomic, retain) Prescription *addPrescription;
@property (nonatomic, assign) TableViewHelp *helpViewController;

@end
