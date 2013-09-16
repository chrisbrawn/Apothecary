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

#import <Foundation/Foundation.h>


@interface Prescription : NSObject<NSCoding> {
	NSString *dosageIntakeRule;
	NSMutableArray *notificationTickets;
	NSString *prescriptionName;
	int dosage;
	NSDate *startDate;
	NSDate *endDate;
	NSString *drugKey;
	NSString *dosageKey;
	NSMutableArray *dosageTimes;
	int dosageDays;
	NSString *emailAddress;
	NSString *emailMessage;
	}

@property (nonatomic,copy)NSString *prescriptionName;
@property (nonatomic,copy)NSString *drugKey;
@property (nonatomic,copy)NSString *dosageKey;
@property (nonatomic) int dosage;
@property (nonatomic,copy)NSDate *startDate;
@property (nonatomic,retain)NSMutableArray *dosageTimes;
@property (nonatomic,copy)NSDate *endDate;
@property (nonatomic) int dosageDays;
@property (nonatomic,copy) NSString *dosageIntakeRule;
@property (nonatomic,retain)NSMutableArray *notificationTickets;
@property (nonatomic,copy)NSString *emailAddress;
@property (nonatomic,copy)NSString *emailMessage;
+(id)randomPrescription;
-(id)initWithPrescriptionName:(NSString *)name;


@end
