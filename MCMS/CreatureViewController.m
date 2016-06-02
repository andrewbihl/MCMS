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
@property (weak, nonatomic) IBOutlet UITextView *accessoryEditView;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;


@property (weak, nonatomic) IBOutlet UILabel *accessoryLabel;
@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureImage.image = [UIImage imageNamed:self.creature.imageName];
    NSMutableString* accessoryString = [NSMutableString new];
    for (NSString* accessory in self.creature.accessories)
        [accessoryString appendFormat:@"\n%@", accessory];
    self.accessoryLabel.text = accessoryString;
    self.title = self.creature.name;
    self.detailLabel.text = self.creature.detail;
    self.nameLabel.text = self.title;
}

-(void)viewDidDisappear:(BOOL)animated{
    [self.delegate editNameOfCreature:self.title withDetail:self.detailLabel.text];
}

- (IBAction)onEditPressed:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        self.nameEditField.text = self.nameLabel.text;
        self.nameEditField.hidden = false;
        self.detailEditView.text = self.detailLabel.text;
        self.detailEditView.hidden = false;
        self.accessoryEditView.hidden = false;
        self.accessoryEditView.text = self.accessoryLabel.text;
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
    }
    else {
        self.nameEditField.hidden = true;
        self.nameLabel.text = self.nameEditField.text;
        self.detailEditView.hidden = true;
        self.detailLabel.text = self.detailEditView.text;
        self.accessoryEditView.hidden = true;
        self.accessoryLabel.text = self.accessoryEditView.text;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.title = self.nameLabel.text;
    }
}




@end
