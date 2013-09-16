//
//  SingletonPrescription.h
//  TestTable
//
//  Created by chris on 11-06-10.
//  Singleton object to hold Prescription information as new object being created.


#import <Foundation/Foundation.h>
@class AddTableView;

@interface SingletonPrescription : NSObject {
	NSString *dosageIntakeRule;
	NSMutableArray *notificationTickets;
	NSString *prescriptionName;
	int dosage;
	NSDate *startDate;
	NSDate *endDate;
	NSString *drugKey;
	NSString *dosageKey;
	NSMutableArray *dosageTimes;
	AddTableView *originalView;			//to find the orignal tableView
	int dosageDays;
	
}
-(NSString *)description;
+(id)randomPrescription;
-(id)initWithPrescriptionName:(NSString *)name;
@property (nonatomic,copy)NSString *prescriptionName;
@property (nonatomic,copy)NSString *drugKey;
@property (nonatomic,copy)NSString *dosageKey;
@property (nonatomic) int dosage;
@property (nonatomic,copy)NSDate *startDate;
@property (nonatomic,retain)NSMutableArray *dosageTimes;
@property (nonatomic,copy)NSDate *endDate;
@property (nonatomic,assign)AddTableView *originalView;
@property (nonatomic,copy) NSString *dosageIntakeRule;
@property (nonatomic,retain)NSMutableArray *notificationTickets;
@property (nonatomic) int dosageDays;
@end
