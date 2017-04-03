//
//  LXRResponseSerializer.h
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXRResponseSerializer : NSObject

- (id)deserializeResponseData:(NSData *)responseData error:(NSError **)error;

@end
