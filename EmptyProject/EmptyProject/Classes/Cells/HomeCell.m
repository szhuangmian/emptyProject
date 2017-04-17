//
//  HomeCell.m
//  EmptyProject
//
//  Created by HuangMian on 2017/4/17.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "HomeCell.h"
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    _avartar.layer.cornerRadius = 20;
    _avartar.layer.masksToBounds = YES;
    _imageHeight.constant = ACTUAL_IMAGE_HEIGHT;
    _titleWidth.constant = SCREEN_WIDTH - 16;
    _summaryWidth.constant = SCREEN_WIDTH - 16;
    
//    _title.text = @"尾巴图赏｜山灵 M2s 无损播放器：润如玉，声如磐尾巴图赏s 无损播放器：润如玉，声如磐";
//    _summary.text = @"在这个看“脸”的时代，播放器若要吸引人，颜值必须得到位！秉承着这样一个思路，山灵 M2s 正式亮相了。在这个看“脸”的时代，播放器若要吸引人，颜值必须得到位！秉承着这样一个思路，山灵 M2s 正式亮相了。";
    _title.text = @"山灵 M2s 无损播放器：润如玉，声如磐";
    _summary.text = @"在这个看“脸”的时代，播放器若要吸引人";
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setArticle:(Article *)article{
    
}

-(void)setCellType:(int)cellType{
    if(cellType == 0){
        _title.text = @"山灵 M2s 无损播放器：润如玉，声如磐";
        _summary.text = @"在这个看“脸”的时代，播放器若要吸引人";
    }else if (cellType == 1){
        _title.text = @"山灵 M2s 无损播放器：润如玉，声如磐";
       _summary.text = @"在这个看“脸”的时代，播放器若要吸引人，颜值必须得到位！秉承着这样一个思路，山灵 M2s 正式亮相了。在这个看“脸”的时代，播放器若要吸引人，颜值必须得到位！秉承着这样一个思路，山灵 M2s 正式亮相了。";
    }else if(cellType == 2){
        _title.text = @"尾巴图赏｜山灵 M2s 无损播放器：润如玉，声如磐尾巴图赏s 无损播放器：润如玉，声如磐";
        _summary.text = @"在这个看“脸”的时代，播放器若要吸引人";

    }else{
         _title.text = @"尾巴图赏｜山灵 M2s 无损播放器：润如玉，声如磐尾巴图赏s 无损播放器：润如玉，声如磐";
         _summary.text = @"在这个看“脸”的时代，播放器若要吸引人，颜值必须得到位！秉承着这样一个思路，山灵 M2s 正式亮相了。在这个看“脸”的时代，播放器若要吸引人，颜值必须得到位！秉承着这样一个思路，山灵 M2s 正式亮相了。";
    }
}

@end
