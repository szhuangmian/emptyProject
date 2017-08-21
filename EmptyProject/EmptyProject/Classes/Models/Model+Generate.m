//
//  Model+Generate.m
//  JingTam
//
//  Created by HuangMian on 2017/7/17.
//  Copyright © 2017年 JingTam.Com. All rights reserved.
//

#import "Model+Generate.h"

@implementation Model_Generate

+(NSString*)modelGenOneLine:(NSString*)key{
    NSString*oneLine = [NSString stringWithFormat:@"<attribute name=\"%@\" optional=\"YES\" attributeType=\"String\" syncable=\"YES\"/>",key];
    return oneLine;
}

+(NSString*)modelGenOneLineNumber:(NSString*)key{
    NSString*oneLine = [NSString stringWithFormat:@"<attribute name=\"%@\" optional=\"YES\" attributeType=\"Integer 64\" defaultValueString=\"0\" usesScalarValueType=\"NO\" syncable=\"YES\"/>",key];
    return oneLine;
}

+(NSString*)modelString:(NSString*)jsonString modelClass:(NSString*)modelClass{
   __block NSString *modelStr = @"";
    NSString *headStr = [NSString stringWithFormat:@"<entity name=\"%@\" representedClassName=\"%@\" syncable=\"YES\" codeGenerationType=\"class\">\n",modelClass,modelClass];
    modelStr = [modelStr stringByAppendingString:headStr];
    NSDictionary *modelDic = [jsonString objectFromJSONString];
    [modelDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if([obj isKindOfClass:[NSString class]] && [NSString isNumberAble:obj]){
         
          modelStr = [modelStr stringByAppendingString:[self modelGenOneLineNumber:(NSString*)key]] ;
        
        }else{
            
          modelStr = [modelStr stringByAppendingString: [self modelGenOneLine:(NSString*)key]];
        }
        modelStr = [modelStr stringByAppendingString:@"\n"];
    }];
    NSString *tailStr = @"</entity>";
    modelStr = [modelStr stringByAppendingString:tailStr];
    
    return modelStr;
}


@end
