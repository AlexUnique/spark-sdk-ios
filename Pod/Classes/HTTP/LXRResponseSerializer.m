//
//  LXRResponseSerializer.m
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import "LXRResponseSerializer.h"

@implementation LXRResponseSerializer

- (id)deserializeResponseData:(NSData *)responseData error:(NSError **)error
{
  return [NSJSONSerialization JSONObjectWithData:responseData options:0 error:error];
}

@end
