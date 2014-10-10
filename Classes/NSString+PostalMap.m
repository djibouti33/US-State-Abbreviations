//  NSString+USStateMap.m
//
//  Created by Norman Harebottle III on 3/14/13.
//  Copyright (c) 2013 Norman Harebottle III. All rights reserved.

#import "NSString+PostalMap.h"

@interface NSString (PostalMapPrivate)

+ (NSDictionary *)stateAbbreviationsMap;
+ (NSDictionary *)provinceAbbreviationsMap;

@end

@implementation NSString (USStateMap)

+ (NSDictionary *)stateAbbreviationsMap
{
    static NSDictionary *map;
    
    static dispatch_once_t onceTokenUS;
    dispatch_once(&onceTokenUS, ^{
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"USStateAbbreviations" ofType:@"plist"];
        map = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    });
    
    return map;
}

+ (NSDictionary *)provinceAbbreviationsMap
{
    static NSDictionary *map;
    
    static dispatch_once_t onceTokenCA;
    dispatch_once(&onceTokenCA, ^{
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CanadianPostalAbbreviations" ofType:@"plist"];
        map = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    });
    
    return map;
}

- (NSString *)provinceAbbreviationFromFullName
{
    return [[[self class] provinceAbbreviationsMap] objectForKey:[self uppercaseString]];
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

- (NSString *)provinceFullNameFromAbbreviation
{
    NSString *upperAbbr = [self uppercaseString];
    
    __block NSString *name = nil;
    
    [[[self class] provinceAbbreviationsMap] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqualToString:upperAbbr]) {
            name = key;
            *stop = YES;
        }
    }];
    
    return name;
}

@end
