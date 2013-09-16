//
//  Possession.h
//  RandomPossesions
//
//  Created by chris on 11-05-25.
//  Copyright 2011 automatic bear company. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Possession : NSObject <NSCoding> {
	NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;
	NSString *imageKey;

}
@property (nonatomic,copy) NSString *imageKey;
@property (nonatomic,copy) NSString *possessionName;
@property (nonatomic,copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,readonly) NSDate *dateCreated;

+(id)randomPossession;
-(id)initWithPossessionName:(NSString *)pName
			 valueInDollars:(int)value
			   serialNumber:(NSString*)sNumber;

-(id)initWithPossessionName:(NSString *)pName;

@end
