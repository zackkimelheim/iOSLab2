//
//  ViewController.h
//  hw2
//
//  Created by Zachary Kimelheim on 2/20/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    @public NSMutableArray *stock;
    @public NSMutableArray *pickerData ;
}

@property (nonatomic, assign) int newwItemsAddedTotal;

@end

