//
//  ViewController.m
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "ViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,CreatureViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray* creatures;

@end

@implementation ViewController

-(void)editNameOfCreature:(NSString *)newCreatureName{
    NSIndexPath* editedCreaturePath = [self.tableView indexPathForSelectedRow];
    MagicalCreature* creatureEdited = [self.creatures objectAtIndex:editedCreaturePath.row];
    creatureEdited.name = newCreatureName;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures = [NSMutableArray new];
    MagicalCreature* creature1 = [[MagicalCreature alloc]initWithName:@"Chris, Protector of the Night Realm"];
    MagicalCreature* creature2 = [[MagicalCreature alloc]initWithName:@"Andrew"];
    MagicalCreature* creature3 = [[MagicalCreature alloc]initWithName:@"BEN"];
    [self.creatures addObjectsFromArray:@[creature1,creature2,creature3]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onAddPressed:(id)sender {
    MagicalCreature* newCreature = [[MagicalCreature alloc]initWithName:self.textField.text];
    [self.creatures addObject:newCreature];
    self.textField.text = @"";
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalCreature* current = self.creatures[indexPath.row];
    cell.textLabel.text = current.name;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CreatureViewController* dvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    MagicalCreature *current = [self.creatures objectAtIndex:indexPath.row];
    dvc.title = current.name;
    dvc.delegate = self;
}



@end
