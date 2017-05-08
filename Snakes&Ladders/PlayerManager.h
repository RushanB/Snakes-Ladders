//
//  PlayerManager.h
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface PlayerManager : NSObject

@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSMutableArray *players;
@property (nonatomic) NSInteger currentIndex;

-(void)createPlayers:(int) playerCount;

-(Player *)currentPlayer;

-(NSString *)score;

-(void)roll;

//modulus operator, the currentIndex and the count of the players array.



@end
