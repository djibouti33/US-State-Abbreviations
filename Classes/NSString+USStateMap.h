//  NSString+USStateMap.h
//
//  Created by Norman Harebottle III on 3/14/13.
//  Copyright (c) 2013 Norman Harebottle III. All rights reserved.

#import <Foundation/Foundation.h>

@interface NSString (USStateMap)
- (NSString*) stateAbbreviationFromFullName;
- (NSString*) stateFullNameFromAbbreviation;
@end
