//
// FileHelpers.m
//  
//
//  Created by Chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//  Gets Path for local storage. 
//  
//
//
//  Changes:
//  
//  Bugs:
// 
#include "FileHelpers.h"

NSString *pathInDocumentDirectory(NSString *fileName)
{
	NSArray *documentDirectories=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *documentDirectory=[documentDirectories objectAtIndex:0];
	return [documentDirectory stringByAppendingPathComponent:fileName];
}