//
//  ViewController.m
//  DynamicCollectionViewCell
//
//  Created by Amit Chowdhury on 11/21/16.
//  Copyright © 2016 Amit Chowdhury. All rights reserved.
//

#import "ViewController.h"
#import "CategoryCollectionViewCell.h"

#define CATEGORY_CELL_IDENTIFIER @"cellIdentifier"


@interface ViewController ()

@property (nonatomic,strong) NSArray *categoryList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _categoryList = @[@"3D and HD Wallpapers",
                      @"Abstract Wallpapers",
                      @"Animals",
                      @"Army",
                      @"Beach",
                      @"Bikes & Motorcycle",
                      @"Brands",
                      @"Buildings And Architecture",
                      @"Cars",
                      @"Cartoon - Anime",
                      @"Celebrity",
                      @"Creative Wallpapers",
                      @"Cute Wallpapers",
                      @"Food and drink",
                      @"Funny Wallpapers",
                      @"Games",
                      @"Girls and models",
                      @"Holidays",
                      @"Landscapes",
                      @"Love",
                      @"Macro",
                      @"Make-up",
                      @"Miscellaneous",
                      @"Movies",
                      @"Music",
                      @"Nature",
                      @"Planes",
                      @"Seasons",
                      @"Water"];
    
    [_textCollectionView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:CATEGORY_CELL_IDENTIFIER];
    [_textCollectionView registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CATEGORY_CELL_IDENTIFIER];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Collectionview Delegates & Datasource


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _categoryList.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
        CategoryCollectionViewCell *cell= (CategoryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CATEGORY_CELL_IDENTIFIER forIndexPath:indexPath];
        cell.categoryNameLabel.text = [_categoryList objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor grayColor];
        return cell;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
        CGSize calCulateSizze =[(NSString*)[_categoryList objectAtIndex:indexPath.row] sizeWithAttributes:NULL];
        calCulateSizze.width = calCulateSizze.width+50;
        calCulateSizze.height = 50;
        return calCulateSizze;
        
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Selected Category" message: [_categoryList objectAtIndex:indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];

}


@end
