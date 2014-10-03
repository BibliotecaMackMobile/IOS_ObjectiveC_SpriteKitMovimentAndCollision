//
//  GameScene.m
//  PongBolado
//
//  Created by Jean de Freitas Gomes on 27/09/14.
//  Copyright (c) 2014 Jean de Freitas Gomes. All rights reserved.
//

#import "GameScene.h"

static const uint32_t bolaCategory = 0x1 << 0;
static const uint32_t padCategory = 0x1 << 1;
int accellX;
int accellY;
SKSpriteNode *bola;

@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    bola = [SKSpriteNode spriteNodeWithImageNamed:@"bola.png"];
    bola.physicsBody.dynamic = YES;
    bola.physicsBody.collisionBitMask = padCategory;
    bola.physicsBody.categoryBitMask = bolaCategory;
    bola.physicsBody.affectedByGravity = NO;
    bola.position = CGPointMake(500, 300);
    [bola setScale:0.1];
    [self addChild:bola];
    
    accellX=3;
    accellY=8;
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    for (UITouch *touch in touches)
    {
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    
    if(bola.position.x<300 || bola.position.x>700){
        accellX= -accellX;
    }
    
    if(bola.position.y>600 || bola.position.y<100){
        accellY= -accellY;
    }
    
    bola.position=CGPointMake(bola.position.x+accellX, bola.position.y+ accellY);
}

@end
