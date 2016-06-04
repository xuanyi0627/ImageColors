//
//  TableViewCell.h
//  ImageColors
//
//  Created by Echo on 16/6/4.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *hexLabel;
@property (nonatomic, weak) IBOutlet UILabel *percentageLabel;
@property (nonatomic, weak) IBOutlet UIView *colorView;

@end
