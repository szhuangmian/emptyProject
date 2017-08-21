//
//  Runtime+Addition.m
//  JingTam
//
//  Created by HuangMian on 2017/7/17.
//  Copyright © 2017年 JingTam.Com. All rights reserved.
//

#import "Runtime+Addition.h"
#import <objc/runtime.h>

@implementation Runtime

+ (NSArray*)getProperties:(Class)cls{
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];
        
        const char *cType = property_getAttributes(property);
        NSString *type = [NSString stringWithCString:cType encoding:NSUTF8StringEncoding];
        
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:[NSDictionary dictionaryWithObject:name forKey:type]];
    }
    return mArray;
}

@end
