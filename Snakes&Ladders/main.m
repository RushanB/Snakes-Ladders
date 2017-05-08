//
//  main.m
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-06.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputManager.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL gameOn = YES;
        PlayerManager *newPlayer = [[PlayerManager alloc] init];
        
        while(gameOn){
            [newPlayer.players removeAllObjects];
            newPlayer.gameOver = NO;
            NSLog(@"Welcome to Snakes & Ladders! Press 'quit' to exit anytime.\nHow many Player(s) are playing:");
            while(!newPlayer.gameOver){
                
                BOOL exit = NO;
                while([newPlayer.players count] == 0){
                    
                    NSString *newInput = [InputManager getInput];
                    
                    if(([newInput intValue] > 0) && ([newInput intValue] < 5)){
                        [newPlayer createPlayers:[newInput intValue]];
                        NSLog(@"%li players are playing\n", (long)[newPlayer.players count]);
                    }else if([newInput isEqualToString:@"quit"]){
                        exit = YES;
                        break;
                    }else{
                        NSLog(@"Please enter a number between 1 and 4 to continue.");
                    }
                }
                if(exit){
                    gameOn = NO;
                    break;
                }
                
                NSLog(@"It is %@'s turn. Please type 'roll' or 'r' to roll the dice.", [newPlayer currentPlayer].name);
                NSString *newInput = [InputManager getInput];
                
                if([newInput isEqualToString:@"roll"] || [newInput isEqualToString:@"r"]){
                    [newPlayer roll];
                    NSLog(@"%@",[newPlayer score]);
                    if(newPlayer.gameOver == YES){
                        NSLog(@"You Win!");
                        break;
                    }
                }else if([newInput isEqualToString:@"quit"]){
                    gameOn = NO;
                    break;
                }
            }
            
        }
        
    }
    return 0;
}
