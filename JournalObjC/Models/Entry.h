//
//  Entry.h
//  JournalObjC
//
//  Created by Devin Singh on 1/27/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, copy) NSDate *timestamp;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bodyText;


- (instancetype) initWithDictionary:(NSDictionary *)dictionary;
- (instancetype) initWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

- (NSDictionary *) dictionaryCopy;

@end

NS_ASSUME_NONNULL_END
