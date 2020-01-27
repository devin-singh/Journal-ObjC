//
//  Entry.m
//  JournalObjC
//
//  Created by Devin Singh on 1/27/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import "Entry.h"

@implementation Entry


static NSString * const titleKey = @"title";
static NSString * const bodyTextKey = @"bodyText";

- (instancetype) initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self)
    {
        _bodyText = bodyText;
        _title = title;
    }
    return self;
    
}
- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    if (dictionary[titleKey] == nil || dictionary[bodyTextKey] == nil) {
        return nil;
    }
    
    self = [super init];
    if (self)
    {
        _title = dictionary[titleKey];
        _bodyText = dictionary[bodyTextKey];
    }
    return self;
}

- (NSDictionary *) dictionaryCopy
{
    NSMutableDictionary *dictionaryToReturn = [NSMutableDictionary new];
    
    dictionaryToReturn[titleKey] = self.title;
    dictionaryToReturn[bodyTextKey] = _bodyText;
    
    return [dictionaryToReturn copy];
    
}

@end
