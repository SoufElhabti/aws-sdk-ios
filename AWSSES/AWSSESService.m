//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSSESService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSESResources.h"

static NSString *const AWSInfoSES = @"SES";
NSString *const AWSSESSDKVersion = @"2.41.0";


@interface AWSSESResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSESResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccountSendingPausedException" : @(AWSSESErrorAccountSendingPaused),
                            @"AlreadyExists" : @(AWSSESErrorAlreadyExists),
                            @"CannotDelete" : @(AWSSESErrorCannotDelete),
                            @"ConfigurationSetAlreadyExists" : @(AWSSESErrorConfigurationSetAlreadyExists),
                            @"ConfigurationSetDoesNotExist" : @(AWSSESErrorConfigurationSetDoesNotExist),
                            @"ConfigurationSetSendingPausedException" : @(AWSSESErrorConfigurationSetSendingPaused),
                            @"CustomVerificationEmailInvalidContent" : @(AWSSESErrorCustomVerificationEmailInvalidContent),
                            @"CustomVerificationEmailTemplateAlreadyExists" : @(AWSSESErrorCustomVerificationEmailTemplateAlreadyExists),
                            @"CustomVerificationEmailTemplateDoesNotExist" : @(AWSSESErrorCustomVerificationEmailTemplateDoesNotExist),
                            @"EventDestinationAlreadyExists" : @(AWSSESErrorEventDestinationAlreadyExists),
                            @"EventDestinationDoesNotExist" : @(AWSSESErrorEventDestinationDoesNotExist),
                            @"FromEmailAddressNotVerified" : @(AWSSESErrorFromEmailAddressNotVerified),
                            @"InvalidCloudWatchDestination" : @(AWSSESErrorInvalidCloudWatchDestination),
                            @"InvalidConfigurationSet" : @(AWSSESErrorInvalidConfigurationSet),
                            @"InvalidDeliveryOptions" : @(AWSSESErrorInvalidDeliveryOptions),
                            @"InvalidFirehoseDestination" : @(AWSSESErrorInvalidFirehoseDestination),
                            @"InvalidLambdaFunction" : @(AWSSESErrorInvalidLambdaFunction),
                            @"InvalidPolicy" : @(AWSSESErrorInvalidPolicy),
                            @"InvalidRenderingParameter" : @(AWSSESErrorInvalidRenderingParameter),
                            @"InvalidS3Configuration" : @(AWSSESErrorInvalidS3Configuration),
                            @"InvalidSNSDestination" : @(AWSSESErrorInvalidSNSDestination),
                            @"InvalidSnsTopic" : @(AWSSESErrorInvalidSnsTopic),
                            @"InvalidTemplate" : @(AWSSESErrorInvalidTemplate),
                            @"InvalidTrackingOptions" : @(AWSSESErrorInvalidTrackingOptions),
                            @"LimitExceeded" : @(AWSSESErrorLimitExceeded),
                            @"MailFromDomainNotVerifiedException" : @(AWSSESErrorMailFromDomainNotVerified),
                            @"MessageRejected" : @(AWSSESErrorMessageRejected),
                            @"MissingRenderingAttribute" : @(AWSSESErrorMissingRenderingAttribute),
                            @"ProductionAccessNotGranted" : @(AWSSESErrorProductionAccessNotGranted),
                            @"RuleDoesNotExist" : @(AWSSESErrorRuleDoesNotExist),
                            @"RuleSetDoesNotExist" : @(AWSSESErrorRuleSetDoesNotExist),
                            @"TemplateDoesNotExist" : @(AWSSESErrorTemplateDoesNotExist),
                            @"TrackingOptionsAlreadyExistsException" : @(AWSSESErrorTrackingOptionsAlreadyExists),
                            @"TrackingOptionsDoesNotExistException" : @(AWSSESErrorTrackingOptionsDoesNotExist),
                            };
}

#pragma mark -

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    id responseObject = [super responseObjectForResponse:response
                                         originalRequest:originalRequest
                                          currentRequest:currentRequest
                                                    data:data
                                                   error:error];
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {

        NSDictionary *errorInfo = responseObject[@"Error"];
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSESErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSESErrorDomain
                                             code:AWSSESErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSSESErrorDomain
                                     code:AWSSESErrorUnknown
                                 userInfo:nil];
    }

    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }

    return responseObject;
}

@end

@interface AWSSESRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSESRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSES()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSES

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSESSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSES versions need to match. Check your SDK installation. AWSCore: %@ AWSSES: %@", AWSiOSSDKVersion, AWSSESSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSES {
    static AWSSES *_defaultSES = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSES];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultSES = [[AWSSES alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSES;
}

+ (void)registerSESWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSES alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SESForKey:(NSString *)key {
    @synchronized(self) {
        AWSSES *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSES
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSES registerSESWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSESForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSES` or `+ SESForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSES
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSES];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSESRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
        _networking = [[AWSNetworking alloc] initWithConfiguration:_configuration];
    }
    
    return self;
}

