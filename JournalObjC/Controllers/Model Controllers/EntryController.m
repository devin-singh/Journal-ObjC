//
//  EntryController.m
//  JournalObjC
//
//  Created by Devin Singh on 1/27/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)shared
{
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
    });
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _entries = [NSMutableArray new];
    }
    [self loadFromPersistentStore];
    return self;
}

- (void) addEntry:(Entry *)entry
{
    
    [_entries addObject:entry];
    [self saveToPersistentStore];
    
}

- (void) removeEntry:(Entry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStore];
}

- (void) updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
    [self saveToPersistentStore];
}

- (void)saveToPersistentStore {
    NSMutableArray *entriesToSave = [NSMutableArray<NSDictionary *> new];
    for (Entry *entry in self.entries) {
        [entriesToSave addObject:[entry dictionaryCopy]];
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:entriesToSave
                                                       options:kNilOptions
                                                         error:&error];
    if (error) {
        NSLog(@"Unable to convert entries to JSON: %@", error);
        return;
    }
    NSURL *url = [EntryController persistentStoreFileURL];
    [jsonData writeToURL:url atomically:YES];
}
- (void)loadFromPersistentStore {
    NSURL *url = [EntryController persistentStoreFileURL];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error loading JSON data from file: %@", error);
        return;
    }
    NSArray *rawEntries = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error converting JSON data to NSObject: %@", error);
        return;
    }
    NSMutableArray *newEntries = [NSMutableArray new];
    for (NSDictionary *entryDict in rawEntries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDict];
        if (entry) {
            [newEntries addObject:entry];
        }
    }
    self.entries = newEntries;
}
+ (NSURL *)persistentStoreFileURL {
    NSArray<NSURL *> *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                    inDomains:NSUserDomainMask];
    return [urls[0] URLByAppendingPathComponent:@"journal.json"];
}


@end
