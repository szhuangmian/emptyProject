//
//  Article+CoreDataProperties.h
//  
//
//  Created by HuangMian on 2017/4/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Article+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Article (CoreDataProperties)

+ (NSFetchRequest<Article *> *)fetchRequest;

@property (nonatomic) int64_t aid;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSString *pic;

@end

NS_ASSUME_NONNULL_END
