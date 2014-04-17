//
//  PdfViewController.m
//  XMLTest
//
//  Created by Uttam on 17/04/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import "PdfViewController.h"

@interface PdfViewController ()

@end

@implementation PdfViewController
@synthesize pdfView,selectedFile;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    //NSArray * docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //Define new path for database in the documents directory because data cannot be written in the resource folder.
    //NSString * pdfPath = [[docPath objectAtIndex:0] stringByAppendingPathComponent:selectedFile];
    NSURL *pdfURL = [[NSURL alloc]initFileURLWithPath:selectedFile];
    NSURLRequest *pdfReq = [[NSURLRequest alloc] initWithURL:pdfURL];
    [pdfView loadRequest:pdfReq];
}

- (void)viewDidUnload
{
    pdfView=nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
