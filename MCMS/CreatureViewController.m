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
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailEditView;


@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.title;
}

-(void)viewDidDisappear:(BOOL)animated{
    [self.delegate editNameOfCreature:self.title];
}

- (IBAction)onEditPressed:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        self.nameEditField.text = self.nameLabel.text;
        self.nameEditField.hidden = false;
        self.detailEditView.text = self.detailLabel.text;
        self.detailEditView.hidden = false;
        
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
    }
    else {
        self.nameEditField.hidden = true;
        self.nameLabel.text = self.nameEditField.text;
        self.detailEditView.hidden = true;
        self.detailLabel.text = self.detailEditView.text;
        
        
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.title = self.nameLabel.text;
    }
}




@end
