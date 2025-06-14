//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSRekognitionService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSRekognitionResources.h"

static NSString *const AWSInfoRekognition = @"Rekognition";
NSString *const AWSRekognitionSDKVersion = @"2.41.0";


@interface AWSRekognitionResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSRekognitionResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSRekognitionErrorAccessDenied),
                            @"ConflictException" : @(AWSRekognitionErrorConflict),
                            @"HumanLoopQuotaExceededException" : @(AWSRekognitionErrorHumanLoopQuotaExceeded),
                            @"IdempotentParameterMismatchException" : @(AWSRekognitionErrorIdempotentParameterMismatch),
                            @"ImageTooLargeException" : @(AWSRekognitionErrorImageTooLarge),
                            @"InternalServerError" : @(AWSRekognitionErrorInternalServer),
                            @"InvalidImageFormatException" : @(AWSRekognitionErrorInvalidImageFormat),
                            @"InvalidManifestException" : @(AWSRekognitionErrorInvalidManifest),
                            @"InvalidPaginationTokenException" : @(AWSRekognitionErrorInvalidPaginationToken),
                            @"InvalidParameterException" : @(AWSRekognitionErrorInvalidParameter),
                            @"InvalidPolicyRevisionIdException" : @(AWSRekognitionErrorInvalidPolicyRevisionId),
                            @"InvalidS3ObjectException" : @(AWSRekognitionErrorInvalidS3Object),
                            @"LimitExceededException" : @(AWSRekognitionErrorLimitExceeded),
                            @"MalformedPolicyDocumentException" : @(AWSRekognitionErrorMalformedPolicyDocument),
                            @"ProvisionedThroughputExceededException" : @(AWSRekognitionErrorProvisionedThroughputExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSRekognitionErrorResourceAlreadyExists),
                            @"ResourceInUseException" : @(AWSRekognitionErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSRekognitionErrorResourceNotFound),
                            @"ResourceNotReadyException" : @(AWSRekognitionErrorResourceNotReady),
                            @"ServiceQuotaExceededException" : @(AWSRekognitionErrorServiceQuotaExceeded),
                            @"SessionNotFoundException" : @(AWSRekognitionErrorSessionNotFound),
                            @"ThrottlingException" : @(AWSRekognitionErrorThrottling),
                            @"VideoTooLargeException" : @(AWSRekognitionErrorVideoTooLarge),
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
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSRekognitionErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSRekognitionErrorDomain
                                     code:AWSRekognitionErrorUnknown
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

@interface AWSRekognitionRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSRekognitionRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSRekognition()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSRekognition

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSRekognitionSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSRekognition versions need to match. Check your SDK installation. AWSCore: %@ AWSRekognition: %@", AWSiOSSDKVersion, AWSRekognitionSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultRekognition {
    static AWSRekognition *_defaultRekognition = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoRekognition];
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
        _defaultRekognition = [[AWSRekognition alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultRekognition;
}

+ (void)registerRekognitionWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSRekognition alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)RekognitionForKey:(NSString *)key {
    @synchronized(self) {
        AWSRekognition *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoRekognition
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSRekognition registerRekognitionWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeRekognitionForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultRekognition` or `+ RekognitionForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceRekognition
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceRekognition];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSRekognitionRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.1"}; 
		
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSRekognitionResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSRekognitionResponseSerializer alloc] initWithJSONDefinition:[[AWSRekognitionResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSRekognitionAssociateFacesResponse *> *)associateFaces:(AWSRekognitionAssociateFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"AssociateFaces"
                   outputClass:[AWSRekognitionAssociateFacesResponse class]];
}

