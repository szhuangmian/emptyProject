//
//  CTextPosition.m
//  EmptyProject
//
//  Created by HuangMian on 2017/4/26.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "CTextPosition.h"

@implementation CTextPosition

@synthesize position;

+(CTextPosition*)positionWithInteger:(NSUInteger)position{
    CTextPosition *p = [[CTextPosition alloc] init];
    p.position = position;
    return p;
}
@end
