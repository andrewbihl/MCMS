//
//  CreatureViewController.m
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameEditField;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onEditPressed:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        self.nameEditField.hidden = false;
        [sender setTitle:@"Done" forState:UIControlStateNormal];
    }
    else {
        self.nameEditField.hidden = true;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
    }
}




@end
