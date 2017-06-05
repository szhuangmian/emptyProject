//
//  CoreTextView.m
//  EmptyProject
//
//  Created by HuangMian on 2017/6/2.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "CoreTextView.h"
#import <CoreText/CoreText.h>

@implementation CoreTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    srand([[NSDate date] timeIntervalSince1970]);
    NSString *text = @"虽然 WWDC 门票向来价格不菲，但近几年依旧一票难求，甚至有业内人士戏称需「摇号进场」。每年到场的，除了一众开发者和媒体，还有这样一群年轻青涩的面孔。\
    他们拿着苹果官方免费赠予价值 1599 美元的 WWDC 门票，部分享受着食宿补贴，他们正是每年的 WWDC 奖学金获得者——天才少年 iOS 开发者们。\
        近日，AppSo（微信号 AppSo）也采访了其中 2 位 WWDC 奖学金的初次获奖者张国政和赵培钦，95 后的他们，分享了自己的故事。\
        年仅 20 岁的新手开发者\
    来自广东工业大学（软件工程专业）的大二学生张国政，这次获奖的作品名为「Homeland（家园）」，是一个地月系统的演示项目。";
    
    UIColor* textColor = [UIColor redColor];
    
    //Set line height, font, color and break mode
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)[[UIFont systemFontOfSize:17.0] fontName], [[UIFont systemFontOfSize:17.0] pointSize],NULL);
    CTLineBreakMode lineBreakMode = kCTLineBreakByWordWrapping;

    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font,(NSString*)kCTFontAttributeName,
                                textColor.CGColor,kCTForegroundColorAttributeName,
                                nil];
    
    //Create attributed string, with applied syntax highlighting
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    //Draw the frame
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, text.length) , path, NULL);
    
    CFArrayRef lines = CTFrameGetLines(frame);
    NSInteger numberOfLines = CFArrayGetCount(lines);
    BOOL truncateLastLine = NO;//tailMode
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform transf = CGContextGetCTM(context);
    CGContextSaveGState(context);

//    CGContextSetTextMatrix(context,CGAffineTransformIdentity);
    transf = CGContextGetCTM(context);
    CGContextTranslateCTM(context,0,rect.size.height);
    transf = CGContextGetCTM(context);
    CGContextScaleCTM(context,1.0,-1.0);
    CGContextTranslateCTM(context,0,-64-2);

//    transf = CGContextGetCTM(context);
 
    CGPoint lineOrigins[numberOfLines];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, numberOfLines), lineOrigins);
    for (CFIndex lineIndex = 0; lineIndex < numberOfLines; lineIndex++) {
        CGContextSaveGState(context);
        CGPoint lineOrigin = lineOrigins[lineIndex];
        lineOrigin = CGPointMake(lineOrigin.x, lineOrigin.y);
        CGContextSetTextPosition(context, lineOrigin.x, lineOrigin.y);
        CTLineRef line = CFArrayGetValueAtIndex(lines, lineIndex);
        
        CGFloat descent = 0.0f;
        CGFloat ascent = 0.0f;
        CGFloat lineLeading;//行距，不设置为0；lineHeight = asent +descent + leading
        CTLineGetTypographicBounds((CTLineRef)line, &ascent, &descent, &lineLeading);
        CFRange range = CTLineGetStringRange(line);
        NSString *str = [[attributedStr string] substringWithRange:NSMakeRange(range.location, range.length)];
        NSLog(@"str str %@",str);
        // Adjust pen offset for flush depending on text alignment
        CGFloat flushFactor = NSTextAlignmentLeft;
        
        CGFloat penOffset;
        penOffset = (CGFloat)CTLineGetPenOffsetForFlush(line, flushFactor, rect.size.width);
        
        CGRect lineRect = CTLineGetBoundsWithOptions(line, 0);

        //CGContextSetTextPosition(context, penOffset,   lineOrigin.y);//此行注释和不注释是一样的！//lineOring在左下角，ascent是高于lineOring的偏移，descent是低于lineOring的偏移！
       // SetTextPosition是设置lineOring的值，而不是lineRect的左下角,lineRect是从左下角开始绘制
        CTLineDraw(line, context);
        CGContextRestoreGState(context);

        CGContextSaveGState(context);

        UIColor *color = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
        CGContextAddRect(context, CGRectMake(penOffset,  lineRect.origin.y + lineOrigin.y, lineRect.size.width, lineRect.size.height));
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextStrokePath(context);
        
        
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        CFIndex numberOfRuns = CFArrayGetCount(runs);
        
        CGContextAddEllipseInRect(context, CGRectMake(penOffset, lineRect.origin.y + lineOrigin.y - 5, 10, 10));
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        CGContextFillPath(context);
        
        for(CFIndex runIndexOrigin = 0;runIndexOrigin < numberOfRuns; runIndexOrigin++){
            CGContextSaveGState(context);

            CTRunRef run = CFArrayGetValueAtIndex(runs, runIndexOrigin);
            CFRange range = CTRunGetStringRange(run);
            NSString *str = [[attributedStr string] substringWithRange:NSMakeRange(range.location, range.length)];
            NSLog(@"str str%ld %@",runIndexOrigin,str);
            CGRect runRect;
            CGFloat runAscent;
            CGFloat runDescent;
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
            float offset = CTLineGetOffsetForStringIndex(line, range.location, NULL);
            float height = runAscent + runDescent;
            runRect=CGRectMake(lineOrigin.x + offset, lineOrigin.y - runDescent ,runRect.size.width, height);
            //NSRange nRange = NSMakeRange(range.location, range.length);
            UIColor *color = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
            CGContextAddRect(context, runRect);
            CGContextSetStrokeColorWithColor(context, color.CGColor);
            CGContextStrokePath(context);
            CGContextRestoreGState(context);
            
            color = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:0.5];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(runRect.origin.x, (rect.size.height - runRect.origin.y)+64+2 -runRect.size.height, runRect.size.width, runRect.size.height)];
            [view setBackgroundColor:color];
            [self addSubview:view];

        }
        NSLog(@"\n");
        CGContextRestoreGState(context);

    }
    
    CFRelease(frame);
    CFRelease(path);
    
    CGContextAddRect(context, CGRectMake(50, 150, 250, 150));
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillPath(context);

    CGContextRestoreGState(context);

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    NSLog(@"touchPoint x:%f y:%f \n",touchPoint.x,touchPoint.y);
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesMoved");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
 
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesCancelled");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];

}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesEnded");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    //[touchPoints addObject:[NSValue valueWithCGPoint:touchPoint]];
}


@end
