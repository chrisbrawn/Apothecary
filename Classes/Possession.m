//
//  Possession.m
//  RandomPossesions
//
//  Created by chris on 11-05-25.
//  Copyright 2011 automatic bear company. All rights reserved.
//

#import "Possession.h"


@implementation Possession
@synthesize possessionName,serialNumber,valueInDollars,dateCreated,imageKey;


-(NSString *)description
{
	
	return possessionName
	;
}
-(id)initWithPossessionName:(NSString *)pName
			 valueInDollars:(int)value
			   serialNumber:(NSString*)sNumber
{
	self=[super init];
	if(!self)
		return nil;
	[self setPossessionName:pName];
	[self setSerialNumber:sNumber];
	[self setValueInDollars:value];
	dateCreated=[[NSDate alloc]init];
	return self;
}
-(id)initWithPossessionName:(NSString *)pName{
	return [self initWithPossessionName:pName
						 valueInDollars:0
						   serialNumber:@""];
}

-(id)init
{
	return [self initWithPossessionName:@"Possession"
						 valueInDollars:0
						   serialNumber:@""];
}
+(id)randomPossession
{
	static NSString *randomAdjectiveList[3]={
		@"Vio",@"Emo",@"Simpa"};	
	static NSString *randomNounList[3]={
		@"nyoxene",@"droxy",@"morpho"};
	NSString *randomName=[NSString stringWithFormat:@"%@%@",randomAdjectiveList[random()%3],
						  randomNounList[random()%3]];
	int randomValue=random()%10;
	
	NSString *randomSerialNumber=[NSString 
								  stringWithFormat:@"%c%c%c%c",
								  '0'+random()%10,
								  'A'+random()%26,
								  '0'+random()%10,
								  'A'+random()%26];
	Possession *newPossession=[[self alloc]initWithPossessionName:randomName
												   valueInDollars:randomValue
													 serialNumber:randomSerialNumber];
	return [newPossession autorelease];
	
}

//set up to get data from archive implementing NSCoder//
-(id)initWithCoder:(NSCoder *)decoder
{
	[super init];
	[self setPossessionName:[decoder decodeObjectForKey:@"possessionName"]];
	[self setSerialNumber:[decoder decodeObjectForKey:@"serialNumber"]];
	[self setValueInDollars:[decoder decodeObjectForKey:@"valueInDollars"]];
	[self setImageKey:[decoder decodeObjectForKey:@"imageKey"]];
	//date created readonly so no setter
	dateCreated=[[decoder decodeObjectForKey:@"dateCreated"]retain];
	return self;
}
//set up for saving implements NSCoder//
-(void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:possessionName forKey:@"possessionName"];
	[encoder encodeObject:serialNumber forKey:@"serialNumber"];
	[encoder encodeObject:valueInDollars forKey:@"valueInDollars"];
	[encoder encodeObject:dateCreated forKey:@"dateCreated"];
	[encoder encodeObject:imageKey forKey:@"imageKey"];
}
-(void)dealloc
{
	[possessionName release];
	[serialNumber release];
	[dateCreated release];
	[imageKey release];
	[super dealloc];
}	
						  
@end
