//
//  main.m
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-06.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputManager.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL choice = YES;
        InputManager *newInput = [[InputManager alloc] init];
        Player *newPlayer = [[Player alloc] init];
        
        NSLog(@"Welcome to Snakes & Ladders!\nPlease type 'roll' or 'r'");
        
        while(choice){
            NSString *playerOption = [newInput getInput];
            
            if([playerOption isEqualToString:@"roll"] || [playerOption isEqualToString:@"r"]){
                [newPlayer roll];
                if(newPlayer.gameOver == YES){
                    NSLog(@"You Win!");
                    break;
                }
            }else if([playerOption isEqualToString:@"quit"]){
                choice = NO;
                break;
            }
            
            
        }
        
    }
    return 0;
}
