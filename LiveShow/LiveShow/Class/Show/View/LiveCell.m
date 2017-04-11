//
//  LiveCell.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "LiveCell.h"

@interface LiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@end

@implementation LiveCell

- (void)setLive:(Live *)live {
    _live = live;
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onLineLabel.text = [@(live.online_users) stringValue];
    if ([live.creator.portrait isEqualToString:@"dahuan"]) {
        self.headView.image = [UIImage imageNamed:@"dahuan"];
        self.bigImageView.image = [UIImage imageNamed:@"dahuan"];
        
    } else {
        [self.headView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"default_room"];
        [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"default_room"];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
