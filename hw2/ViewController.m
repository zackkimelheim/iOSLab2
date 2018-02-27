//
//  ViewController.m
//  hw2
//
//  Created by Zachary Kimelheim on 2/20/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import "ViewController.h"
#import "Object_Info.h"
#import "AddItemViewController.h"
#import "StatsViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *productLabel;
@property (weak, nonatomic) IBOutlet UITextField *descLabel;
@property (weak, nonatomic) IBOutlet UITextField *costLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *statsButton;

@end

@implementation ViewController

//store management
int arrIndex = 0;
int newlyAddedTotal = 0;

//Initializing Function
- (void)viewDidLoad {
    [super viewDidLoad];
    [_productLabel setEnabled:false];
    [_descLabel setEnabled:false];
    [_costLabel setEnabled:false];
    
    //get the picker to consist of 100 numbers 
    pickerData = [[NSMutableArray alloc] init];
    for (int i=0; i<=100; i++){
        [pickerData addObject:[NSString stringWithFormat:@"%d",i]];
    }
    // Connect data to picker
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    //initialize store
    [self initStore];
    [self showDisplayAtIndex:0];
    
    [_slider setMaximumValue:[stock count] - 1];
    [_slider setValue:0 animated:YES];
    
}

//create store from pre-existing data
- (void) initStore {
    stock = [[NSMutableArray alloc]init];
    [stock addObject:[[Object_Info alloc] init:@"iPhone X" description:@"iPhone X released Fall 2017" price: 969.00 numOnHand: 2 imagePath:@"iphone"]];
    [stock addObject:[[Object_Info alloc] init:@"Galaxy Note 7" description:@"Samsung's Exploding Phone" price: 850.00 numOnHand: 90 imagePath:@"galaxy"]];
    [stock addObject:[[Object_Info alloc] init:@"40-inch TV" description:@"Sony's LED TV" price: 298.00 numOnHand: 89 imagePath:@"tv"]];
    [stock addObject:[[Object_Info alloc] init:@"Kindle Reader" description:@"Amazon's E-Reader" price: 79.99 numOnHand: 100 imagePath:@"kindle"]];
    [stock addObject:[[Object_Info alloc] init:@"Apple Watch" description:@"Series 3 - Vibranium Case" price: 299.00 numOnHand: 0 imagePath:@"watch"]];
}

//This function is used to display appropraite item on the screen, depending on where it is in the array
-(void) showDisplayAtIndex : (int) index {
    if (stock.count > index && index >= 0) {
        
        //set up if we are at beginning item
        if(index == 0) {
            [_backButton setEnabled:false];
            [_forwardButton setEnabled:true];
            arrIndex = 0;
        }
    
        Object_Info *object = [stock objectAtIndex:index];
        _productLabel.text = [object getName];
        _descLabel.text = [object getDescription];
        _costLabel.text = [NSString stringWithFormat:@"%0.2f", [object getPrice]];
        
        [_picker selectRow:[object getNumOnHand] inComponent:0 animated:YES];
        
        //change image
        _imageView.image = [UIImage imageNamed: [object getImagePath]];;
        
        [_slider setMaximumValue:[stock count] - 1];
        [_slider setValue:index animated:YES];
    }
}

//User clicks to go to next item
- (IBAction)forwardClicked:(id)sender {
    if (arrIndex == [stock count] - 2) {
        [_forwardButton setEnabled:false];
        [_forwardButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else{
        [_backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_forwardButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (arrIndex == 0) {
        [_backButton setEnabled:true];
    }
    
    //save state of current item before moving
    [self saveContent];
    
    //determine/keep track of where we are in our array
    arrIndex = (arrIndex + 1) % [stock count];
    
    //make sure we display appropriate data
    [self showDisplayAtIndex:arrIndex];
    
    
}

//User clicks to go to previous item
- (IBAction)backClicked:(id)sender {
    if (arrIndex == 1) {
        [_backButton setEnabled:false];
        [_backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else{
        [_backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_forwardButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }

    if (arrIndex == [stock count] - 1) {
        [_forwardButton setEnabled:true];
    }
    
    //save state of current item before moving
    [self saveContent];
    
    arrIndex = (arrIndex - 1) % [stock count];
    
    [self showDisplayAtIndex:arrIndex];
}

- (void) saveContent {
    Object_Info *obj = [stock objectAtIndex:arrIndex];
    
    //get current value in picker
    NSString *str = [pickerData objectAtIndex:[_picker selectedRowInComponent:0]];
    [obj setNumOnHand: [str intValue]];
    [obj setName:[_productLabel text]];
    [obj setDescription:[_descLabel text]];
    [obj setPrice:[[_costLabel text] floatValue]];
}

//User navigating to new View Controller, do necessary work
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AddItemSegue"]) {
        [self showAddItemController:segue];
    }
    else if([segue.identifier isEqualToString:@"addStatsSegue"]){
        [self showAddStatsController: segue];
    }
}


-(void) showAddStatsController: (UIStoryboardSegue *)segue{
    StatsViewController *controller = segue.destinationViewController;
    //NSLog(@"%d",[stock count]);
    controller.numItemsValue = [NSString stringWithFormat:@"%d", (int) [stock count]];
    controller.newwItemsValue = [NSString stringWithFormat:@"%d", [self newwItemsAddedTotal]];
}


-(void) showAddItemController: (UIStoryboardSegue *) segue{
    AddItemViewController *controller = segue.destinationViewController;
    controller -> controller = self;
}

- (IBAction)sliderMoved:(id)sender {
    UISlider *mySlider = (UISlider *) sender;
    int num = (int) mySlider.value;
    [self showDisplayAtIndex:num];
    [self handleButtons:num];
    arrIndex = num;
}

-(void) handleButtons: (int) val {
    if (val == 0) {
        [_backButton setEnabled:false];
        [_backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else{
        [_backButton setEnabled:true];
        [_backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if(arrIndex == [stock count] - 1){
        [_forwardButton setEnabled:false];
        [_forwardButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    }
    else {
        [_forwardButton setEnabled:true];
        [_forwardButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

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
