//
//  CADViewController.m
//  CADRACSwippeableCell
//
//  Created by Joan Romano on 16/04/14.
//  Copyright (c) 2014 Crows And Dogs. All rights reserved.
//

#import "CADViewController.h"

#import "CADSampleCell.h"

static NSString *const kReuseIdentifier = @"ReuseIdentifier";

@interface CADViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation CADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CADSampleCell" bundle:nil] forCellWithReuseIdentifier:kReuseIdentifier];
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CADSampleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = (CGRect){
        .size = CGSizeMake(CGRectGetWidth(collectionView.bounds)/2, CGRectGetHeight(cell.bounds))
    };
    
    cell.allowedDirection = arc4random_uniform(2);
    cell.revealView = bottomView;
    cell.text = cell.allowedDirection == CADRACSwippeableCellAllowedDirectionRight ? @"Right" : @"Left";
    
    bottomView.backgroundColor = cell.allowedDirection == CADRACSwippeableCellAllowedDirectionRight ? [UIColor redColor] : [UIColor blueColor];
    
    return cell;
}

@end
