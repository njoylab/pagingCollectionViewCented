//
//  CollectionViewController.h
//  CollectionView example
//
//  Created by emiliano on 01/11/13.
//  Copyright (c) 2013 nJoyLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIScrollView *dummyScrollView;
@end