- (void)associateFaces:(AWSRekognitionAssociateFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionAssociateFacesResponse *response, NSError *error))completionHandler {
    [[self associateFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionAssociateFacesResponse *> * _Nonnull task) {
        AWSRekognitionAssociateFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCompareFacesResponse *> *)compareFaces:(AWSRekognitionCompareFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CompareFaces"
                   outputClass:[AWSRekognitionCompareFacesResponse class]];
}

- (void)compareFaces:(AWSRekognitionCompareFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionCompareFacesResponse *response, NSError *error))completionHandler {
    [[self compareFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCompareFacesResponse *> * _Nonnull task) {
        AWSRekognitionCompareFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionReplicateProjectVersionResponse *> *)replicateProjectVersion:(AWSRekognitionReplicateProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CopyProjectVersion"
                   outputClass:[AWSRekognitionReplicateProjectVersionResponse class]];
}

- (void)replicateProjectVersion:(AWSRekognitionReplicateProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionReplicateProjectVersionResponse *response, NSError *error))completionHandler {
    [[self replicateProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionReplicateProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionReplicateProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateCollectionResponse *> *)createCollection:(AWSRekognitionCreateCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateCollection"
                   outputClass:[AWSRekognitionCreateCollectionResponse class]];
}

- (void)createCollection:(AWSRekognitionCreateCollectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateCollectionResponse *response, NSError *error))completionHandler {
    [[self createCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateCollectionResponse *> * _Nonnull task) {
        AWSRekognitionCreateCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateDatasetResponse *> *)createDataset:(AWSRekognitionCreateDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateDataset"
                   outputClass:[AWSRekognitionCreateDatasetResponse class]];
}

- (void)createDataset:(AWSRekognitionCreateDatasetRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateDatasetResponse *response, NSError *error))completionHandler {
    [[self createDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateDatasetResponse *> * _Nonnull task) {
        AWSRekognitionCreateDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateFaceLivenessSessionResponse *> *)createFaceLivenessSession:(AWSRekognitionCreateFaceLivenessSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateFaceLivenessSession"
                   outputClass:[AWSRekognitionCreateFaceLivenessSessionResponse class]];
}

- (void)createFaceLivenessSession:(AWSRekognitionCreateFaceLivenessSessionRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateFaceLivenessSessionResponse *response, NSError *error))completionHandler {
    [[self createFaceLivenessSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateFaceLivenessSessionResponse *> * _Nonnull task) {
        AWSRekognitionCreateFaceLivenessSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateProjectResponse *> *)createProject:(AWSRekognitionCreateProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateProject"
                   outputClass:[AWSRekognitionCreateProjectResponse class]];
}

- (void)createProject:(AWSRekognitionCreateProjectRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateProjectResponse *response, NSError *error))completionHandler {
    [[self createProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateProjectResponse *> * _Nonnull task) {
        AWSRekognitionCreateProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateProjectVersionResponse *> *)createProjectVersion:(AWSRekognitionCreateProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateProjectVersion"
                   outputClass:[AWSRekognitionCreateProjectVersionResponse class]];
}

- (void)createProjectVersion:(AWSRekognitionCreateProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateProjectVersionResponse *response, NSError *error))completionHandler {
    [[self createProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionCreateProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateStreamProcessorResponse *> *)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateStreamProcessor"
                   outputClass:[AWSRekognitionCreateStreamProcessorResponse class]];
}

- (void)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self createStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionCreateStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateUserResponse *> *)createUser:(AWSRekognitionCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateUser"
                   outputClass:[AWSRekognitionCreateUserResponse class]];
}

- (void)createUser:(AWSRekognitionCreateUserRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateUserResponse *> * _Nonnull task) {
        AWSRekognitionCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteCollectionResponse *> *)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteCollection"
                   outputClass:[AWSRekognitionDeleteCollectionResponse class]];
}

- (void)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteCollectionResponse *response, NSError *error))completionHandler {
    [[self deleteCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteCollectionResponse *> * _Nonnull task) {
        AWSRekognitionDeleteCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteDatasetResponse *> *)deleteDataset:(AWSRekognitionDeleteDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteDataset"
                   outputClass:[AWSRekognitionDeleteDatasetResponse class]];
}

- (void)deleteDataset:(AWSRekognitionDeleteDatasetRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteDatasetResponse *response, NSError *error))completionHandler {
    [[self deleteDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteDatasetResponse *> * _Nonnull task) {
        AWSRekognitionDeleteDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteFacesResponse *> *)deleteFaces:(AWSRekognitionDeleteFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteFaces"
                   outputClass:[AWSRekognitionDeleteFacesResponse class]];
}

- (void)deleteFaces:(AWSRekognitionDeleteFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteFacesResponse *response, NSError *error))completionHandler {
    [[self deleteFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteFacesResponse *> * _Nonnull task) {
        AWSRekognitionDeleteFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteProjectResponse *> *)deleteProject:(AWSRekognitionDeleteProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteProject"
                   outputClass:[AWSRekognitionDeleteProjectResponse class]];
}

- (void)deleteProject:(AWSRekognitionDeleteProjectRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteProjectResponse *response, NSError *error))completionHandler {
    [[self deleteProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteProjectResponse *> * _Nonnull task) {
        AWSRekognitionDeleteProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteProjectPolicyResponse *> *)deleteProjectPolicy:(AWSRekognitionDeleteProjectPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteProjectPolicy"
                   outputClass:[AWSRekognitionDeleteProjectPolicyResponse class]];
}

- (void)deleteProjectPolicy:(AWSRekognitionDeleteProjectPolicyRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteProjectPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteProjectPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteProjectPolicyResponse *> * _Nonnull task) {
        AWSRekognitionDeleteProjectPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteProjectVersionResponse *> *)deleteProjectVersion:(AWSRekognitionDeleteProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteProjectVersion"
                   outputClass:[AWSRekognitionDeleteProjectVersionResponse class]];
}

