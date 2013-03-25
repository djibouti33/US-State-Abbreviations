//  NSString+USStateMap.m
//
//  Created by Norman Harebottle III on 3/14/13.
//  Copyright (c) 2013 Norman Harebottle III. All rights reserved.

#import "NSString+USStateMap.h"

@implementation NSString (USStateMap)

NSDictionary * stateAbbreviationMap;

+ (void) initialize
{
    // in my init
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"USStateAbbreviations" ofType:@"plist"];
    stateAbbreviationMap = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
}

- (NSString*) stateAbbreviationFromFullName
{
    return [stateAbbreviationMap objectForKey:[self uppercaseString]];
}

- (NSString*) stateFullNameFromAbbreviation
{
    NSString * upperAbbr = [self uppercaseString];
    
    for(NSString * abbreviation in [stateAbbreviationMap allValues])
    {
        if([abbreviation isEqualToString:upperAbbr])
            return [stateAbbreviationMap objectForKey:upperAbbr];
    }
    return nil;
}
@end
