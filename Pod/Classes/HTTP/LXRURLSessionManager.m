//
//  LXRURLSessionManager.m
//  ParticleSDK
//
//  Created by Alex Kalinichenko on 4/2/17.
//  Copyright © 2017 Particle. All rights reserved.
//

#import "LXRURLSessionManager.h"


@interface LXRURLSessionManager ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation LXRURLSessionManager

- (instancetype)initWithBaseURL:(NSURL *)baseURL
{
  self = [super init];
  
  if (self != nil)
  {
    _baseURL = baseURL;
    _requestSerializer = [LXRRequestSerializer new];
    _responseSerializer = [LXRResponseSerializer new];
    _session = [NSURLSession sharedSession];
  }
  
  return self;
}

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
  NSURL *requestURL = [NSURL URLWithString:URLString relativeToURL:self.baseURL];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
  request.HTTPMethod = @"POST";
  
  [self.requestSerializer setHeadersForRequest:request];
  [self.requestSerializer serializeParameters:parameters forRequest:request];
  
  __weak LXRURLSessionManager *weakSelf = self;
  __block NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error == nil)
    {
      id responseObject = [weakSelf.responseSerializer deserializeResponseData:data error:&error];
      
      if (responseObject != nil)
      {
        success(task, responseObject);
        return;
      }
    }

    failure(task, error);
  }];
  
  [task resume];
  
  return task;
}

- (nullable NSURLSessionDataTask *)PUT:(nonnull NSString *)URLString
                            parameters:(nullable id)parameters
                               success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure
{
  NSURL *requestURL = [NSURL URLWithString:URLString relativeToURL:self.baseURL];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
  request.HTTPMethod = @"PUT";
  
  [self.requestSerializer setHeadersForRequest:request];
  [self.requestSerializer serializeParameters:parameters forRequest:request];
  
  __weak LXRURLSessionManager *weakSelf = self;
  __block NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error == nil)
    {
      id responseObject = [weakSelf.responseSerializer deserializeResponseData:data error:&error];
      
      if (responseObject != nil)
      {
        success(task, responseObject);
        return;
      }
    }
    
    failure(task, error);
  }];
  
  [task resume];
  
  return task;
}

- (nullable NSURLSessionDataTask *)DELETE:(nonnull NSString *)URLString
                                  success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure
{
  NSURL *requestURL = [NSURL URLWithString:URLString relativeToURL:self.baseURL];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
  request.HTTPMethod = @"DELETE";
  
  [self.requestSerializer setHeadersForRequest:request];
  
  __weak LXRURLSessionManager *weakSelf = self;
  __block NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error == nil)
    {
      id responseObject = [weakSelf.responseSerializer deserializeResponseData:data error:&error];
      
      if (responseObject != nil)
      {
        success(task, responseObject);
        return;
      }
    }
    
    failure(task, error);
  }];
  
  [task resume];
  
  return task;
}

- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
  NSURL *requestURL = [NSURL URLWithString:URLString relativeToURL:self.baseURL];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
  request.HTTPMethod = @"GET";
  
  [self.requestSerializer setHeadersForRequest:request];
  
  __weak LXRURLSessionManager *weakSelf = self;
  __block NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error == nil)
    {
      id responseObject = [weakSelf.responseSerializer deserializeResponseData:data error:&error];
      
      if (responseObject != nil)
      {
        success(task, responseObject);
        return;
      }
    }
    
    failure(task, error);
  }];
  
  [task resume];
  
  return task;
}

@end