- (void)deleteProjectVersion:(AWSRekognitionDeleteProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteProjectVersionResponse *response, NSError *error))completionHandler {
    [[self deleteProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionDeleteProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteStreamProcessorResponse *> *)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteStreamProcessor"
                   outputClass:[AWSRekognitionDeleteStreamProcessorResponse class]];
}

- (void)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self deleteStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionDeleteStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteUserResponse *> *)deleteUser:(AWSRekognitionDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteUser"
                   outputClass:[AWSRekognitionDeleteUserResponse class]];
}

- (void)deleteUser:(AWSRekognitionDeleteUserRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteUserResponse *response, NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteUserResponse *> * _Nonnull task) {
        AWSRekognitionDeleteUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeCollectionResponse *> *)describeCollection:(AWSRekognitionDescribeCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeCollection"
                   outputClass:[AWSRekognitionDescribeCollectionResponse class]];
}

- (void)describeCollection:(AWSRekognitionDescribeCollectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeCollectionResponse *response, NSError *error))completionHandler {
    [[self describeCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeCollectionResponse *> * _Nonnull task) {
        AWSRekognitionDescribeCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeDatasetResponse *> *)describeDataset:(AWSRekognitionDescribeDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeDataset"
                   outputClass:[AWSRekognitionDescribeDatasetResponse class]];
}

- (void)describeDataset:(AWSRekognitionDescribeDatasetRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeDatasetResponse *response, NSError *error))completionHandler {
    [[self describeDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeDatasetResponse *> * _Nonnull task) {
        AWSRekognitionDescribeDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeProjectVersionsResponse *> *)describeProjectVersions:(AWSRekognitionDescribeProjectVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeProjectVersions"
                   outputClass:[AWSRekognitionDescribeProjectVersionsResponse class]];
}

- (void)describeProjectVersions:(AWSRekognitionDescribeProjectVersionsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeProjectVersionsResponse *response, NSError *error))completionHandler {
    [[self describeProjectVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeProjectVersionsResponse *> * _Nonnull task) {
        AWSRekognitionDescribeProjectVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeProjectsResponse *> *)describeProjects:(AWSRekognitionDescribeProjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeProjects"
                   outputClass:[AWSRekognitionDescribeProjectsResponse class]];
}

- (void)describeProjects:(AWSRekognitionDescribeProjectsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeProjectsResponse *response, NSError *error))completionHandler {
    [[self describeProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeProjectsResponse *> * _Nonnull task) {
        AWSRekognitionDescribeProjectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeStreamProcessorResponse *> *)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeStreamProcessor"
                   outputClass:[AWSRekognitionDescribeStreamProcessorResponse class]];
}

- (void)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self describeStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionDescribeStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectCustomLabelsResponse *> *)detectCustomLabels:(AWSRekognitionDetectCustomLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectCustomLabels"
                   outputClass:[AWSRekognitionDetectCustomLabelsResponse class]];
}

