//
//  CollectionViewController.m
//  CollectionView example
//
//  Created by emiliano on 01/11/13.
//  Copyright (c) 2013 nJoyLab. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

static const NSInteger kNumberOfCells = 5;
static const NSInteger kPageWidth = 260;

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// centering
    self.collectionView.contentInset = UIEdgeInsetsMake(0, (self.view.frame.size.width-kPageWidth)/2, 0, (self.view.frame.size.width-kPageWidth)/2);
    //
    [self.collectionView addGestureRecognizer:self.dummyScrollView.panGestureRecognizer];
    self.collectionView.panGestureRecognizer.enabled = NO;
    self.dummyScrollView.delegate = self;
    [self setScrollSize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UICollectionViewDataSource


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kNumberOfCells;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    // random color
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    cell.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    return cell;
}
#pragma mark -

- (void) setScrollSize
{
    [self.dummyScrollView setContentSize:CGSizeMake( self.dummyScrollView.frame.size.width * kNumberOfCells, self.dummyScrollView.frame.size.height)];
}

#pragma mark - scrollViewDelegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.dummyScrollView) {
        CGPoint contentOffset = scrollView.contentOffset;
        contentOffset.x = contentOffset.x - self.collectionView.contentInset.left;
        self.collectionView.contentOffset = contentOffset;
    }
}
@end
