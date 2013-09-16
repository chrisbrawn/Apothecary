//
//  GlobalArray.h
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

#import <Foundation/Foundation.h>
@class Prescription;

@interface GlobalArray : NSObject {
	NSMutableArray *prescriptions;

}

+(GlobalArray*)sharedArray;
-(int)arrayCount;
-(void)addObject:(Prescription*)obj;
-(Prescription*)objectAtIndex:(int)path;
-(void)removeObjectAtIndex:(int)path;
-(void)insertObject:(Prescription*)p atIndex:(int)path;
-(NSMutableArray*)prescriptionArray;

@property(nonatomic,retain)NSMutableArray *prescriptions;
@end
