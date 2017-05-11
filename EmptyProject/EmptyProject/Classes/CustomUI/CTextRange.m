//
//  CTextRange.m
//  EmptyProject
//
//  Created by HuangMian on 2017/4/26.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "CTextRange.h"

@implementation CTextRange

+(CTextRange*)rangeWithStart:(CTextPosition *)start end:(CTextPosition *)end{
    CTextRange *range = [[CTextRange alloc] init];
    [range setStartPosition:start];
    [range setEndPosition:end];
    return range;
}

-(BOOL)isEmpty{
    
    return ((CTextPosition*)end).position - ((CTextPosition*)start).position == 0;
}

-(unsigned long)length{
    return ((CTextPosition*)end).position - ((CTextPosition*)start).position;
}
-(UITextPosition*)start{
    return start;
}

-(void)setStartPosition:(CTextPosition *)postion{
    start = postion;
}

-(UITextPosition*)end{
    return end;
}

-(void)setEndPosition:(CTextPosition *)position{
    end = position;
}

-(id)copyWithZone:(NSZone*)zone{
    CTextRange *copy = [[[self class] allocWithZone:zone] init];
    [copy setStartPosition:(CTextPosition*)start];
    [copy setEndPosition:(CTextPosition*)end];
    return copy;
}
@end
