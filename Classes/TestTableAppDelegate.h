//
// TestTableAppDelegate.h
//  
//
//  Created by Chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  Delegate View. Creates the main view and archives and reads the array data to disk.
//  
//  
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>
@class AddTableView;

@interface TestTableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	AddTableView *newTable;
}
-(NSString*)prescriptionArrayPath;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

