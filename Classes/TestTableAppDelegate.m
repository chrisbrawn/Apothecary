//
// TestTableAppDelegate.m
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

#import "TestTableAppDelegate.h"
#import "AddTableView.h"
#import "GlobalArray.h"
#import "Prescription.h"

@implementation TestTableAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle


-(NSString*)prescriptionArrayPath
{
	return pathInDocumentDirectory(@"Prescriptions.data");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	
	GlobalArray *masterArray=[GlobalArray sharedArray];
	NSString *prescriptionPath=[self prescriptionArrayPath];
	NSMutableArray *prescriptionArray=[masterArray prescriptionArray];
	//NSMutableArray *prescriptionArray=[newArray prescriptionArray];
	[NSKeyedArchiver archiveRootObject:prescriptionArray toFile:prescriptionPath];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}




#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

-(BOOL)application:(UIApplication*)application
didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
	GlobalArray *masterArray=[[GlobalArray alloc]init];
	
	NSString *prescriptionPath=[self prescriptionArrayPath];
	NSMutableArray *archivedArray=[NSKeyedUnarchiver unarchiveObjectWithFile:prescriptionPath];
	if (archivedArray){
		[masterArray setPrescriptions:archivedArray];}
//	[masterArray addObject:[Prescription randomPrescription]];
	newTable=[[AddTableView alloc]init];
	UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:newTable];
	navController.navigationBar.barStyle = UIBarStyleBlack;
	[navController setToolbarHidden:NO];
	navController.toolbar.barStyle=UIBarStyleBlack;
	[window addSubview:[navController view]];
	[window makeKeyAndVisible];
	return YES;
}

//what to do just before ending, archive NSCoding//
-(void)applicationWillTerminate:(UIApplication *)application
{
	GlobalArray *masterArray=[GlobalArray sharedArray];
	NSString *prescriptionPath=[self prescriptionArrayPath];
	NSMutableArray *prescriptionArray=[masterArray prescriptionArray];
	//NSMutableArray *prescriptionArray=[newArray prescriptionArray];
	[NSKeyedArchiver archiveRootObject:prescriptionArray toFile:prescriptionPath];
}

	

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