- (void)detectCustomLabels:(AWSRekognitionDetectCustomLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectCustomLabelsResponse *response, NSError *error))completionHandler {
    [[self detectCustomLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectCustomLabelsResponse *> * _Nonnull task) {
        AWSRekognitionDetectCustomLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectFacesResponse *> *)detectFaces:(AWSRekognitionDetectFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectFaces"
                   outputClass:[AWSRekognitionDetectFacesResponse class]];
}

- (void)detectFaces:(AWSRekognitionDetectFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectFacesResponse *response, NSError *error))completionHandler {
    [[self detectFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectFacesResponse *> * _Nonnull task) {
        AWSRekognitionDetectFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectLabelsResponse *> *)detectLabels:(AWSRekognitionDetectLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectLabels"
                   outputClass:[AWSRekognitionDetectLabelsResponse class]];
}

- (void)detectLabels:(AWSRekognitionDetectLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectLabelsResponse *response, NSError *error))completionHandler {
    [[self detectLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectLabelsResponse *> * _Nonnull task) {
        AWSRekognitionDetectLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectModerationLabelsResponse *> *)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectModerationLabels"
                   outputClass:[AWSRekognitionDetectModerationLabelsResponse class]];
}

- (void)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectModerationLabelsResponse *response, NSError *error))completionHandler {
    [[self detectModerationLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectModerationLabelsResponse *> * _Nonnull task) {
        AWSRekognitionDetectModerationLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectProtectiveEquipmentResponse *> *)detectProtectiveEquipment:(AWSRekognitionDetectProtectiveEquipmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectProtectiveEquipment"
                   outputClass:[AWSRekognitionDetectProtectiveEquipmentResponse class]];
}

- (void)detectProtectiveEquipment:(AWSRekognitionDetectProtectiveEquipmentRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectProtectiveEquipmentResponse *response, NSError *error))completionHandler {
    [[self detectProtectiveEquipment:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectProtectiveEquipmentResponse *> * _Nonnull task) {
        AWSRekognitionDetectProtectiveEquipmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectTextResponse *> *)detectText:(AWSRekognitionDetectTextRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectText"
                   outputClass:[AWSRekognitionDetectTextResponse class]];
}

- (void)detectText:(AWSRekognitionDetectTextRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectTextResponse *response, NSError *error))completionHandler {
    [[self detectText:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectTextResponse *> * _Nonnull task) {
        AWSRekognitionDetectTextResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDisassociateFacesResponse *> *)disassociateFaces:(AWSRekognitionDisassociateFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DisassociateFaces"
                   outputClass:[AWSRekognitionDisassociateFacesResponse class]];
}

- (void)disassociateFaces:(AWSRekognitionDisassociateFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionDisassociateFacesResponse *response, NSError *error))completionHandler {
    [[self disassociateFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDisassociateFacesResponse *> * _Nonnull task) {
        AWSRekognitionDisassociateFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDistributeDatasetEntriesResponse *> *)distributeDatasetEntries:(AWSRekognitionDistributeDatasetEntriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DistributeDatasetEntries"
                   outputClass:[AWSRekognitionDistributeDatasetEntriesResponse class]];
}

- (void)distributeDatasetEntries:(AWSRekognitionDistributeDatasetEntriesRequest *)request
     completionHandler:(void (^)(AWSRekognitionDistributeDatasetEntriesResponse *response, NSError *error))completionHandler {
    [[self distributeDatasetEntries:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDistributeDatasetEntriesResponse *> * _Nonnull task) {
        AWSRekognitionDistributeDatasetEntriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetCelebrityInfoResponse *> *)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetCelebrityInfo"
                   outputClass:[AWSRekognitionGetCelebrityInfoResponse class]];
}

- (void)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetCelebrityInfoResponse *response, NSError *error))completionHandler {
    [[self getCelebrityInfo:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetCelebrityInfoResponse *> * _Nonnull task) {
        AWSRekognitionGetCelebrityInfoResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetCelebrityRecognitionResponse *> *)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetCelebrityRecognition"
                   outputClass:[AWSRekognitionGetCelebrityRecognitionResponse class]];
}

- (void)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetCelebrityRecognitionResponse *response, NSError *error))completionHandler {
    [[self getCelebrityRecognition:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetCelebrityRecognitionResponse *> * _Nonnull task) {
        AWSRekognitionGetCelebrityRecognitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetContentModerationResponse *> *)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetContentModeration"
                   outputClass:[AWSRekognitionGetContentModerationResponse class]];
}

- (void)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetContentModerationResponse *response, NSError *error))completionHandler {
    [[self getContentModeration:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetContentModerationResponse *> * _Nonnull task) {
        AWSRekognitionGetContentModerationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetFaceDetectionResponse *> *)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetFaceDetection"
                   outputClass:[AWSRekognitionGetFaceDetectionResponse class]];
}

