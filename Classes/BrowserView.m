//
//  BrowserView.m
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

#import "BrowserView.h"
#import "Prescription.h"


@implementation BrowserView
@synthesize editPrescription, webView;
@synthesize addressBar;
@synthesize activityIndicator;

-(void)viewDidLoad {
	[super viewDidLoad];

	/*UIBarButtonItem *goBarBtn = [[UIBarButtonItem alloc] 
								   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
								   target:self 
								   action:@selector(gotoAddress)];
	
	[[self navigationItem] setRightBarButtonItem:goBarBtn];
	 */

	UIBarButtonItem *backBarBtn = [[UIBarButtonItem alloc] 
								   initWithTitle:@"< Back" 
								   style:UIBarButtonItemStyleBordered
								   target:self 
								   action:@selector(goBack)];
	
	[backBarBtn setWidth:75.0];
	UIBarButtonItem *forwardBarBtn = [[UIBarButtonItem alloc] 
									   initWithTitle:@"Forward >" 
									   style:  UIBarButtonItemStyleBordered
									   target:self 
									   action:@selector(goForward)];
	
	[forwardBarBtn setWidth:75.0];
	/*
	UIBarButtonItem *doneBarBtn = [[UIBarButtonItem alloc] 
									  initWithTitle:@"Done" 
									  style:  UIBarButtonItemStyleBordered
									  target:self 
									  action:@selector(doneSelected)];
	
	[doneBarBtn setWidth:75.0];
	*/
	//NSArray *tools=[[NSArray alloc] initWithObjects:backBarBtn, forwardBarBtn, doneBarBtn , nil];
	NSArray *tools=[[NSArray alloc] initWithObjects:backBarBtn, forwardBarBtn, nil];
	[self setToolbarItems:tools];
	[backBarBtn release];
	[forwardBarBtn release];
	//[doneBarBtn release];
	

}
-(void)viewWillAppear:(BOOL)animated {
	[[self navigationItem]setTitle:[editPrescription prescriptionName]];

	NSString *urlAddress = [@"http://www.rxlist.com/script/main/srchcont_rxlist.asp?src=" stringByAppendingString:[editPrescription prescriptionName]];
	urlAddress = [urlAddress stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

	//NSLog(@"url = %@", urlAddress);
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:requestObj];
	[addressBar setText:urlAddress];
	
}
-(void)gotoAddress {
	NSURL *url = [NSURL URLWithString:[addressBar text]];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:requestObj];
	[addressBar resignFirstResponder];
}

-(void)goBack {
	[webView goBack];
}

-(void)goForward {
	[webView goForward];
}

-(void)doneSelected {
	[[self navigationController]popViewControllerAnimated:YES];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
	[activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
	[activityIndicator stopAnimating];
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
	if(navigationType == UIWebViewNavigationTypeLinkClicked) {
		NSURL *URL = [request URL];
		if([[URL scheme] isEqualToString:@"http"]) {
			[addressBar setText:[URL absoluteString]];
			[self gotoAddress];
		}
		return NO;
	}
	return YES;
}


@end
