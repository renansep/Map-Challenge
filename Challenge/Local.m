//
//  Local.m
//  Challenge
//
//  Created by Renan Cargnin on 2/6/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import "Local.h"

@implementation Local

@synthesize nome, hora, minuto, coordenada;

- (Local *)initWithNome:(NSString *)n andCoordenada:(CLLocationCoordinate2D)c andHora:(NSInteger *)h andMinuto:(NSInteger *)m
{
    self = [super init];
    if (self)
    {
        nome = n;
        coordenada = c;
        hora = h;
        minuto = m;
    }
    return self;
}

@end