- (void)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetFaceDetectionResponse *response, NSError *error))completionHandler {
    [[self getFaceDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetFaceDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetFaceDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetFaceLivenessSessionResultsResponse *> *)getFaceLivenessSessionResults:(AWSRekognitionGetFaceLivenessSessionResultsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetFaceLivenessSessionResults"
                   outputClass:[AWSRekognitionGetFaceLivenessSessionResultsResponse class]];
}

- (void)getFaceLivenessSessionResults:(AWSRekognitionGetFaceLivenessSessionResultsRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetFaceLivenessSessionResultsResponse *response, NSError *error))completionHandler {
    [[self getFaceLivenessSessionResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetFaceLivenessSessionResultsResponse *> * _Nonnull task) {
        AWSRekognitionGetFaceLivenessSessionResultsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetFaceSearchResponse *> *)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetFaceSearch"
                   outputClass:[AWSRekognitionGetFaceSearchResponse class]];
}

- (void)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetFaceSearchResponse *response, NSError *error))completionHandler {
    [[self getFaceSearch:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetFaceSearchResponse *> * _Nonnull task) {
        AWSRekognitionGetFaceSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetLabelDetectionResponse *> *)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetLabelDetection"
                   outputClass:[AWSRekognitionGetLabelDetectionResponse class]];
}

- (void)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetLabelDetectionResponse *response, NSError *error))completionHandler {
    [[self getLabelDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetLabelDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetLabelDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetMediaAnalysisJobResponse *> *)getMediaAnalysisJob:(AWSRekognitionGetMediaAnalysisJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetMediaAnalysisJob"
                   outputClass:[AWSRekognitionGetMediaAnalysisJobResponse class]];
}

- (void)getMediaAnalysisJob:(AWSRekognitionGetMediaAnalysisJobRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetMediaAnalysisJobResponse *response, NSError *error))completionHandler {
    [[self getMediaAnalysisJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetMediaAnalysisJobResponse *> * _Nonnull task) {
        AWSRekognitionGetMediaAnalysisJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetPersonTrackingResponse *> *)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetPersonTracking"
                   outputClass:[AWSRekognitionGetPersonTrackingResponse class]];
}

