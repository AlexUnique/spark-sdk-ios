//
//  LXRURLSessionManager.h
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXRRequestSerializer.h"
#import "LXRResponseSerializer.h"

@interface LXRURLSessionManager : NSObject

@property (nonatomic, strong, readonly, nonnull) NSURL *baseURL;

@property (nonatomic, strong, nonnull) LXRRequestSerializer *requestSerializer;
@property (nonatomic, strong, nonnull) LXRResponseSerializer *responseSerializer;

- (nullable instancetype)initWithBaseURL:(nonnull NSURL *)baseURL;

- (nullable NSURLSessionDataTask *)POST:(nonnull NSString *)URLString
                             parameters:(nullable id)parameters
                                success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

- (nullable NSURLSessionDataTask *)PUT:(nonnull NSString *)URLString
                            parameters:(nullable id)parameters
                               success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

- (nullable NSURLSessionDataTask *)DELETE:(nonnull NSString *)URLString
                               parameters:(nullable id)parameters
                                  success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

- (nullable NSURLSessionDataTask *)GET:(nonnull NSString *)URLString
                               success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

@end
