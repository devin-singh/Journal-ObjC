//
//  DetailViewController.m
//  JournalObjC
//
//  Created by Devin Singh on 1/27/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_entry)
    {
        [self updateWithEntry:_entry];
    }
}

- (void)updateWithEntry:(Entry *)entry
{
    _titleTextField.text = entry.title;
    _bodyTextView.text = entry.bodyText;
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender
{
    
    if (_entry)
    {
        [EntryController.shared updateEntry:_entry title:_titleTextField.text bodyText:_bodyTextView.text];
    }
    else
    {
        Entry *entryToAdd = [[Entry alloc]initWithTitle:_titleTextField.text bodyText:_bodyTextView.text];
        [EntryController.shared addEntry:entryToAdd];
    }
    
    
    [[self navigationController] popViewControllerAnimated:true];
}

- (IBAction)clearButtonPressed:(UIButton *)sender
{
    _titleTextField.text = @"";
    _bodyTextView.text = @"";
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