- (AWSTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    
    @autoreleasepool {
        if (!request) {
            request = [AWSRequest new];
        }

        AWSNetworkingRequest *networkingRequest = request.internalRequest;
        if (request) {
            networkingRequest.parameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
        } else {
            networkingRequest.parameters = @{};
        }

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSSESResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSESResponseSerializer alloc] initWithJSONDefinition:[[AWSSESResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSESCloneReceiptRuleSetResponse *> *)cloneReceiptRuleSet:(AWSSESCloneReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CloneReceiptRuleSet"
                   outputClass:[AWSSESCloneReceiptRuleSetResponse class]];
}

- (void)cloneReceiptRuleSet:(AWSSESCloneReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESCloneReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self cloneReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCloneReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESCloneReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateConfigurationSetResponse *> *)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateConfigurationSet"
                   outputClass:[AWSSESCreateConfigurationSetResponse class]];
}

- (void)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request
     completionHandler:(void (^)(AWSSESCreateConfigurationSetResponse *response, NSError *error))completionHandler {
    [[self createConfigurationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateConfigurationSetResponse *> * _Nonnull task) {
        AWSSESCreateConfigurationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateConfigurationSetEventDestinationResponse *> *)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateConfigurationSetEventDestination"
                   outputClass:[AWSSESCreateConfigurationSetEventDestinationResponse class]];
}

