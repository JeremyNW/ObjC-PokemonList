//
//  Pokemon.m
//  ObjCPokedex
//
//  Created by Jeremy Warren on 9/30/21.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _name = name;
    }
    
    return self;
}

@end
