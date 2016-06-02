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
#import "BattleViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,CreatureViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray* creatures;
@property (weak, nonatomic) IBOutlet UITextField *detailField;
@property NSArray* imageNames;
@property BOOL choosingFighters;
@property MagicalCreature* fighter1;
@property MagicalCreature* fighter2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *battleButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseFightersButton;

@end

@implementation ViewController

-(void)editNameOfCreature:(NSString *)newCreatureName withDetail:(NSString *)newCreatureDetail{
    NSIndexPath* editedCreaturePath = [self.tableView indexPathForSelectedRow];
    MagicalCreature* creatureEdited = [self.creatures objectAtIndex:editedCreaturePath.row];
    creatureEdited.name = newCreatureName;
    creatureEdited.detail = newCreatureDetail;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.battleButton setEnabled:false];
    self.imageNames = [NSArray arrayWithObjects:@"CreepyChris",@"CreepyAndrew",@"Creature2",@"Creature3",@"CreatureLast",@"Evil Jigglypuff",@"Eduardo",/*@"Mac.png",@"Bloo.png",@"Coco.png",@"Wilt.png",@"Cheese.png",@"MrHerriman",*/ nil];
    self.creatures = [NSMutableArray new];
    MagicalCreature* creature1 = [[MagicalCreature alloc]initWithName:@"The Blue Mamba"];
    creature1.imageName = [self getImageForCreature];
    MagicalCreature* creature2 = [[MagicalCreature alloc]initWithName:@"Boaty McBoatface"];
    creature2.imageName = [self getImageForCreature];
    MagicalCreature* creature3 = [[MagicalCreature alloc]initWithName:@"Avatar" withDetail:@"The Ugliest Airbender"];
    creature3.imageName = [self getImageForCreature];
    self.title = @"MCMS";
    [self.creatures addObjectsFromArray:@[creature1,creature2,creature3]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onChooseFighters:(UIButton *)sender {
    if (self.choosingFighters){
        [sender setTitle:@"Choose Fighters" forState:UIControlStateNormal];
        [self.battleButton setEnabled:false];
        self.tableView.allowsMultipleSelection = false;
        self.choosingFighters = false;
        //go to battle scene
    }
    else{
        [sender setTitle:@"Cancel" forState:UIControlStateNormal];
        NSLog(@"TESTING");
        self.tableView.allowsMultipleSelection = true;
        self.choosingFighters = true;
    }
    
}


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.indexPathsForSelectedRows.count > 1)
        return nil;
    else
        return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.choosingFighters){
        self.fighter2 = self.fighter1;
        self.fighter1 = [self.creatures objectAtIndex:indexPath.row];
        if (!(self.fighter2 == NULL))
            [self.battleButton setEnabled:true];
    }
    NSLog(@"Fighter1: %@, Fighter2: %@",self.fighter1.name,self.fighter2.name);
}
- (IBAction)onAddPressed:(id)sender {
    if ([self.textField.text isEqualToString:@""])
        return;
    MagicalCreature* newCreature = [[MagicalCreature alloc]initWithName:self.textField.text withDetail:self.detailField.text];
    newCreature.imageName = [self getImageForCreature];
    [self.creatures addObject:newCreature];
    self.textField.text = @"";
    self.detailField.text = @"";
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

-(NSString*)getImageForCreature{
    int random = rand()%self.imageNames.count;
    NSLog(@"%d",random);
    NSString* imageString = [self.imageNames objectAtIndex:random];
    return imageString;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalCreature* current = self.creatures[indexPath.row];
    cell.textLabel.text = current.name;
    cell.detailTextLabel.text = current.detail;
    cell.imageView.image = [UIImage imageNamed:current.imageName];
    return cell;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"ShowCreatureSegue"] && self.choosingFighters)
        return false;
    else{
        return true;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"]){
        CreatureViewController* dvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MagicalCreature *current = [self.creatures objectAtIndex:indexPath.row];
        dvc.creature = current;
        dvc.delegate = self;
    }
    else{
        BattleViewController* dvc = segue.destinationViewController;
        [self.chooseFightersButton setTitle:@"Choose Fighters" forState:UIControlStateNormal];
        dvc.fighter2 = self.fighter2;
        dvc.fighter1 = self.fighter1;
        self.choosingFighters = false;
        self.fighter2 = nil;
        self.fighter1 = nil;
        for (NSIndexPath* path in self.tableView.indexPathsForSelectedRows){
            [self.tableView deselectRowAtIndexPath:path animated:false];
        }
    }
    
}



@end
