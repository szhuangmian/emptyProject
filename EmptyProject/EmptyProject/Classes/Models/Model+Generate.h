//
//  Model+Generate.h
//  JingTam
//
//  Created by HuangMian on 2017/7/17.
//  Copyright © 2017年 JingTam.Com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Generate : NSObject

+(NSString*)modelGenOneLine:(NSString*)key;
+(NSString*)modelGenOneLineNumber:(NSString*)key;
+(NSString*)modelString:(NSString*)jsonString modelClass:(NSString*)modelClass;

@end
