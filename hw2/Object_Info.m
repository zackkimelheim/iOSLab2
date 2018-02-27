//
//  Object_Info.m
//  hw2
//
//  Created by Zachary Kimelheim on 2/22/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import "Object_Info.h"

@implementation Object_Info

//init 
- (id) init: (NSString *) name description: (NSString *) description price: (double) price numOnHand: (int) numOnHand imagePath: (NSString *) imagePath {
    if(self = [super init]) {
        _name = name;
        _description = description;
        _imagePath = imagePath;
        _price = price;
        _numOnHand = numOnHand;
    }
    return self;
}
//Getters
- (NSString *) getName {
    return _name;
}
- (NSString *) getDescription {
    return _description;
}
- (NSString *) getImagePath {
    return _imagePath;
}
- (double) getPrice {
    return _price;
}
- (int) getNumOnHand {
    return _numOnHand;
}

//Setters
- (void) setName: (NSString *) name {
    _name = name;
}
- (void) setDescription:(NSString *) desc {
    _description = desc;
}
- (void) setImagePath:(NSString *) imagePath {
    _imagePath = imagePath;
}
- (void) setPrice:(double)price {
    _price = price;
}
- (void) setNumOnHand:(int)numOnHand{
    _numOnHand = numOnHand;
}

@end
