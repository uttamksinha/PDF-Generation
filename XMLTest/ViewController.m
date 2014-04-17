//
//  ViewController.m
//  XMLTest
//
//  Created by Uttam on 01/03/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import "ViewController.h"
#import "PdfViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generate_pdf:(id)sender
{
    CGSize pageSize = CGSizeMake(612, 792);
    NSString *fileName = @"Demo.pdf";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"document dir %@",documentsDirectory);
    NSString *pdfFileName = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
    
    // Mark the beginning of a new page.
    //UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
    
    double currentHeight = 0.0;
    
    for (int index = 1; index <= 3 ; index++)
    {
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
        //Above line would work to make page break
        
        NSString *pngPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.jpg", index]];
        UIImage *pngImage = [UIImage imageWithContentsOfFile:pngPath];
        
        [pngImage drawInRect:CGRectMake(0, 0, pageSize.width, pngImage.size.height)];
        currentHeight += pngImage.size.height;
        
    }
    UIGraphicsEndPDFContext();
    [self performSegueWithIdentifier:@"pdfViewIdentifier" sender:pdfFileName];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"pdfViewIdentifier"]){
        ((PdfViewController *)(segue.destinationViewController)).selectedFile=sender;
    }
}


@end