- (void)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetPersonTrackingResponse *response, NSError *error))completionHandler {
    [[self getPersonTracking:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetPersonTrackingResponse *> * _Nonnull task) {
        AWSRekognitionGetPersonTrackingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetSegmentDetectionResponse *> *)getSegmentDetection:(AWSRekognitionGetSegmentDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetSegmentDetection"
                   outputClass:[AWSRekognitionGetSegmentDetectionResponse class]];
}

- (void)getSegmentDetection:(AWSRekognitionGetSegmentDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetSegmentDetectionResponse *response, NSError *error))completionHandler {
    [[self getSegmentDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetSegmentDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetSegmentDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetTextDetectionResponse *> *)getTextDetection:(AWSRekognitionGetTextDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetTextDetection"
                   outputClass:[AWSRekognitionGetTextDetectionResponse class]];
}

- (void)getTextDetection:(AWSRekognitionGetTextDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetTextDetectionResponse *response, NSError *error))completionHandler {
    [[self getTextDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetTextDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetTextDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionIndexFacesResponse *> *)indexFaces:(AWSRekognitionIndexFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"IndexFaces"
                   outputClass:[AWSRekognitionIndexFacesResponse class]];
}

- (void)indexFaces:(AWSRekognitionIndexFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionIndexFacesResponse *response, NSError *error))completionHandler {
    [[self indexFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionIndexFacesResponse *> * _Nonnull task) {
        AWSRekognitionIndexFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListCollectionsResponse *> *)listCollections:(AWSRekognitionListCollectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListCollections"
                   outputClass:[AWSRekognitionListCollectionsResponse class]];
}

- (void)listCollections:(AWSRekognitionListCollectionsRequest *)request
     completionHandler:(void (^)(AWSRekognitionListCollectionsResponse *response, NSError *error))completionHandler {
    [[self listCollections:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListCollectionsResponse *> * _Nonnull task) {
        AWSRekognitionListCollectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListDatasetEntriesResponse *> *)listDatasetEntries:(AWSRekognitionListDatasetEntriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListDatasetEntries"
                   outputClass:[AWSRekognitionListDatasetEntriesResponse class]];
}

- (void)listDatasetEntries:(AWSRekognitionListDatasetEntriesRequest *)request
     completionHandler:(void (^)(AWSRekognitionListDatasetEntriesResponse *response, NSError *error))completionHandler {
    [[self listDatasetEntries:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListDatasetEntriesResponse *> * _Nonnull task) {
        AWSRekognitionListDatasetEntriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListDatasetLabelsResponse *> *)listDatasetLabels:(AWSRekognitionListDatasetLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListDatasetLabels"
                   outputClass:[AWSRekognitionListDatasetLabelsResponse class]];
}

- (void)listDatasetLabels:(AWSRekognitionListDatasetLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionListDatasetLabelsResponse *response, NSError *error))completionHandler {
    [[self listDatasetLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListDatasetLabelsResponse *> * _Nonnull task) {
        AWSRekognitionListDatasetLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListFacesResponse *> *)listFaces:(AWSRekognitionListFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListFaces"
                   outputClass:[AWSRekognitionListFacesResponse class]];
}

- (void)listFaces:(AWSRekognitionListFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionListFacesResponse *response, NSError *error))completionHandler {
    [[self listFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListFacesResponse *> * _Nonnull task) {
        AWSRekognitionListFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListMediaAnalysisJobsResponse *> *)listMediaAnalysisJobs:(AWSRekognitionListMediaAnalysisJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListMediaAnalysisJobs"
                   outputClass:[AWSRekognitionListMediaAnalysisJobsResponse class]];
}

- (void)listMediaAnalysisJobs:(AWSRekognitionListMediaAnalysisJobsRequest *)request
     completionHandler:(void (^)(AWSRekognitionListMediaAnalysisJobsResponse *response, NSError *error))completionHandler {
    [[self listMediaAnalysisJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListMediaAnalysisJobsResponse *> * _Nonnull task) {
        AWSRekognitionListMediaAnalysisJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListProjectPoliciesResponse *> *)listProjectPolicies:(AWSRekognitionListProjectPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListProjectPolicies"
                   outputClass:[AWSRekognitionListProjectPoliciesResponse class]];
}

- (void)listProjectPolicies:(AWSRekognitionListProjectPoliciesRequest *)request
     completionHandler:(void (^)(AWSRekognitionListProjectPoliciesResponse *response, NSError *error))completionHandler {
    [[self listProjectPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListProjectPoliciesResponse *> * _Nonnull task) {
        AWSRekognitionListProjectPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListStreamProcessorsResponse *> *)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListStreamProcessors"
                   outputClass:[AWSRekognitionListStreamProcessorsResponse class]];
}

- (void)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request
     completionHandler:(void (^)(AWSRekognitionListStreamProcessorsResponse *response, NSError *error))completionHandler {
    [[self listStreamProcessors:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListStreamProcessorsResponse *> * _Nonnull task) {
        AWSRekognitionListStreamProcessorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListTagsForResourceResponse *> *)listTagsForResource:(AWSRekognitionListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSRekognitionListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSRekognitionListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSRekognitionListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListTagsForResourceResponse *> * _Nonnull task) {
        AWSRekognitionListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListUsersResponse *> *)listUsers:(AWSRekognitionListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListUsers"
                   outputClass:[AWSRekognitionListUsersResponse class]];
}

- (void)listUsers:(AWSRekognitionListUsersRequest *)request
     completionHandler:(void (^)(AWSRekognitionListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListUsersResponse *> * _Nonnull task) {
        AWSRekognitionListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionPutProjectPolicyResponse *> *)putProjectPolicy:(AWSRekognitionPutProjectPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"PutProjectPolicy"
                   outputClass:[AWSRekognitionPutProjectPolicyResponse class]];
}

- (void)putProjectPolicy:(AWSRekognitionPutProjectPolicyRequest *)request
     completionHandler:(void (^)(AWSRekognitionPutProjectPolicyResponse *response, NSError *error))completionHandler {
    [[self putProjectPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionPutProjectPolicyResponse *> * _Nonnull task) {
        AWSRekognitionPutProjectPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionRecognizeCelebritiesResponse *> *)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"RecognizeCelebrities"
                   outputClass:[AWSRekognitionRecognizeCelebritiesResponse class]];
}

- (void)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request
     completionHandler:(void (^)(AWSRekognitionRecognizeCelebritiesResponse *response, NSError *error))completionHandler {
    [[self recognizeCelebrities:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionRecognizeCelebritiesResponse *> * _Nonnull task) {
        AWSRekognitionRecognizeCelebritiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionSearchFacesResponse *> *)searchFaces:(AWSRekognitionSearchFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"SearchFaces"
                   outputClass:[AWSRekognitionSearchFacesResponse class]];
}

- (void)searchFaces:(AWSRekognitionSearchFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionSearchFacesResponse *response, NSError *error))completionHandler {
    [[self searchFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionSearchFacesResponse *> * _Nonnull task) {
        AWSRekognitionSearchFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionSearchFacesByImageResponse *> *)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"SearchFacesByImage"
                   outputClass:[AWSRekognitionSearchFacesByImageResponse class]];
}

- (void)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request
     completionHandler:(void (^)(AWSRekognitionSearchFacesByImageResponse *response, NSError *error))completionHandler {
    [[self searchFacesByImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionSearchFacesByImageResponse *> * _Nonnull task) {
        AWSRekognitionSearchFacesByImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionSearchUsersResponse *> *)searchUsers:(AWSRekognitionSearchUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"SearchUsers"
                   outputClass:[AWSRekognitionSearchUsersResponse class]];
}

- (void)searchUsers:(AWSRekognitionSearchUsersRequest *)request
     completionHandler:(void (^)(AWSRekognitionSearchUsersResponse *response, NSError *error))completionHandler {
    [[self searchUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionSearchUsersResponse *> * _Nonnull task) {
        AWSRekognitionSearchUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionSearchUsersByImageResponse *> *)searchUsersByImage:(AWSRekognitionSearchUsersByImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"SearchUsersByImage"
                   outputClass:[AWSRekognitionSearchUsersByImageResponse class]];
}

- (void)searchUsersByImage:(AWSRekognitionSearchUsersByImageRequest *)request
     completionHandler:(void (^)(AWSRekognitionSearchUsersByImageResponse *response, NSError *error))completionHandler {
    [[self searchUsersByImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionSearchUsersByImageResponse *> * _Nonnull task) {
        AWSRekognitionSearchUsersByImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartCelebrityRecognitionResponse *> *)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartCelebrityRecognition"
                   outputClass:[AWSRekognitionStartCelebrityRecognitionResponse class]];
}

- (void)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartCelebrityRecognitionResponse *response, NSError *error))completionHandler {
    [[self startCelebrityRecognition:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartCelebrityRecognitionResponse *> * _Nonnull task) {
        AWSRekognitionStartCelebrityRecognitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartContentModerationResponse *> *)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartContentModeration"
                   outputClass:[AWSRekognitionStartContentModerationResponse class]];
}

- (void)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartContentModerationResponse *response, NSError *error))completionHandler {
    [[self startContentModeration:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartContentModerationResponse *> * _Nonnull task) {
        AWSRekognitionStartContentModerationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartFaceDetectionResponse *> *)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartFaceDetection"
                   outputClass:[AWSRekognitionStartFaceDetectionResponse class]];
}

- (void)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartFaceDetectionResponse *response, NSError *error))completionHandler {
    [[self startFaceDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartFaceDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartFaceDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartFaceSearchResponse *> *)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartFaceSearch"
                   outputClass:[AWSRekognitionStartFaceSearchResponse class]];
}

- (void)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartFaceSearchResponse *response, NSError *error))completionHandler {
    [[self startFaceSearch:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartFaceSearchResponse *> * _Nonnull task) {
        AWSRekognitionStartFaceSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartLabelDetectionResponse *> *)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartLabelDetection"
                   outputClass:[AWSRekognitionStartLabelDetectionResponse class]];
}

