//
//  CreatureViewController.h
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "ViewController.h"

@protocol CreatureViewDelegate<NSObject>

-(void)editNameOfCreature:(NSString*)newCreatureName;

@end

@interface CreatureViewController : ViewController

@property id<CreatureViewDelegate> delegate;


@end
