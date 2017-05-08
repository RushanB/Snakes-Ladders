//
//  PlayerManager.m
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    if (self = [super init]) {
        _currentIndex = 0;
        _players = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)roll{
    [[self currentPlayer] roll];
    self.currentIndex++;
}


-(void)createPlayers:(int) playerCount{
    NSArray *num = @[@"1", @"2", @"3",@"4"];
    NSString *player = @"Player ";
    
    for(int i=1 ; i < playerCount+1 ; i++){
        NSString *playerName = [player stringByAppendingString:num[i-1]];
        Player *player = [[Player alloc] initWithName:playerName];
        [self.players addObject:player];
    }
    
}

-(Player *)currentPlayer{
    Player *currentPlayer = self.players[self.currentIndex%[self.players count]]; //computes array index for current player
    return currentPlayer;
}

-(NSString *)score{
    NSMutableString *gameScore = [[NSMutableString alloc] initWithString:@"Current score:"];
    
    for(Player *player in self.players){  //for every player implement score
        [gameScore appendFormat:@" %@,",[player score]];
    }
    return [gameScore substringToIndex:[gameScore length]-1];
}

@end
