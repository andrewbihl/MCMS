//
//  MagicalCreature.m
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString*)name withDetail:(NSString*)detail{
    self = [super init];
    if (self){
        self.name = name;
        self.detail = detail;
    }
    return self;
}

-(void)addAccessory:(NSString *)accessory{
    [self.accessories addObject:accessory];
}

-(instancetype)initWithName:(NSString*)name {
    self = [super init];
    if (self){
        self.name = name;
    }
    return self;
}

@end
