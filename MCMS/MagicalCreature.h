//
//  MagicalCreature.h
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
-(instancetype)initWithName:(NSString*)name withDetail:(NSString*)detail;
-(instancetype)initWithName:(NSString*)name;
-(void)addAccessory:(NSString*)accessory;
@property NSString* name;
@property NSString* detail;
@property NSMutableArray* accessories;
@property NSString* imageName;

@end
