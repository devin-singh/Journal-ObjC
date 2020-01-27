//
//  EntryController.h
//  JournalObjC
//
//  Created by Devin Singh on 1/27/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

@property (nonatomic, strong) NSMutableArray *entries;

+ (EntryController *)shared;

- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;


- (void) addEntry:(Entry *)entry;
- (void) removeEntry:(Entry *)entry;
- (void) updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;


@end

NS_ASSUME_NONNULL_END
