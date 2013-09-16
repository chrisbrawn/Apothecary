//
//  GlobalArray.m
//  
//
//  Created by chris on 2011-06-24.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//	Contains the singleton Array object allowing for array access in any class
//
//  Changes:
//  
//  Bugs:
// 

#import "GlobalArray.h"
#import "Prescription.h"

static GlobalArray *sharedArray=nil;


@implementation GlobalArray
@synthesize prescriptions;


//Class method that returns the array
+(GlobalArray*)sharedArray{
	@synchronized (self) {
		if (sharedArray == nil) {
			[[self alloc] init];
		}
	}
	
	return sharedArray;
}

+ (id)allocWithZone:(NSZone *)zone
{
	@synchronized(self) {
		if (sharedArray == nil) {
			sharedArray = [super allocWithZone:zone];
			return sharedArray;
		}
	}
	
	return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
	return self;
}
- (id)retain
{
	return self;
}

- (void)release
{
	// do nothing
}

- (id)autorelease
{
	return self;
}

- (NSUInteger)retainCount
{
	return NSUIntegerMax; // This is sooo not zero
}

- (id)init
{
	@synchronized(self) {
		[super init];
		prescriptions = [[NSMutableArray alloc] init];
		return self;
	}
}

-(int)arrayCount{
	return [prescriptions count];
		
}
-(void)addObject:(Prescription*)obj{
	[obj retain];
	[prescriptions addObject:obj];
	[obj release];
	
}
-(Prescription*)objectAtIndex:(int)path{
	return [prescriptions objectAtIndex:path];
}

-(void)removeObjectAtIndex:(int)path{
	
	[prescriptions removeObjectAtIndex:path];
		
}
-(void)insertObject:(Prescription*)p atIndex:(int)path{
	[p retain];
	[prescriptions insertObject:p atIndex:path];
	[p release];
}

-(NSMutableArray*)prescriptionArray{
	return prescriptions;
}




@end
