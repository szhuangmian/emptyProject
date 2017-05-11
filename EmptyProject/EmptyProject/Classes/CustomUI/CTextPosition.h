//
//  CTextPosition.h
//  EmptyProject
//
//  Created by HuangMian on 2017/4/26.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTextPosition : UITextPosition

@property(nonatomic,assign)NSUInteger position;
+(CTextPosition*)positionWithInteger:(NSUInteger)position;

@end
