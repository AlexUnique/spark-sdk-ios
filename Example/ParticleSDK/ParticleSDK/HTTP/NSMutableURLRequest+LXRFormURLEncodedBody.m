//
//  NSMutableURLRequest+LXRFormURLEncodedBody.m
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import "NSMutableURLRequest+LXRFormURLEncodedBody.h"

@implementation NSMutableURLRequest (LXRFormURLEncodedBody)

- (NSString *)LXR_percentEscapeString:(NSString *)string
{
  return [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (void)LXR_setUrlEncodedBodyWithParameters:(NSDictionary *)parameters
{
  NSMutableArray *pairs = [NSMutableArray new];
  
  for (NSString *key in parameters)
  {
    NSString *value = parameters[key];
    NSString *keyValuePair = [NSString stringWithFormat:@"%@=%@", [self LXR_percentEscapeString:key], [self LXR_percentEscapeString:value]];
    [pairs addObject:keyValuePair];
  }
  
  NSString *bodyString = [pairs componentsJoinedByString:@"&"];
  self.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
  
  [self setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
}

@end
