//  NSString+USStateMap.m
//
//  Created by Norman Harebottle III on 3/14/13.
//  Copyright (c) 2013 Norman Harebottle III. All rights reserved.

#import "NSString+USStateMap.h"

@interface NSString (USStateMapPrivate)

+ (NSDictionary *)stateAbbreviationsMap;

@end

@implementation NSString (USStateMap)

+ (NSDictionary *)stateAbbreviationsMap
{
    static NSDictionary *map;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"USStateAbbreviations" ofType:@"plist"];
        map = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    });
    
    return map;
}

- (NSString *)stateAbbreviationFromFullName
{
    return [[[self class] stateAbbreviationsMap] objectForKey:[self uppercaseString]];
}

- (NSString *)stateFullNameFromAbbreviation
{
    NSString *upperAbbr = [self uppercaseString];
    
    __block NSString *name = nil;
    
    [[[self class] stateAbbreviationsMap] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqualToString:upperAbbr]) {
            name = key;
            *stop = YES;
        }
    }];
    
    return name;
}

@end
