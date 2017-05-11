//
//  CustomTextView.m
//  EmptyProject
//
//  Created by HuangMian on 2017/4/24.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "CustomTextView.h"

@interface CustomTextView (){
    
}
@property(nonatomic,strong)NSMutableString *textStoreString;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,strong)UIColor *textColor;
@end


@implementation CustomTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize inputDelegate;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        self.textStoreString = [NSMutableString string];
        self.font = [UIFont systemFontOfSize:15.0];
        self.textColor = [UIColor grayColor];
        self.currentMarkedText = [NSMutableString string];
        UITextRange *range = [CTextRange rangeWithStart:[CTextPosition positionWithInteger:0]
                                                   end:[CTextPosition positionWithInteger:0]];
        [self setSelectedTextRange:range];
    }
    return self;
}

- (void)setSelectedTextRange:(UITextRange *)aSelectedTextRange {
    NSLog(@"%s", __func__);
    
    [self.inputDelegate selectionWillChange:self];
    
    selectedTextRange = [aSelectedTextRange copy];
    
    [self.inputDelegate selectionDidChange:self];
    
    [self setNeedsDisplay];
}

- (BOOL)hasText{
    
    return self.textStoreString.length>0;
}

- (void)insertText:(NSString *)text{
    NSLog(@"%s", __func__);
    NSLog(@"%@", text);
    [self.inputDelegate textWillChange:self];

    [self.textStoreString appendString:text];
    [self.inputDelegate textDidChange:self];

    [self setNeedsDisplay];
}
- (void)deleteBackward{
    if ([self.textStoreString length] == 0) {
        return;
    }
    
    [self.textStoreString deleteCharactersInRange:NSMakeRange(self.textStoreString.length-1, 1)];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    CGRect rectForText = [self rectForTextWithInset:8.0f];

    [self.textColor set];
    UIRectFrame(rect);
    [self.textStoreString drawInRect:rectForText withAttributes:nil];
}
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self isFirstResponder]) {
        [self becomeFirstResponder];
    }
}
- (CGRect)rectForTextWithInset:(CGFloat)inset {
    return CGRectInset(self.bounds, inset, inset);
}
- (UIKeyboardType)keyboardType {
    return UIKeyboardTypeASCIICapable;
}

- (NSString *)textInRange:(UITextRange *)range {
    NSLog(@"%s", __func__);
    
    //    NSUInteger length = [(TextPosition *)range.end position] - [(TextPosition *)range.start position];
    //    return [self.textStore substringWithRange:NSMakeRange([(TextPosition *)range.start position], length)];
    return self.textStoreString;
}

- (void)replaceRange:(UITextRange *)range withText:(NSString *)text {
    NSLog(@"%s", __func__);
    
    [self.inputDelegate textWillChange:self];
    
    // Replace the characters in the string
    NSUInteger start = [(CTextPosition *)range.start position];
    NSUInteger length = [(CTextPosition *)range.end position] - start;
    [self.textStoreString replaceCharactersInRange:NSMakeRange(start, length) withString:text];
    
    // Place caret at the end of the previously selected text.
    CTextPosition *c = [CTextPosition positionWithInteger: start + [text length]];
    UITextRange *newRange = [CTextRange rangeWithStart:c  end:c];
    [self setSelectedTextRange:newRange];
    
    [self.inputDelegate textDidChange:self];
    
    [self setNeedsDisplay];
}



- (UITextRange *)selectedTextRange {
    NSLog(@"%s", __func__);
    return [CTextRange rangeWithStart:[CTextPosition positionWithInteger:0] end:[CTextPosition positionWithInteger:[currentMarkedText length]]];
}


- (id<UITextInputTokenizer>)tokenizer {
    NSLog(@"%s", __func__);
    if (tokenizer == nil) {
        tokenizer = [[UITextInputStringTokenizer alloc] initWithTextInput:self];
    }
    return tokenizer;
}

- (UITextPosition *)beginningOfDocument; {
    NSLog(@"%s", __func__);
    return [CTextPosition positionWithInteger:0];
}
- (UITextPosition *)endOfDocument {
    NSLog(@"%s", __func__);
    return [CTextPosition positionWithInteger:[self.textStoreString length] - 1];
}

#pragma mark Methods for creating ranges and positions.

- (UITextRange *)textRangeFromPosition:(UITextPosition *)fromPosition toPosition:(UITextPosition *)toPosition {
    NSLog(@"%s", __func__);
    return [CTextRange rangeWithStart:(CTextPosition *)fromPosition end:(CTextPosition *)toPosition];
}
- (UITextPosition *)positionFromPosition:(UITextPosition *)position offset:(NSInteger)offset {
    NSLog(@"%s", __func__);
    CTextPosition *p = (CTextPosition *)position;
    return [CTextPosition positionWithInteger:[p position] + offset];
}
- (NSComparisonResult)comparePosition:(UITextPosition *)position toPosition:(UITextPosition *)other {
    NSLog(@"%s", __func__);
    /*
     NSOrderedAscending
     The left operand is smaller than the right operand.
     Available in iPhone OS 2.0 and later.
     Declared in NSObjCRuntime.h.
     
     NSOrderedSame
     The two operands are equal.
     Available in iPhone OS 2.0 and later.
     Declared in NSObjCRuntime.h.
     
     NSOrderedDescending
     The left operand is greater than the right operand.
     Available in iPhone OS 2.0 and later.
     Declared in NSObjCRuntime.h.
     */
    
    int a = [(CTextPosition *)position position];
    int b = [(CTextPosition *)other position];
    
    NSComparisonResult result;
    if ( a < b ) result = NSOrderedAscending;
    else if ( a > b ) result = NSOrderedDescending;
    else result = NSOrderedSame;
    
    NSLog(@"a: %d b: %d result: %d",a,b,result);
    
    return result;
}

- (UITextRange *)markedTextRange; {
    NSLog(@"%s", __func__);
    return nil;
}

- (void)setMarkedTextStyle:(NSDictionary *)style {
    NSLog(@"%s", __func__);
    NSLog(@"%@", style);
}

- (NSDictionary *)markedTextStyle {
    NSLog(@"%s", __func__);
    return nil;
}

- (void)setMarkedText:(NSString *)markedText selectedRange:(NSRange)selectedRange {
    NSLog(@"%s", __func__);
    NSLog(@"markedText: %@  selectedRange: %@", markedText, NSStringFromRange(selectedRange));
    
    self.currentMarkedText = markedText;
    currentMarkedSelectedRange = selectedRange;
    
    [self setNeedsDisplay];
}

- (void)unmarkText {
    NSLog(@"%s", __func__);
    [self.textStoreString appendString:currentMarkedText];
    self.currentMarkedText = [NSMutableString string];
    currentMarkedSelectedRange = NSMakeRange(NSNotFound, 0);
}


- (NSInteger)offsetFromPosition:(UITextPosition *)from toPosition:(UITextPosition *)toPosition {
    NSLog(@"%s", __func__);
    
    int a = [(CTextPosition *)from position];
    int b = [(CTextPosition *)toPosition position];
    NSInteger result = b - a;
    
    NSLog(@"from: %d to: %d result: %d",a,b,result);
    
    return result;
}

#pragma mark Writing direction

- (UITextWritingDirection)baseWritingDirectionForPosition:(UITextPosition *)position inDirection:(UITextStorageDirection)direction; {
    NSLog(@"%s", __func__);
    return UITextWritingDirectionLeftToRight;
}

- (void)setBaseWritingDirection:(UITextWritingDirection)writingDirection forRange:(UITextRange *)range {
    NSLog(@"%s", __func__);
}
@end
