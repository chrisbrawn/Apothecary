//
// ImageCache.h
//  
//
//  Created by chris on 2011-05-28.
//  Programmers: Chris
//
//  Group 9 Apollo
//
//	Creates ImageCache and the ability to put and retrieve images from it. 
//  
//
//
//  Changes:
//  
//  Bugs:
// 

#import <UIKit/UIKit.h>


@interface ImageCache : NSObject {
	NSMutableDictionary *dictionary;
	

}
+(ImageCache*)sharedImageCache;
-(void)setImage:(UIImage*)i forKey:(NSString*)s;
-(UIImage*)imageForKey:(NSString*)s;
-(void)deleteImageForKey:(NSString*)s;


@end
