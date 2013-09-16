//
// TableDetailViewController.h
//  
//
//  Created by chris on 2011-06-16.
//  Programmers: Tony,Chris
//
//  Group 9 Apollo
//
//	TableView for single Prescriptions. Users my edit their prescription information 
//  From this table.
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>
@class Prescription;
@class TableViewHelp;
@class DosageEditView;
@class StartdateEditView;
@class EmailEditView;
@class NumberOfDaysEditView;
@class BrowserView;

@interface TableDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	
	TableViewHelp *helpViewController;
	Prescription *editingPrescription;
	DosageEditView *dosageEditViewController;
	StartdateEditView *startdateEditViewController;
	NumberOfDaysEditView *numberOfDaysEditViewController;
	EmailEditView *emailEditViewController;
	BrowserView *browserViewController;
	
	IBOutlet UITableView *detailTableView;
	IBOutlet UIImageView *photo;

}
@property (nonatomic,assign)Prescription *editingPrescription;
@property (nonatomic,assign)TableViewHelp *helpViewController;
@property (nonatomic, retain)DosageEditView *dosageEditViewController;
@property (nonatomic, retain)StartdateEditView *startdateEditViewController;
@property (nonatomic, retain)NumberOfDaysEditView *numberOfDaysEditViewController;
@property (nonatomic, retain)EmailEditView *emailEditViewController;
@property (nonatomic, retain)BrowserView *browserViewController;
@property (nonatomic, retain) IBOutlet UITableView *detailTableView;
@property (nonatomic, retain) IBOutlet UIImageView *photo;
@end
