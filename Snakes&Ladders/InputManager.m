//
//  InputManager.m
//  Snakes&Ladders
//
//  Created by Rushan on 2017-05-06.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "InputManager.h"

@implementation InputManager

-(NSString *) getInput{
    char str[255];
    fgets (str, 255, stdin);
    
    NSString *inputString = [[NSString alloc] initWithUTF8String:str];
    return inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
