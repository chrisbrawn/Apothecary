//
//  BrowserView.h
//  Apothecary
//
//
//  Created by Tony on 2011-07-07.
//  Programmers: Tony
//
//  Group 9 Apollo
//
//	Shows drug infomation from http://www.rxlist.com/
//
//  Changes:
//  
//  Bugs:
// 


#import <UIKit/UIKit.h>
@class Prescription;


@interface BrowserView : UIViewController<UIWebViewDelegate> {
	Prescription *editPrescription;
	IBOutlet UIWebView *webView;
	IBOutlet UITextField *addressBar;
	IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic,assign)Prescription *editPrescription;
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UITextField *addressBar;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;


@end