- (void)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request
     completionHandler:(void (^)(AWSSESCreateConfigurationSetEventDestinationResponse *response, NSError *error))completionHandler {
    [[self createConfigurationSetEventDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateConfigurationSetEventDestinationResponse *> * _Nonnull task) {
        AWSSESCreateConfigurationSetEventDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateConfigurationSetTrackingOptionsResponse *> *)createConfigurationSetTrackingOptions:(AWSSESCreateConfigurationSetTrackingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateConfigurationSetTrackingOptions"
                   outputClass:[AWSSESCreateConfigurationSetTrackingOptionsResponse class]];
}

- (void)createConfigurationSetTrackingOptions:(AWSSESCreateConfigurationSetTrackingOptionsRequest *)request
     completionHandler:(void (^)(AWSSESCreateConfigurationSetTrackingOptionsResponse *response, NSError *error))completionHandler {
    [[self createConfigurationSetTrackingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateConfigurationSetTrackingOptionsResponse *> * _Nonnull task) {
        AWSSESCreateConfigurationSetTrackingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createCustomVerificationEmailTemplate:(AWSSESCreateCustomVerificationEmailTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCustomVerificationEmailTemplate"
                   outputClass:nil];
}

- (void)createCustomVerificationEmailTemplate:(AWSSESCreateCustomVerificationEmailTemplateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createCustomVerificationEmailTemplate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateReceiptFilterResponse *> *)createReceiptFilter:(AWSSESCreateReceiptFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReceiptFilter"
                   outputClass:[AWSSESCreateReceiptFilterResponse class]];
}

- (void)createReceiptFilter:(AWSSESCreateReceiptFilterRequest *)request
     completionHandler:(void (^)(AWSSESCreateReceiptFilterResponse *response, NSError *error))completionHandler {
    [[self createReceiptFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateReceiptFilterResponse *> * _Nonnull task) {
        AWSSESCreateReceiptFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateReceiptRuleResponse *> *)createReceiptRule:(AWSSESCreateReceiptRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReceiptRule"
                   outputClass:[AWSSESCreateReceiptRuleResponse class]];
}

- (void)createReceiptRule:(AWSSESCreateReceiptRuleRequest *)request
     completionHandler:(void (^)(AWSSESCreateReceiptRuleResponse *response, NSError *error))completionHandler {
    [[self createReceiptRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateReceiptRuleResponse *> * _Nonnull task) {
        AWSSESCreateReceiptRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateReceiptRuleSetResponse *> *)createReceiptRuleSet:(AWSSESCreateReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReceiptRuleSet"
                   outputClass:[AWSSESCreateReceiptRuleSetResponse class]];
}

- (void)createReceiptRuleSet:(AWSSESCreateReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESCreateReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self createReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESCreateReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateTemplateResponse *> *)createTemplate:(AWSSESCreateTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTemplate"
                   outputClass:[AWSSESCreateTemplateResponse class]];
}

- (void)createTemplate:(AWSSESCreateTemplateRequest *)request
     completionHandler:(void (^)(AWSSESCreateTemplateResponse *response, NSError *error))completionHandler {
    [[self createTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateTemplateResponse *> * _Nonnull task) {
        AWSSESCreateTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteConfigurationSetResponse *> *)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationSet"
                   outputClass:[AWSSESDeleteConfigurationSetResponse class]];
}

- (void)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request
     completionHandler:(void (^)(AWSSESDeleteConfigurationSetResponse *response, NSError *error))completionHandler {
    [[self deleteConfigurationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteConfigurationSetResponse *> * _Nonnull task) {
        AWSSESDeleteConfigurationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteConfigurationSetEventDestinationResponse *> *)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationSetEventDestination"
                   outputClass:[AWSSESDeleteConfigurationSetEventDestinationResponse class]];
}

- (void)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request
     completionHandler:(void (^)(AWSSESDeleteConfigurationSetEventDestinationResponse *response, NSError *error))completionHandler {
    [[self deleteConfigurationSetEventDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteConfigurationSetEventDestinationResponse *> * _Nonnull task) {
        AWSSESDeleteConfigurationSetEventDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteConfigurationSetTrackingOptionsResponse *> *)deleteConfigurationSetTrackingOptions:(AWSSESDeleteConfigurationSetTrackingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationSetTrackingOptions"
                   outputClass:[AWSSESDeleteConfigurationSetTrackingOptionsResponse class]];
}

- (void)deleteConfigurationSetTrackingOptions:(AWSSESDeleteConfigurationSetTrackingOptionsRequest *)request
     completionHandler:(void (^)(AWSSESDeleteConfigurationSetTrackingOptionsResponse *response, NSError *error))completionHandler {
    [[self deleteConfigurationSetTrackingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteConfigurationSetTrackingOptionsResponse *> * _Nonnull task) {
        AWSSESDeleteConfigurationSetTrackingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCustomVerificationEmailTemplate:(AWSSESDeleteCustomVerificationEmailTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCustomVerificationEmailTemplate"
                   outputClass:nil];
}

- (void)deleteCustomVerificationEmailTemplate:(AWSSESDeleteCustomVerificationEmailTemplateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCustomVerificationEmailTemplate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteIdentityResponse *> *)deleteIdentity:(AWSSESDeleteIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteIdentity"
                   outputClass:[AWSSESDeleteIdentityResponse class]];
}

- (void)deleteIdentity:(AWSSESDeleteIdentityRequest *)request
     completionHandler:(void (^)(AWSSESDeleteIdentityResponse *response, NSError *error))completionHandler {
    [[self deleteIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteIdentityResponse *> * _Nonnull task) {
        AWSSESDeleteIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteIdentityPolicyResponse *> *)deleteIdentityPolicy:(AWSSESDeleteIdentityPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteIdentityPolicy"
                   outputClass:[AWSSESDeleteIdentityPolicyResponse class]];
}

- (void)deleteIdentityPolicy:(AWSSESDeleteIdentityPolicyRequest *)request
     completionHandler:(void (^)(AWSSESDeleteIdentityPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteIdentityPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteIdentityPolicyResponse *> * _Nonnull task) {
        AWSSESDeleteIdentityPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteReceiptFilterResponse *> *)deleteReceiptFilter:(AWSSESDeleteReceiptFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteReceiptFilter"
                   outputClass:[AWSSESDeleteReceiptFilterResponse class]];
}

- (void)deleteReceiptFilter:(AWSSESDeleteReceiptFilterRequest *)request
     completionHandler:(void (^)(AWSSESDeleteReceiptFilterResponse *response, NSError *error))completionHandler {
    [[self deleteReceiptFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteReceiptFilterResponse *> * _Nonnull task) {
        AWSSESDeleteReceiptFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteReceiptRuleResponse *> *)deleteReceiptRule:(AWSSESDeleteReceiptRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteReceiptRule"
                   outputClass:[AWSSESDeleteReceiptRuleResponse class]];
}

- (void)deleteReceiptRule:(AWSSESDeleteReceiptRuleRequest *)request
     completionHandler:(void (^)(AWSSESDeleteReceiptRuleResponse *response, NSError *error))completionHandler {
    [[self deleteReceiptRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteReceiptRuleResponse *> * _Nonnull task) {
        AWSSESDeleteReceiptRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteReceiptRuleSetResponse *> *)deleteReceiptRuleSet:(AWSSESDeleteReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteReceiptRuleSet"
                   outputClass:[AWSSESDeleteReceiptRuleSetResponse class]];
}

- (void)deleteReceiptRuleSet:(AWSSESDeleteReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESDeleteReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self deleteReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESDeleteReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteTemplateResponse *> *)deleteTemplate:(AWSSESDeleteTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTemplate"
                   outputClass:[AWSSESDeleteTemplateResponse class]];
}

- (void)deleteTemplate:(AWSSESDeleteTemplateRequest *)request
     completionHandler:(void (^)(AWSSESDeleteTemplateResponse *response, NSError *error))completionHandler {
    [[self deleteTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteTemplateResponse *> * _Nonnull task) {
        AWSSESDeleteTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVerifiedEmailAddress"
                   outputClass:nil];
}

- (void)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVerifiedEmailAddress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDescribeActiveReceiptRuleSetResponse *> *)describeActiveReceiptRuleSet:(AWSSESDescribeActiveReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeActiveReceiptRuleSet"
                   outputClass:[AWSSESDescribeActiveReceiptRuleSetResponse class]];
}

- (void)describeActiveReceiptRuleSet:(AWSSESDescribeActiveReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESDescribeActiveReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self describeActiveReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDescribeActiveReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESDescribeActiveReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDescribeConfigurationSetResponse *> *)describeConfigurationSet:(AWSSESDescribeConfigurationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeConfigurationSet"
                   outputClass:[AWSSESDescribeConfigurationSetResponse class]];
}

- (void)describeConfigurationSet:(AWSSESDescribeConfigurationSetRequest *)request
     completionHandler:(void (^)(AWSSESDescribeConfigurationSetResponse *response, NSError *error))completionHandler {
    [[self describeConfigurationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDescribeConfigurationSetResponse *> * _Nonnull task) {
        AWSSESDescribeConfigurationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDescribeReceiptRuleResponse *> *)describeReceiptRule:(AWSSESDescribeReceiptRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReceiptRule"
                   outputClass:[AWSSESDescribeReceiptRuleResponse class]];
}

- (void)describeReceiptRule:(AWSSESDescribeReceiptRuleRequest *)request
     completionHandler:(void (^)(AWSSESDescribeReceiptRuleResponse *response, NSError *error))completionHandler {
    [[self describeReceiptRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDescribeReceiptRuleResponse *> * _Nonnull task) {
        AWSSESDescribeReceiptRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDescribeReceiptRuleSetResponse *> *)describeReceiptRuleSet:(AWSSESDescribeReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReceiptRuleSet"
                   outputClass:[AWSSESDescribeReceiptRuleSetResponse class]];
}

- (void)describeReceiptRuleSet:(AWSSESDescribeReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESDescribeReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self describeReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDescribeReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESDescribeReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetAccountSendingEnabledResponse *> *)getAccountSendingEnabled:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAccountSendingEnabled"
                   outputClass:[AWSSESGetAccountSendingEnabledResponse class]];
}

- (void)getAccountSendingEnabled:(AWSRequest *)request
     completionHandler:(void (^)(AWSSESGetAccountSendingEnabledResponse *response, NSError *error))completionHandler {
    [[self getAccountSendingEnabled:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetAccountSendingEnabledResponse *> * _Nonnull task) {
        AWSSESGetAccountSendingEnabledResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetCustomVerificationEmailTemplateResponse *> *)getCustomVerificationEmailTemplate:(AWSSESGetCustomVerificationEmailTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetCustomVerificationEmailTemplate"
                   outputClass:[AWSSESGetCustomVerificationEmailTemplateResponse class]];
}

- (void)getCustomVerificationEmailTemplate:(AWSSESGetCustomVerificationEmailTemplateRequest *)request
     completionHandler:(void (^)(AWSSESGetCustomVerificationEmailTemplateResponse *response, NSError *error))completionHandler {
    [[self getCustomVerificationEmailTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetCustomVerificationEmailTemplateResponse *> * _Nonnull task) {
        AWSSESGetCustomVerificationEmailTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityDkimAttributesResponse *> *)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityDkimAttributes"
                   outputClass:[AWSSESGetIdentityDkimAttributesResponse class]];
}

- (void)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request
     completionHandler:(void (^)(AWSSESGetIdentityDkimAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityDkimAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityDkimAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityDkimAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityMailFromDomainAttributesResponse *> *)getIdentityMailFromDomainAttributes:(AWSSESGetIdentityMailFromDomainAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityMailFromDomainAttributes"
                   outputClass:[AWSSESGetIdentityMailFromDomainAttributesResponse class]];
}

- (void)getIdentityMailFromDomainAttributes:(AWSSESGetIdentityMailFromDomainAttributesRequest *)request
     completionHandler:(void (^)(AWSSESGetIdentityMailFromDomainAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityMailFromDomainAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityMailFromDomainAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityMailFromDomainAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityNotificationAttributesResponse *> *)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityNotificationAttributes"
                   outputClass:[AWSSESGetIdentityNotificationAttributesResponse class]];
}

- (void)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request
     completionHandler:(void (^)(AWSSESGetIdentityNotificationAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityNotificationAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityNotificationAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityNotificationAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityPoliciesResponse *> *)getIdentityPolicies:(AWSSESGetIdentityPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityPolicies"
                   outputClass:[AWSSESGetIdentityPoliciesResponse class]];
}

- (void)getIdentityPolicies:(AWSSESGetIdentityPoliciesRequest *)request
     completionHandler:(void (^)(AWSSESGetIdentityPoliciesResponse *response, NSError *error))completionHandler {
    [[self getIdentityPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityPoliciesResponse *> * _Nonnull task) {
        AWSSESGetIdentityPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityVerificationAttributesResponse *> *)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityVerificationAttributes"
                   outputClass:[AWSSESGetIdentityVerificationAttributesResponse class]];
}

- (void)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request
     completionHandler:(void (^)(AWSSESGetIdentityVerificationAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityVerificationAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityVerificationAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityVerificationAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetSendQuotaResponse *> *)getSendQuota:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSendQuota"
                   outputClass:[AWSSESGetSendQuotaResponse class]];
}

- (void)getSendQuota:(AWSRequest *)request
     completionHandler:(void (^)(AWSSESGetSendQuotaResponse *response, NSError *error))completionHandler {
    [[self getSendQuota:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetSendQuotaResponse *> * _Nonnull task) {
        AWSSESGetSendQuotaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetSendStatisticsResponse *> *)getSendStatistics:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSendStatistics"
                   outputClass:[AWSSESGetSendStatisticsResponse class]];
}

- (void)getSendStatistics:(AWSRequest *)request
     completionHandler:(void (^)(AWSSESGetSendStatisticsResponse *response, NSError *error))completionHandler {
    [[self getSendStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetSendStatisticsResponse *> * _Nonnull task) {
        AWSSESGetSendStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetTemplateResponse *> *)getTemplate:(AWSSESGetTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTemplate"
                   outputClass:[AWSSESGetTemplateResponse class]];
}

- (void)getTemplate:(AWSSESGetTemplateRequest *)request
     completionHandler:(void (^)(AWSSESGetTemplateResponse *response, NSError *error))completionHandler {
    [[self getTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetTemplateResponse *> * _Nonnull task) {
        AWSSESGetTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListConfigurationSetsResponse *> *)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListConfigurationSets"
                   outputClass:[AWSSESListConfigurationSetsResponse class]];
}

- (void)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request
     completionHandler:(void (^)(AWSSESListConfigurationSetsResponse *response, NSError *error))completionHandler {
    [[self listConfigurationSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListConfigurationSetsResponse *> * _Nonnull task) {
        AWSSESListConfigurationSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListCustomVerificationEmailTemplatesResponse *> *)listCustomVerificationEmailTemplates:(AWSSESListCustomVerificationEmailTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListCustomVerificationEmailTemplates"
                   outputClass:[AWSSESListCustomVerificationEmailTemplatesResponse class]];
}

- (void)listCustomVerificationEmailTemplates:(AWSSESListCustomVerificationEmailTemplatesRequest *)request
     completionHandler:(void (^)(AWSSESListCustomVerificationEmailTemplatesResponse *response, NSError *error))completionHandler {
    [[self listCustomVerificationEmailTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListCustomVerificationEmailTemplatesResponse *> * _Nonnull task) {
        AWSSESListCustomVerificationEmailTemplatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListIdentitiesResponse *> *)listIdentities:(AWSSESListIdentitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListIdentities"
                   outputClass:[AWSSESListIdentitiesResponse class]];
}

- (void)listIdentities:(AWSSESListIdentitiesRequest *)request
     completionHandler:(void (^)(AWSSESListIdentitiesResponse *response, NSError *error))completionHandler {
    [[self listIdentities:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListIdentitiesResponse *> * _Nonnull task) {
        AWSSESListIdentitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListIdentityPoliciesResponse *> *)listIdentityPolicies:(AWSSESListIdentityPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListIdentityPolicies"
                   outputClass:[AWSSESListIdentityPoliciesResponse class]];
}

- (void)listIdentityPolicies:(AWSSESListIdentityPoliciesRequest *)request
     completionHandler:(void (^)(AWSSESListIdentityPoliciesResponse *response, NSError *error))completionHandler {
    [[self listIdentityPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListIdentityPoliciesResponse *> * _Nonnull task) {
        AWSSESListIdentityPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListReceiptFiltersResponse *> *)listReceiptFilters:(AWSSESListReceiptFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListReceiptFilters"
                   outputClass:[AWSSESListReceiptFiltersResponse class]];
}

- (void)listReceiptFilters:(AWSSESListReceiptFiltersRequest *)request
     completionHandler:(void (^)(AWSSESListReceiptFiltersResponse *response, NSError *error))completionHandler {
    [[self listReceiptFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListReceiptFiltersResponse *> * _Nonnull task) {
        AWSSESListReceiptFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListReceiptRuleSetsResponse *> *)listReceiptRuleSets:(AWSSESListReceiptRuleSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListReceiptRuleSets"
                   outputClass:[AWSSESListReceiptRuleSetsResponse class]];
}

- (void)listReceiptRuleSets:(AWSSESListReceiptRuleSetsRequest *)request
     completionHandler:(void (^)(AWSSESListReceiptRuleSetsResponse *response, NSError *error))completionHandler {
    [[self listReceiptRuleSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListReceiptRuleSetsResponse *> * _Nonnull task) {
        AWSSESListReceiptRuleSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListTemplatesResponse *> *)listTemplates:(AWSSESListTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTemplates"
                   outputClass:[AWSSESListTemplatesResponse class]];
}

- (void)listTemplates:(AWSSESListTemplatesRequest *)request
     completionHandler:(void (^)(AWSSESListTemplatesResponse *response, NSError *error))completionHandler {
    [[self listTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListTemplatesResponse *> * _Nonnull task) {
        AWSSESListTemplatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListVerifiedEmailAddressesResponse *> *)listVerifiedEmailAddresses:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListVerifiedEmailAddresses"
                   outputClass:[AWSSESListVerifiedEmailAddressesResponse class]];
}

- (void)listVerifiedEmailAddresses:(AWSRequest *)request
     completionHandler:(void (^)(AWSSESListVerifiedEmailAddressesResponse *response, NSError *error))completionHandler {
    [[self listVerifiedEmailAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListVerifiedEmailAddressesResponse *> * _Nonnull task) {
        AWSSESListVerifiedEmailAddressesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutConfigurationSetDeliveryOptionsResponse *> *)putConfigurationSetDeliveryOptions:(AWSSESPutConfigurationSetDeliveryOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutConfigurationSetDeliveryOptions"
                   outputClass:[AWSSESPutConfigurationSetDeliveryOptionsResponse class]];
}

- (void)putConfigurationSetDeliveryOptions:(AWSSESPutConfigurationSetDeliveryOptionsRequest *)request
     completionHandler:(void (^)(AWSSESPutConfigurationSetDeliveryOptionsResponse *response, NSError *error))completionHandler {
    [[self putConfigurationSetDeliveryOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutConfigurationSetDeliveryOptionsResponse *> * _Nonnull task) {
        AWSSESPutConfigurationSetDeliveryOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutIdentityPolicyResponse *> *)putIdentityPolicy:(AWSSESPutIdentityPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutIdentityPolicy"
                   outputClass:[AWSSESPutIdentityPolicyResponse class]];
}

- (void)putIdentityPolicy:(AWSSESPutIdentityPolicyRequest *)request
     completionHandler:(void (^)(AWSSESPutIdentityPolicyResponse *response, NSError *error))completionHandler {
    [[self putIdentityPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutIdentityPolicyResponse *> * _Nonnull task) {
        AWSSESPutIdentityPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESReorderReceiptRuleSetResponse *> *)reorderReceiptRuleSet:(AWSSESReorderReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReorderReceiptRuleSet"
                   outputClass:[AWSSESReorderReceiptRuleSetResponse class]];
}

- (void)reorderReceiptRuleSet:(AWSSESReorderReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESReorderReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self reorderReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESReorderReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESReorderReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendBounceResponse *> *)sendBounce:(AWSSESSendBounceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendBounce"
                   outputClass:[AWSSESSendBounceResponse class]];
}

- (void)sendBounce:(AWSSESSendBounceRequest *)request
     completionHandler:(void (^)(AWSSESSendBounceResponse *response, NSError *error))completionHandler {
    [[self sendBounce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendBounceResponse *> * _Nonnull task) {
        AWSSESSendBounceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendBulkTemplatedEmailResponse *> *)sendBulkTemplatedEmail:(AWSSESSendBulkTemplatedEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendBulkTemplatedEmail"
                   outputClass:[AWSSESSendBulkTemplatedEmailResponse class]];
}

- (void)sendBulkTemplatedEmail:(AWSSESSendBulkTemplatedEmailRequest *)request
     completionHandler:(void (^)(AWSSESSendBulkTemplatedEmailResponse *response, NSError *error))completionHandler {
    [[self sendBulkTemplatedEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendBulkTemplatedEmailResponse *> * _Nonnull task) {
        AWSSESSendBulkTemplatedEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendCustomVerificationEmailResponse *> *)sendCustomVerificationEmail:(AWSSESSendCustomVerificationEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendCustomVerificationEmail"
                   outputClass:[AWSSESSendCustomVerificationEmailResponse class]];
}

- (void)sendCustomVerificationEmail:(AWSSESSendCustomVerificationEmailRequest *)request
     completionHandler:(void (^)(AWSSESSendCustomVerificationEmailResponse *response, NSError *error))completionHandler {
    [[self sendCustomVerificationEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendCustomVerificationEmailResponse *> * _Nonnull task) {
        AWSSESSendCustomVerificationEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendEmailResponse *> *)sendEmail:(AWSSESSendEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendEmail"
                   outputClass:[AWSSESSendEmailResponse class]];
}

- (void)sendEmail:(AWSSESSendEmailRequest *)request
     completionHandler:(void (^)(AWSSESSendEmailResponse *response, NSError *error))completionHandler {
    [[self sendEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendEmailResponse *> * _Nonnull task) {
        AWSSESSendEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendRawEmailResponse *> *)sendRawEmail:(AWSSESSendRawEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendRawEmail"
                   outputClass:[AWSSESSendRawEmailResponse class]];
}

- (void)sendRawEmail:(AWSSESSendRawEmailRequest *)request
     completionHandler:(void (^)(AWSSESSendRawEmailResponse *response, NSError *error))completionHandler {
    [[self sendRawEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendRawEmailResponse *> * _Nonnull task) {
        AWSSESSendRawEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendTemplatedEmailResponse *> *)sendTemplatedEmail:(AWSSESSendTemplatedEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendTemplatedEmail"
                   outputClass:[AWSSESSendTemplatedEmailResponse class]];
}

- (void)sendTemplatedEmail:(AWSSESSendTemplatedEmailRequest *)request
     completionHandler:(void (^)(AWSSESSendTemplatedEmailResponse *response, NSError *error))completionHandler {
    [[self sendTemplatedEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendTemplatedEmailResponse *> * _Nonnull task) {
        AWSSESSendTemplatedEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetActiveReceiptRuleSetResponse *> *)setActiveReceiptRuleSet:(AWSSESSetActiveReceiptRuleSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetActiveReceiptRuleSet"
                   outputClass:[AWSSESSetActiveReceiptRuleSetResponse class]];
}

- (void)setActiveReceiptRuleSet:(AWSSESSetActiveReceiptRuleSetRequest *)request
     completionHandler:(void (^)(AWSSESSetActiveReceiptRuleSetResponse *response, NSError *error))completionHandler {
    [[self setActiveReceiptRuleSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetActiveReceiptRuleSetResponse *> * _Nonnull task) {
        AWSSESSetActiveReceiptRuleSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityDkimEnabledResponse *> *)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityDkimEnabled"
                   outputClass:[AWSSESSetIdentityDkimEnabledResponse class]];
}

- (void)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request
     completionHandler:(void (^)(AWSSESSetIdentityDkimEnabledResponse *response, NSError *error))completionHandler {
    [[self setIdentityDkimEnabled:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityDkimEnabledResponse *> * _Nonnull task) {
        AWSSESSetIdentityDkimEnabledResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityFeedbackForwardingEnabledResponse *> *)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityFeedbackForwardingEnabled"
                   outputClass:[AWSSESSetIdentityFeedbackForwardingEnabledResponse class]];
}

- (void)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request
     completionHandler:(void (^)(AWSSESSetIdentityFeedbackForwardingEnabledResponse *response, NSError *error))completionHandler {
    [[self setIdentityFeedbackForwardingEnabled:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityFeedbackForwardingEnabledResponse *> * _Nonnull task) {
        AWSSESSetIdentityFeedbackForwardingEnabledResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityHeadersInNotificationsEnabledResponse *> *)setIdentityHeadersInNotificationsEnabled:(AWSSESSetIdentityHeadersInNotificationsEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityHeadersInNotificationsEnabled"
                   outputClass:[AWSSESSetIdentityHeadersInNotificationsEnabledResponse class]];
}

- (void)setIdentityHeadersInNotificationsEnabled:(AWSSESSetIdentityHeadersInNotificationsEnabledRequest *)request
     completionHandler:(void (^)(AWSSESSetIdentityHeadersInNotificationsEnabledResponse *response, NSError *error))completionHandler {
    [[self setIdentityHeadersInNotificationsEnabled:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityHeadersInNotificationsEnabledResponse *> * _Nonnull task) {
        AWSSESSetIdentityHeadersInNotificationsEnabledResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityMailFromDomainResponse *> *)setIdentityMailFromDomain:(AWSSESSetIdentityMailFromDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityMailFromDomain"
                   outputClass:[AWSSESSetIdentityMailFromDomainResponse class]];
}

- (void)setIdentityMailFromDomain:(AWSSESSetIdentityMailFromDomainRequest *)request
     completionHandler:(void (^)(AWSSESSetIdentityMailFromDomainResponse *response, NSError *error))completionHandler {
    [[self setIdentityMailFromDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityMailFromDomainResponse *> * _Nonnull task) {
        AWSSESSetIdentityMailFromDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityNotificationTopicResponse *> *)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityNotificationTopic"
                   outputClass:[AWSSESSetIdentityNotificationTopicResponse class]];
}

- (void)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request
     completionHandler:(void (^)(AWSSESSetIdentityNotificationTopicResponse *response, NSError *error))completionHandler {
    [[self setIdentityNotificationTopic:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityNotificationTopicResponse *> * _Nonnull task) {
        AWSSESSetIdentityNotificationTopicResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetReceiptRulePositionResponse *> *)setReceiptRulePosition:(AWSSESSetReceiptRulePositionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetReceiptRulePosition"
                   outputClass:[AWSSESSetReceiptRulePositionResponse class]];
}

- (void)setReceiptRulePosition:(AWSSESSetReceiptRulePositionRequest *)request
     completionHandler:(void (^)(AWSSESSetReceiptRulePositionResponse *response, NSError *error))completionHandler {
    [[self setReceiptRulePosition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetReceiptRulePositionResponse *> * _Nonnull task) {
        AWSSESSetReceiptRulePositionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESTestRenderTemplateResponse *> *)testRenderTemplate:(AWSSESTestRenderTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TestRenderTemplate"
                   outputClass:[AWSSESTestRenderTemplateResponse class]];
}

- (void)testRenderTemplate:(AWSSESTestRenderTemplateRequest *)request
     completionHandler:(void (^)(AWSSESTestRenderTemplateResponse *response, NSError *error))completionHandler {
    [[self testRenderTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESTestRenderTemplateResponse *> * _Nonnull task) {
        AWSSESTestRenderTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAccountSendingEnabled:(AWSSESUpdateAccountSendingEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAccountSendingEnabled"
                   outputClass:nil];
}

- (void)updateAccountSendingEnabled:(AWSSESUpdateAccountSendingEnabledRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAccountSendingEnabled:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESUpdateConfigurationSetEventDestinationResponse *> *)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationSetEventDestination"
                   outputClass:[AWSSESUpdateConfigurationSetEventDestinationResponse class]];
}

- (void)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request
     completionHandler:(void (^)(AWSSESUpdateConfigurationSetEventDestinationResponse *response, NSError *error))completionHandler {
    [[self updateConfigurationSetEventDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESUpdateConfigurationSetEventDestinationResponse *> * _Nonnull task) {
        AWSSESUpdateConfigurationSetEventDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateConfigurationSetReputationMetricsEnabled:(AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationSetReputationMetricsEnabled"
                   outputClass:nil];
}

- (void)updateConfigurationSetReputationMetricsEnabled:(AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateConfigurationSetReputationMetricsEnabled:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateConfigurationSetSendingEnabled:(AWSSESUpdateConfigurationSetSendingEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationSetSendingEnabled"
                   outputClass:nil];
}

- (void)updateConfigurationSetSendingEnabled:(AWSSESUpdateConfigurationSetSendingEnabledRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateConfigurationSetSendingEnabled:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESUpdateConfigurationSetTrackingOptionsResponse *> *)updateConfigurationSetTrackingOptions:(AWSSESUpdateConfigurationSetTrackingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationSetTrackingOptions"
                   outputClass:[AWSSESUpdateConfigurationSetTrackingOptionsResponse class]];
}

- (void)updateConfigurationSetTrackingOptions:(AWSSESUpdateConfigurationSetTrackingOptionsRequest *)request
     completionHandler:(void (^)(AWSSESUpdateConfigurationSetTrackingOptionsResponse *response, NSError *error))completionHandler {
    [[self updateConfigurationSetTrackingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESUpdateConfigurationSetTrackingOptionsResponse *> * _Nonnull task) {
        AWSSESUpdateConfigurationSetTrackingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateCustomVerificationEmailTemplate:(AWSSESUpdateCustomVerificationEmailTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateCustomVerificationEmailTemplate"
                   outputClass:nil];
}

- (void)updateCustomVerificationEmailTemplate:(AWSSESUpdateCustomVerificationEmailTemplateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateCustomVerificationEmailTemplate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESUpdateReceiptRuleResponse *> *)updateReceiptRule:(AWSSESUpdateReceiptRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateReceiptRule"
                   outputClass:[AWSSESUpdateReceiptRuleResponse class]];
}

- (void)updateReceiptRule:(AWSSESUpdateReceiptRuleRequest *)request
     completionHandler:(void (^)(AWSSESUpdateReceiptRuleResponse *response, NSError *error))completionHandler {
    [[self updateReceiptRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESUpdateReceiptRuleResponse *> * _Nonnull task) {
        AWSSESUpdateReceiptRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESUpdateTemplateResponse *> *)updateTemplate:(AWSSESUpdateTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateTemplate"
                   outputClass:[AWSSESUpdateTemplateResponse class]];
}

- (void)updateTemplate:(AWSSESUpdateTemplateRequest *)request
     completionHandler:(void (^)(AWSSESUpdateTemplateResponse *response, NSError *error))completionHandler {
    [[self updateTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESUpdateTemplateResponse *> * _Nonnull task) {
        AWSSESUpdateTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESVerifyDomainDkimResponse *> *)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyDomainDkim"
                   outputClass:[AWSSESVerifyDomainDkimResponse class]];
}

- (void)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request
     completionHandler:(void (^)(AWSSESVerifyDomainDkimResponse *response, NSError *error))completionHandler {
    [[self verifyDomainDkim:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESVerifyDomainDkimResponse *> * _Nonnull task) {
        AWSSESVerifyDomainDkimResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESVerifyDomainIdentityResponse *> *)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyDomainIdentity"
                   outputClass:[AWSSESVerifyDomainIdentityResponse class]];
}

- (void)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request
     completionHandler:(void (^)(AWSSESVerifyDomainIdentityResponse *response, NSError *error))completionHandler {
    [[self verifyDomainIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESVerifyDomainIdentityResponse *> * _Nonnull task) {
        AWSSESVerifyDomainIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyEmailAddress"
                   outputClass:nil];
}

- (void)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self verifyEmailAddress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESVerifyEmailIdentityResponse *> *)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyEmailIdentity"
                   outputClass:[AWSSESVerifyEmailIdentityResponse class]];
}

- (void)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request
     completionHandler:(void (^)(AWSSESVerifyEmailIdentityResponse *response, NSError *error))completionHandler {
    [[self verifyEmailIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESVerifyEmailIdentityResponse *> * _Nonnull task) {
        AWSSESVerifyEmailIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
