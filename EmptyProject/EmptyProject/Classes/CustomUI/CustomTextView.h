//
//  CustomTextView.h
//  EmptyProject
//
//  Created by HuangMian on 2017/4/24.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTextPosition.h"
#import "CTextRange.h"

@interface CustomTextView : UIView<UITextInput>{
    UITextInputStringTokenizer *tokenizer;
    NSString *currentMarkedText;
    NSRange currentMarkedRange;
    NSRange currentMarkedSelectedRange;
    UITextRange *selectedTextRange;

}

@property (nonatomic, assign) id <UITextInputDelegate> inputDelegate;
@property (nonatomic, readonly) id <UITextInputTokenizer> tokenizer;
@property (nonatomic, retain) NSString *currentMarkedText;


@end
