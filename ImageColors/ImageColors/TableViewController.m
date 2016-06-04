//
//  TableViewController.m
//  ImageColors
//
//  Created by Echo on 16/6/4.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "UIImage+Colors.h"
#import "UIColor+Convert.h"

@interface TableViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *headerImageView;
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;
@property (nonatomic, weak) IBOutlet UIButton *previousButton;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, assign) CGFloat hue;
@property (nonatomic, assign) CGFloat saturation;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, strong) UIColor *mainColor;

@property (nonatomic, assign) NSInteger curPage;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 9 / 16 + 100);
    
    _curPage = 0;
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *colordic = [self.colors objectAtIndex:indexPath.row];
    UIColor *color = [colordic objectForKey:@"color"];
    cell.hexLabel.text = [color hexStringFromColor];
    float percentage = [[colordic objectForKey:@"percentage"] floatValue];
    cell.percentageLabel.text = [NSString stringWithFormat:@"%.2f",percentage];
    cell.colorView.backgroundColor = color;
    if ([color Brightness] < 0.8) {
        cell.hexLabel.textColor = [UIColor colorWithRed:0.99 green:0.9902 blue:0.9899 alpha:1.0];
        cell.percentageLabel.textColor = [UIColor colorWithRed:0.99 green:0.9902 blue:0.9899 alpha:1.0];
    }
    else {
        cell.hexLabel.textColor = [UIColor colorWithRed:0.1781 green:0.1715 blue:0.2274 alpha:1.0];
        cell.percentageLabel.textColor = [UIColor colorWithRed:0.1781 green:0.1715 blue:0.2274 alpha:1.0];
    }
    return cell;
}


-(void)refresh {
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",_curPage]];
    self.headerImageView.image = image;
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[image mainColoursInDetail:6]];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"percentage" ascending:YES];
    self.colors = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    self.mainColor = [[self.colors lastObject] objectForKey:@"color"];
    self.textLabel.backgroundColor = self.mainColor;
    
    if ([self.mainColor Brightness] < 0.8) {
        self.textLabel.textColor = [UIColor colorWithRed:0.99 green:0.9902 blue:0.9899 alpha:1.0];
        self.nextButton.titleLabel.textColor = [UIColor colorWithRed:0.99 green:0.9902 blue:0.9899 alpha:1.0];
        self.previousButton.titleLabel.textColor = [UIColor colorWithRed:0.99 green:0.9902 blue:0.9899 alpha:1.0];
    }
    else {
        self.textLabel.textColor = [UIColor colorWithRed:0.1781 green:0.1715 blue:0.2274 alpha:1.0];
        self.nextButton.titleLabel.textColor = [UIColor colorWithRed:0.1781 green:0.1715 blue:0.2274 alpha:1.0];
        self.previousButton.titleLabel.textColor = [UIColor colorWithRed:0.1781 green:0.1715 blue:0.2274 alpha:1.0];
    }
    
    [self.tableView reloadData];
}

-(IBAction)next:(id)sender {
    if (_curPage < 10) {
        _curPage = _curPage + 1;
        [self refresh];
    }
}

-(IBAction)preview:(id)sender {
    if (_curPage > 0) {
        _curPage = _curPage - 1;
        [self refresh];
    }
}

@end
