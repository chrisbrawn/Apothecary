//
//  Prescription.h
//  
//
//  Created by chris on 2011-05-31.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//	Prescription class holds the variable for each prescription entered by
//	User.
//
//  Changes:
//  
//  Bugs:
// 

#import "Prescription.h"


@implementation Prescription
@synthesize prescriptionName,drugKey,dosageKey,dosage,startDate,dosageTimes,endDate,
dosageDays;
@synthesize dosageIntakeRule;
@synthesize notificationTickets,emailAddress,emailMessage;


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
	[self setEmailAddress:@""];
	[self setEmailMessage:@"Hello!"];
	
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
	[emailAddress release];
	[emailMessage release];
	[super dealloc];
}

//save to local disk procedures
-(void)encodeWithCoder:(NSCoder*)encoder{
	[encoder encodeObject:prescriptionName forKey:@"prescriptionName"];
	[encoder encodeObject:drugKey forKey:@"drugKey"];
	[encoder encodeObject:dosageKey forKey:@"dosageKey"];
	[encoder encodeObject:startDate forKey:@"startDate"];
	[encoder encodeObject:dosageTimes forKey:@"dosageTimes"];
	[encoder encodeInt:dosageDays forKey:@"dosageDays"];
	[encoder encodeObject:dosageIntakeRule forKey:@"dosageIntakeRule"];
	[encoder encodeObject:notificationTickets forKey:@"notificationTickets"];
	[encoder encodeObject:emailAddress forKey:@"emailAddress"];
	[encoder encodeInt:dosage forKey:@"dosage"];
	[encoder encodeObject:emailMessage forKey:@"emailMessage"];
	
}

//retrieve from local disk procedures
-(id)initWithCoder:(NSCoder *)decoder{
	[super init];
	[self setPrescriptionName:[decoder decodeObjectForKey:@"prescriptionName"]];
	[self setDrugKey:[decoder decodeObjectForKey:@"drugKey"]];
	[self setDosageKey:[decoder decodeObjectForKey:@"dosageKey"]];
	[self setStartDate:[decoder decodeObjectForKey:@"startDate"]];
	[self setDosageTimes:[decoder decodeObjectForKey:@"dosageTimes"]];
	[self setDosageDays:[decoder decodeIntForKey:@"dosageDays"]];
	[self setDosageIntakeRule:[decoder decodeObjectForKey:@"dosageIntakeRule"]];
	[self setNotificationTickets:[decoder decodeObjectForKey:@"notificationTickets"]];
	[self setEmailAddress:[decoder decodeObjectForKey:@"emailAddress"]];
	[self setDosage:[decoder decodeIntForKey:@"dosage"]];
	[self setEmailMessage:[decoder decodeObjectForKey:@"emailMessage"]];
	
	return self;
}
@end
