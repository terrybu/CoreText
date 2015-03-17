//
//  CoreTextView.m
//  CoreTextPractice
//
//  Created by Terry Bu on 3/17/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "CoreTextView.h"

@implementation CoreTextView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext(); // 1-1
    
    // Flip the coordinate system - otherwise, CoreText will draw the string upside-down and illegible
    CGContextSetTextMatrix(context, CGAffineTransformIdentity); // 2-1
    CGContextTranslateCTM(context, 0, self.bounds.size.height); // 3-1
    CGContextScaleCTM(context, 1.0, -1.0); // 4-1
    
    CGMutablePathRef path = CGPathCreateMutable(); // 5-2
//    CGPathAddRect(path, NULL, CGRectMake(0, 0, 400.0, 600.0)); // 6-2
    CGPathAddRoundedRect(path, NULL, CGRectMake(15, -66, self.frame.size.width, self.frame.size.height), 100, 100);
    
    //Just drawing a circle for reference
    CGContextBeginPath(context); //begin path makes sure that we are doing a new path
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGContextAddPath(context, path);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokePath(context);
 
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self.attString); // 7-2
    CTFrameRef theFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [self.attString length]), path, NULL); // 8-2
    CFRelease(framesetter); // 9-2
    CFRelease(path); // 10-2
    CTFrameDraw(theFrame, context); // 11-2
    CFRelease(theFrame); // 12-2
}

@end
