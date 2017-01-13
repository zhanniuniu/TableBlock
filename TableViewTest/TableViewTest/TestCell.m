//
//  TestCell.m
//  TableViewTest
//
//  Created by zhanlijun on 2017/1/4.
//  Copyright © 2017年 zhanlijun. All rights reserved.
//

#import "TestCell.h"
@interface TestCell ()
//{
//    UIButton *_button;
//}
@end
@implementation TestCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(self.frame.size.width-100, 5, 50, 40);
        [_button addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
    }
    return self;
}
- (void)buttonPress
{
    self.block(_button,self);
}
- (void)setContetnView:(NSString *)str
{
    if ([str isEqualToString:@"1"]) {
        [_button setImage:[UIImage imageNamed:@"select_y"] forState:UIControlStateNormal];
    }
    else
    {
         [_button setImage:[UIImage imageNamed:@"select_n"] forState:UIControlStateNormal];
    }
}
@end
