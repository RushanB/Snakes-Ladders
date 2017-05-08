//
//  Player.h
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-06.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) NSInteger currentSquare;
@property (nonatomic, strong) NSDictionary *gameLogic;
@property (nonatomic) BOOL gameOver;

@property (nonatomic) NSString *name; //multiplayer support
-(instancetype)initWithName:(NSString *)name;

-(NSString *)score;

-(void)roll;

@end
