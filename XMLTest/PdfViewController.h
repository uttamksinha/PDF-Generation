//
//  PdfViewController.h
//  XMLTest
//
//  Created by Uttam on 17/04/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdfViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *pdfView;
@property (strong, nonatomic) NSString *selectedFile;
@end
