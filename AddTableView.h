//
// AddTableView.h
//  
//
//  Created by chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  Master TableView. The main screen of our app. controls table view and invokes all other screens 
//  in program.
//
//
//  Changes:
//  
//  Bugs:
// 


#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class TableViewHelp;
@class CameraAddView;
@class Prescription;

@interface AddTableView : UIViewController <UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *mainTableView;
	ItemDetailViewController *detailViewController;
	TableViewHelp *helpViewController;
	CameraAddView *cameraViewController;
	Prescription *addPrescription;

}
-(IBAction)editTable:(id)sender;
@property (nonatomic, retain) IBOutlet UITableView *mainTableView;
@property (nonatomic, retain) Prescription *addPrescription;
@end
