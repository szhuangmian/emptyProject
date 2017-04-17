//
//  Article+CoreDataProperties.m
//  
//
//  Created by HuangMian on 2017/4/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Article+CoreDataProperties.h"

@implementation Article (CoreDataProperties)

+ (NSFetchRequest<Article *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Article"];
}

@dynamic aid;
@dynamic title;
@dynamic content;
@dynamic pic;

@end
