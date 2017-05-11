//
//  CTextRange.h
//  EmptyProject
//
//  Created by HuangMian on 2017/4/26.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTextPosition.h"

@interface CTextRange : UITextRange<NSCopying>{
    @private
    UITextPosition *start;
    UITextPosition *end;
}

+(CTextRange*)rangeWithStart:(CTextPosition*)start end:(CTextPosition*)end;
-(void)setStartPosition:(CTextPosition*)star;
-(void)setEndPosition:(CTextPosition*)end;
-(unsigned long)length;

@end
