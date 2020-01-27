//
//  DetailViewController.h
//  JournalObjC
//
//  Created by Devin Singh on 1/27/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (strong, nonatomic) Entry *entry;

- (void) updateWithEntry:(Entry *)entry;


@end

NS_ASSUME_NONNULL_END
