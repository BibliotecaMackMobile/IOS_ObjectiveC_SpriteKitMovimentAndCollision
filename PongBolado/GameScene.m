//
//  GameScene.m
//  PongBolado
//
//  Created by Jean de Freitas Gomes on 27/09/14.
//  Copyright (c) 2014 Jean de Freitas Gomes. All rights reserved.
//

#import "GameScene.h"

//setando as categorias de contato, essa categorias serão usadas para se testar os efeitos de contato
static const uint32_t bolaCategory = 0x1 << 0;
static const uint32_t padCategory = 0x1 << 1;

// variaveis que serão usados para se criar a movimentação
int accellX;
int accellY;

//obejto que vai ser usado para colocar a bolinha na cena
SKSpriteNode *bola;

@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    
    
    bola = [SKSpriteNode spriteNodeWithImageNamed:@"bola.png"]; //primeiro fzemos uma estancia de uma bolinha
    
    //setamos os efeitos de phsicisBody
    bola.physicsBody.dynamic = YES;                    //verifica se ele vai ser estatico ou não
    bola.physicsBody.collisionBitMask = padCategory;   //categoria de contato
    bola.physicsBody.categoryBitMask = bolaCategory;   // categoria de itens que esse objeto pode colidir
    bola.physicsBody.affectedByGravity = NO;           // add ou não o efeito de gravity, normalmente ele vem com YES
    bola.position = CGPointMake(500, 300);
    [bola setScale:0.1];
    [self addChild:bola];                              // add a bolinha a cena
    
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



//o metodo update será chamado varias vezes durante a execução do projeto
//então vamos usar-la para criar a movimentação do objeto por segundo
//isso vai fazer com que a posição da bolinha seja atualizada dependendo dos valores da aceleração e da posição atual dela
-(void)update:(CFTimeInterval)currentTime
{
    
    
    
    if(bola.position.x<300 || bola.position.x>700){
        accellX= -accellX; //troca o sentido dela toda vez que chegar a bordas superior e inferior
    }
    
    if(bola.position.y>600 || bola.position.y<100){
        accellY= -accellY; //troca o sentido dela toda vez que chegar a bordas laterais
    }
    
    bola.position=CGPointMake(bola.position.x+accellX, bola.position.y+ accellY); // atualiza a posição da bolinha
}

@end
