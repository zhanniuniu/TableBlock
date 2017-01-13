//
//  TestCell.h
//  TableViewTest
//
//  Created by zhanlijun on 2017/1/4.
//  Copyright © 2017年 zhanlijun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestCell;
typedef void (^myBlock)(UIButton *btn,TestCell *mycell);

@interface TestCell : UITableViewCell

@property(copy,nonatomic)myBlock block;
@property(nonatomic,strong)UIButton *button;

- (void)setContetnView:(NSString *)str;
@end
