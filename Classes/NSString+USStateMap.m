//  NSString+USStateMap.m
//
//  Created by Norman Harebottle III on 3/14/13.
//  Copyright (c) 2013 Norman Harebottle III. All rights reserved.

#import "NSString+USStateMap.h"

@implementation NSString (USStateMap)

static NSDictionary *stateAbbreviationsMap = nil;
+ (NSDictionary *)stateAbbreviationsMap
{
    if (stateAbbreviationsMap == nil) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"USStateAbbreviations" ofType:@"plist"];
        stateAbbreviationsMap = [[NSDictionary alloc] initWithContentsOfFile:plist];
    }
    
    return stateAbbreviationsMap;
}

- (NSString *)stateAbbreviationFromFullName 
{
    return [[NSString stateAbbreviationsMap] objectForKey:self.uppercaseString];
}

- (NSString *)stateFullNameFromAbbreviation
{
    NSString *upperAbbr = [self uppercaseString];
    return [[[[NSString stateAbbreviationsMap] allKeysForObject:upperAbbr] lastObject] capitalizedString];
}
@end
