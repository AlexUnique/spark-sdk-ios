//
//  LXRRequestSerializer.m
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import "LXRRequestSerializer.h"
#import "NSMutableURLRequest+LXRFormURLEncodedBody.h"

@interface LXRRequestSerializer ()
@property (nonatomic, strong) NSMutableDictionary *mutableHttpHeaders;
@end

@implementation LXRRequestSerializer

- (NSMutableDictionary *)mutableHttpHeaders
{
  if (_mutableHttpHeaders == nil)
  {
    _mutableHttpHeaders = [NSMutableDictionary new];
  }
  
  return _mutableHttpHeaders;
}

- (void)setAuthorizationHeaderFieldWithUsername:(NSString *)username password:(NSString *)password
{
  NSData *basicAuthCredentials = [[NSString stringWithFormat:@"%@:%@", username, password] dataUsingEncoding:NSUTF8StringEncoding];
  NSString *base64AuthCredentials = [basicAuthCredentials base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
  [self setValue:[NSString stringWithFormat:@"Basic %@", base64AuthCredentials] forHTTPHeaderField:@"Authorization"];
}

- (void)clearAuthorizationHeader
{
  [self setValue:nil forHTTPHeaderField:@"Authorization"];
}

- (void)setValue:(id)value forHTTPHeaderField:(NSString *)headerField
{
  [self.mutableHttpHeaders setValue:value forKey:headerField];
}

- (void)serializeParameters:(NSDictionary *)parameters forRequest:(NSMutableURLRequest *)request
{
  [request LXR_setUrlEncodedBodyWithParameters:parameters];
  [self setHeadersForRequest:request];
}

- (void)setHeadersForRequest:(NSMutableURLRequest *)request
{
  for (NSString *key in self.mutableHttpHeaders)
  {
    [request setValue:self.mutableHttpHeaders[key] forHTTPHeaderField:key];
  }
}

@end
