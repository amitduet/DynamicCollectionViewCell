//
//  ViewController.h
//  DynamicCollectionViewCell
//
//  Created by Amit Chowdhury on 11/21/16.
//  Copyright © 2016 Amit Chowdhury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>


@property (weak,nonatomic) IBOutlet UICollectionView*textCollectionView;


@end

