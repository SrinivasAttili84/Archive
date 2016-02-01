//
//  ArchiveViewController.m
//  Archive
//
//  Created by Neil Smyth on 9/18/13.
//  Copyright (c) 2013 Neil Smyth. All rights reserved.
//

#import "ArchiveViewController.h"

@interface ArchiveViewController ()

@end

@implementation ArchiveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 NSFileManager *filemgr;
 NSString *docsDir;
 NSArray *dirPaths;

 filemgr = [NSFileManager defaultManager];

 // Get the documents directory
 dirPaths = NSSearchPathForDirectoriesInDomains(
   NSDocumentDirectory, NSUserDomainMask, YES);

 docsDir = dirPaths[0];

 // Build the path to the data file
 _dataFilePath = [[NSString alloc] initWithString: [docsDir
        stringByAppendingPathComponent: @"data.archive"]];

 // Check if the file already exists
 if ([filemgr fileExistsAtPath: _dataFilePath])
 {
         NSMutableArray *dataArray;

         dataArray = [NSKeyedUnarchiver
          unarchiveObjectWithFile: _dataFilePath];

         _name.text = dataArray[0];
         _address.text = dataArray[1];
         _phone.text = dataArray[2];
 }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
     NSMutableArray *contactArray;

     contactArray = [[NSMutableArray alloc] init];
     [contactArray addObject:_name.text];
     [contactArray addObject:_address.text];
     [contactArray addObject:_phone.text];
     [NSKeyedArchiver archiveRootObject: 
       contactArray toFile:_dataFilePath];

}
@end
