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
    CGContextSetTextMatrix(context,CGAffineTransformIdentity);
    CGContextTranslateCTM(context,0,rect.size.height+64);
    CGContextScaleCTM(context,1.0,-1.0);
    CGPoint lineOrigins[numberOfLines];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, numberOfLines), lineOrigins);
    for (CFIndex lineIndex = 0; lineIndex < numberOfLines; lineIndex++) {
        CGPoint lineOrigin = lineOrigins[lineIndex];
        lineOrigin = CGPointMake(lineOrigin.x, lineOrigin.y);
        
        CGContextSetTextPosition(context, lineOrigin.x, lineOrigin.y);
        CTLineRef line = CFArrayGetValueAtIndex(lines, lineIndex);
        
        CGFloat descent = 0.0f;
        CGFloat ascent = 0.0f;
        CGFloat lineLeading;
        CTLineGetTypographicBounds((CTLineRef)line, &ascent, &descent, &lineLeading);
        
        // Adjust pen offset for flush depending on text alignment
        CGFloat flushFactor = NSTextAlignmentLeft;
        CGFloat penOffset;
        CGFloat y;

        penOffset = (CGFloat)CTLineGetPenOffsetForFlush(line, flushFactor, rect.size.width);
        y = lineOrigin.y - descent - [UIFont systemFontOfSize:17.0] .descender;
        CGContextSetTextPosition(context, penOffset, y);
        CTLineDraw(line, context);
    }
    
    CFRelease(frame);
    CFRelease(path);
}


@end
