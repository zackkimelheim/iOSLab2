//
//  Object_Info.h
//  hw2
//
//  Created by Zachary Kimelheim on 2/22/18.
//  Copyright © 2018 New York University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject{
    NSString *_name;
    NSString *_description;
    NSString *_imagePath;
    double _price;
    int _numOnHand;
}
- (id) init: (NSString *) name description: (NSString *) description price: (double) price numOnHand: (int) numOnHand imagePath: (NSString *) imagePath;

// Getters

- (NSString *) getName;
- (NSString *) getDescription;
- (NSString *) getImagePath;
- (double) getPrice;
- (int) getNumOnHand;

//Setters
- (void) setName: (NSString *) name;
- (void) setDescription: (NSString *) desc;
- (void) setImagePath: (NSString *) imagePath;
- (void) setPrice: (double) price;
- (void) setNumOnHand: (int) numOnHand;




@end
