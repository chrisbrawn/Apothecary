//
// TableViewHelp.h
//  
//
//  Created by chris on 2011-06-09.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//	Help screen object to display different help information around the app. 
//  Uses an index sent from calling class to decide what help to offer the user.
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>


@interface TableViewHelp : UIViewController {
	int stateValue;
	IBOutlet UITextView *helpText;
	IBOutlet UIImageView *bgImage;
}

@property(readwrite)int stateValue;
@end
