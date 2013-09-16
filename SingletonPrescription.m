//
//  SingletonPrescription.m
//  TestTable
//
//  Created by chris on 11-06-10.
//  
//

#import "SingletonPrescription.h"
#import "AddTableView.h"
#import "Prescription.h"

@implementation SingletonPrescription
@synthesize prescriptionName,drugKey,dosageKey,dosage,startDate,dosageTimes,endDate,originalView;
@synthesize dosageIntakeRule;
@synthesize notificationTickets,dosageDays;


-(id)initWithPrescriptionName:(NSString *)name
{
	self=[super init];
	if(!self)
		return nil;
	[self setPrescriptionName:name];
	[self setDosage:0];
	startDate=[[NSDate alloc]init];
	endDate=[[NSDate alloc]init];
	[self setDosageDays:0];	
	[self setDosageIntakeRule:@""];
	dosageTimes=[[NSMutableArray alloc]init];			//to hold dosage times
	notificationTickets=[[NSMutableArray alloc]init]; //to hold the notification entries
	return self;
	
}

//used to test tableview
+(id)randomPrescription
{
	
	static NSString *randomAdjectiveList[3]={
		@"Vio",@"Emo",@"Simpa"};	
	static NSString *randomNounList[3]={
		@"nyoxene",@"droxy",@"morpho"};
	NSString *randomName=[NSString stringWithFormat:@"%@%@",randomAdjectiveList[random()%3],
						  randomNounList[random()%3]];
	Prescription *newPrescription=[[self alloc] initWithPrescriptionName:randomName];
	[newPrescription setDosage:5];
	return [newPrescription autorelease];
	
};


-(id)init
{
	return [self initWithPrescriptionName:@"Prescription"];
}


-(NSString *)description
{
	return prescriptionName;
}


-(void)dealloc{
	[prescriptionName release];
	[drugKey release];
	[dosageKey release];
	[startDate release];
	[dosageTimes release];
	[endDate release];
	[dosageIntakeRule release];
	[notificationTickets release];
	[super dealloc];
}

@end