- (void)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartLabelDetectionResponse *response, NSError *error))completionHandler {
    [[self startLabelDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartLabelDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartLabelDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartMediaAnalysisJobResponse *> *)startMediaAnalysisJob:(AWSRekognitionStartMediaAnalysisJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartMediaAnalysisJob"
                   outputClass:[AWSRekognitionStartMediaAnalysisJobResponse class]];
}

- (void)startMediaAnalysisJob:(AWSRekognitionStartMediaAnalysisJobRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartMediaAnalysisJobResponse *response, NSError *error))completionHandler {
    [[self startMediaAnalysisJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartMediaAnalysisJobResponse *> * _Nonnull task) {
        AWSRekognitionStartMediaAnalysisJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartPersonTrackingResponse *> *)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartPersonTracking"
                   outputClass:[AWSRekognitionStartPersonTrackingResponse class]];
}

- (void)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartPersonTrackingResponse *response, NSError *error))completionHandler {
    [[self startPersonTracking:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartPersonTrackingResponse *> * _Nonnull task) {
        AWSRekognitionStartPersonTrackingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartProjectVersionResponse *> *)startProjectVersion:(AWSRekognitionStartProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartProjectVersion"
                   outputClass:[AWSRekognitionStartProjectVersionResponse class]];
}

- (void)startProjectVersion:(AWSRekognitionStartProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartProjectVersionResponse *response, NSError *error))completionHandler {
    [[self startProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionStartProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartSegmentDetectionResponse *> *)startSegmentDetection:(AWSRekognitionStartSegmentDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartSegmentDetection"
                   outputClass:[AWSRekognitionStartSegmentDetectionResponse class]];
}

- (void)startSegmentDetection:(AWSRekognitionStartSegmentDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartSegmentDetectionResponse *response, NSError *error))completionHandler {
    [[self startSegmentDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartSegmentDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartSegmentDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartStreamProcessorResponse *> *)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartStreamProcessor"
                   outputClass:[AWSRekognitionStartStreamProcessorResponse class]];
}

