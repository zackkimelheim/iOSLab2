//
//  AddItemViewController.h
//  hw2
//
//  Created by Zachary Kimelheim on 2/24/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AddItemViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    @public ViewController *controller;
    @public NSMutableArray *pickerData ;
}

@end
