//
//  ViewController.m
//  CoreTextPractice
//
//  Created by Terry Bu on 3/17/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "ViewController.h"
#import "CoreTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"Didot", 30.0f, NULL); // 1-2
    NSDictionary *attrDictionary = [NSDictionary dictionaryWithObjectsAndKeys: (__bridge id)fontRef, (NSString *)kCTFontAttributeName, (id)[[UIColor blackColor] CGColor], (NSString *)(kCTForegroundColorAttributeName), nil]; // 2-2
    CFRelease(fontRef); // 3-2
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Type I, White, Always Burns, Never Tans" attributes:attrDictionary]; // 12-1
    [(CoreTextView *)[self view] setAttString:attString]; // 13-1

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