- (void)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self startStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionStartStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartTextDetectionResponse *> *)startTextDetection:(AWSRekognitionStartTextDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartTextDetection"
                   outputClass:[AWSRekognitionStartTextDetectionResponse class]];
}

- (void)startTextDetection:(AWSRekognitionStartTextDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartTextDetectionResponse *response, NSError *error))completionHandler {
    [[self startTextDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartTextDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartTextDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStopProjectVersionResponse *> *)stopProjectVersion:(AWSRekognitionStopProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StopProjectVersion"
                   outputClass:[AWSRekognitionStopProjectVersionResponse class]];
}

- (void)stopProjectVersion:(AWSRekognitionStopProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStopProjectVersionResponse *response, NSError *error))completionHandler {
    [[self stopProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStopProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionStopProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStopStreamProcessorResponse *> *)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StopStreamProcessor"
                   outputClass:[AWSRekognitionStopStreamProcessorResponse class]];
}

- (void)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionStopStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self stopStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStopStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionStopStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionTagResourceResponse *> *)tagResource:(AWSRekognitionTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"TagResource"
                   outputClass:[AWSRekognitionTagResourceResponse class]];
}

- (void)tagResource:(AWSRekognitionTagResourceRequest *)request
     completionHandler:(void (^)(AWSRekognitionTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionTagResourceResponse *> * _Nonnull task) {
        AWSRekognitionTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionUntagResourceResponse *> *)untagResource:(AWSRekognitionUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"UntagResource"
                   outputClass:[AWSRekognitionUntagResourceResponse class]];
}

- (void)untagResource:(AWSRekognitionUntagResourceRequest *)request
     completionHandler:(void (^)(AWSRekognitionUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionUntagResourceResponse *> * _Nonnull task) {
        AWSRekognitionUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionUpdateDatasetEntriesResponse *> *)updateDatasetEntries:(AWSRekognitionUpdateDatasetEntriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"UpdateDatasetEntries"
                   outputClass:[AWSRekognitionUpdateDatasetEntriesResponse class]];
}

- (void)updateDatasetEntries:(AWSRekognitionUpdateDatasetEntriesRequest *)request
     completionHandler:(void (^)(AWSRekognitionUpdateDatasetEntriesResponse *response, NSError *error))completionHandler {
    [[self updateDatasetEntries:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionUpdateDatasetEntriesResponse *> * _Nonnull task) {
        AWSRekognitionUpdateDatasetEntriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionUpdateStreamProcessorResponse *> *)updateStreamProcessor:(AWSRekognitionUpdateStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"UpdateStreamProcessor"
                   outputClass:[AWSRekognitionUpdateStreamProcessorResponse class]];
}

- (void)updateStreamProcessor:(AWSRekognitionUpdateStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionUpdateStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self updateStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionUpdateStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionUpdateStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
