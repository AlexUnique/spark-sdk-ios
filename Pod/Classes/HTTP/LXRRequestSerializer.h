//
//  LXRRequestSerializer.h
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXRRequestSerializer : NSObject

- (void)setValue:(id)value forHTTPHeaderField:(NSString *)headerField;
- (void)setAuthorizationHeaderFieldWithUsername:(NSString *)username password:(NSString *)password;
- (void)clearAuthorizationHeader;

- (void)serializeParameters:(NSDictionary *)parameters forRequest:(NSMutableURLRequest *)request;
- (void)setHeadersForRequest:(NSMutableURLRequest *)request;

@end
