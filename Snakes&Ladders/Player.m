//
//  Player.m
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-06.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _gameLogic = @{[NSNumber numberWithInt:4]:[NSNumber numberWithInt:14], //ladders start square to end square
                       [NSNumber numberWithInt:9]:[NSNumber numberWithInt:31],
                       [NSNumber numberWithInt:20]:[NSNumber numberWithInt:38],
                       [NSNumber numberWithInt:28]:[NSNumber numberWithInt:84],
                       [NSNumber numberWithInt:51]:[NSNumber numberWithInt:67],
                       [NSNumber numberWithInt:63]:[NSNumber numberWithInt:81],
                       [NSNumber numberWithInt:99]:[NSNumber numberWithInt:78], //snakes head square to tail square
                       [NSNumber numberWithInt:95]:[NSNumber numberWithInt:75],
                       [NSNumber numberWithInt:89]:[NSNumber numberWithInt:25],
                       [NSNumber numberWithInt:64]:[NSNumber numberWithInt:60],
                       [NSNumber numberWithInt:17]:[NSNumber numberWithInt:7],};
        _gameOver = NO;
        _name = @"Player 1";
    }
    return self;
}


-(instancetype)initWithName:(NSString *)name {
    if (self) {
        _currentSquare = 0;
        _gameLogic = @{[NSNumber numberWithInt:4]:[NSNumber numberWithInt:14], //ladders start square to end square
                       [NSNumber numberWithInt:9]:[NSNumber numberWithInt:31],
                       [NSNumber numberWithInt:20]:[NSNumber numberWithInt:38],
                       [NSNumber numberWithInt:28]:[NSNumber numberWithInt:84],
                       [NSNumber numberWithInt:51]:[NSNumber numberWithInt:67],
                       [NSNumber numberWithInt:63]:[NSNumber numberWithInt:81],
                       [NSNumber numberWithInt:99]:[NSNumber numberWithInt:78], //snakes head square to tail square
                       [NSNumber numberWithInt:95]:[NSNumber numberWithInt:75],
                       [NSNumber numberWithInt:89]:[NSNumber numberWithInt:25],
                       [NSNumber numberWithInt:64]:[NSNumber numberWithInt:60],
                       [NSNumber numberWithInt:17]:[NSNumber numberWithInt:7],};
        _gameOver = NO;
        _name = name;
    }
    return self;
}

-(NSString *)score{
    return [NSString stringWithFormat:@"%@: %ld", self.name,(long)self.currentSquare];
}

-(void)roll{
    int dice = arc4random_uniform(6)+1;
    NSLog(@"You rolled a %i", dice);
    
    self.currentSquare += dice;  //roll dice and implement current square
    NSNumber *current = [NSNumber numberWithLong:self.currentSquare];
    if([self.gameLogic objectForKey:current] == nil){
        if(self.currentSquare >= 100){
            self.gameOver = YES;
        }
        NSLog(@"You landed on %li", (long)self.currentSquare);  //prints square
        
    }else if(self.currentSquare < [[self.gameLogic objectForKey:current]intValue]){
        self.currentSquare = [[self.gameLogic objectForKey:current]intValue];   //ladder
        NSLog(@"Stairs: you jumped from %@ to %li", current, self.currentSquare);
        
    }else{
        self.currentSquare = [[self.gameLogic objectForKey:current]intValue];  //snake
        NSLog(@"Snake: you dropped from %@ to %li", current, self.currentSquare);
    }
}



@end

