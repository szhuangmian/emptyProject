//
//  HomeCell.h
//  EmptyProject
//
//  Created by HuangMian on 2017/4/17.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article+CoreDataClass.h"

@interface HomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avartar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summaryWidth;

-(void)setCellType:(int)cellType;
-(void)setArticle:(Article *)article;

@end
