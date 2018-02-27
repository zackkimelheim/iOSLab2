//
//  AddItemViewController.m
//  hw2
//
//  Created by Zachary Kimelheim on 2/24/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import "AddItemViewController.h"
#import "Object_Info.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *productLabel;
@property (weak, nonatomic) IBOutlet UITextField *descLabel;
@property (weak, nonatomic) IBOutlet UITextField *costLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *numOnHandPicker;
@property (weak, nonatomic) IBOutlet UIButton *addItem;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;


@end

//keeps track of total number of times user adds item to store
//this data is passed back to View Controller then spread to StatsVC
int added = 0;


@implementation AddItemViewController

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)addItemPressed:(id)sender {
    NSMutableArray *stock1 = controller->stock;
    
     int numOnHand = [[pickerData objectAtIndex:[_numOnHandPicker selectedRowInComponent:0]]intValue];
    NSString *name = [_productLabel text];
    NSString *descr = [_descLabel text];
    float cost = [[_costLabel text] floatValue];
    [stock1 addObject:[[Object_Info alloc] init:name description:descr price: cost numOnHand: numOnHand imagePath:@"notfound.jpeg"]];
    
    added++;
    controller.newwItemsAddedTotal = added;
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //get the picker to consist of 100 numbers
    pickerData = [[NSMutableArray alloc] init];
    for (int i=0; i<=100; i++){
        [pickerData addObject:[NSString stringWithFormat:@"%d",i]];
    }
    // Connect data
    self.numOnHandPicker.dataSource = self;
    self.numOnHandPicker.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerData count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerData objectAtIndex:row];
}

@end
