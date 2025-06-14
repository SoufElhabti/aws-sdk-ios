# AWS Mobile SDK for iOS CHANGELOG

## Unreleased

-Features for next release

## 2.41.0

**AWSCore**
- Support for `ap-east-2` - Asia Pacific (Taipei) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.40.2

### Bug Fixes

- **AWSIoT** 
  - fix race conditions and crashes (#5511)

- **Auth** 
  - error handling around accessing credentials (#5509)

## 2.40.1

### Bug Fixes
- **AWSCore** 
  - call response interceptors in HTTP response handlers (#5495)

## 2.40.0

### New features
- **AWSCore**
  - Support for `mx-central-1` - Mexico (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

### Bug Fixes
- **AWSLocation** 
  - Fixing clock skew retries (#5491)

## 2.39.0

### New features
- **AWSCore**
  - Support for `ap-southeast-7` - Asia Pacific (Bangkok) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.38.2

### New features

- **AWSTranscribeStreaming**
  - Adding support for missing languages (#5483)

## 2.38.1

### Bug Fixes

- **AWSIoT** 
  - Fixing race conditions during cleanup in `AWSIoTStreamThread` (#5477)
  - Fixing a race condition when invalidating/creating the reconnect timer in `AWSIoTMQTTClient` (#5454)
  - Fixing a potential race condition in the timer ring queue in `AWSMQTTSession` (#5461)

## 2.38.0

### Misc. Updates
- **AWSMobileClient**
  - **Breaking API change** Removing the following deprecated methods:
    - `interceptApplication(_:didFinishLaunchingWithOptions:)`
    - `interceptApplication(_:didFinishLaunchingWithOptions:resumeSessionWithCompletionHandler:)`
    - `setSignInProviders(_:)`
    - `getCredentialsProvider()`

### Bug Fixes
- **AWSS3**
  - Fix reading content_length from DB in AWSS3TransferUtilityDatabaseHelper.m `getTransferTaskDataFromDB`

## 2.37.2

### Bug Fixes

- **AWSIoT** 
  - Replacing deprecated `SecKeyRawSign` with `SecKeyCreateSignature` (#5442)

## 2.37.1

### Bug Fixes

- **AWSPinpoint**
  - Fixing error decoding `AWSPinpointEndpointProfile` when user attributes are set. (#5431)

## 2.37.0

### New features
- **AWSCore**
  - Support for `ap-southeast-5` - Asia Pacific (Malaysia) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.36.7

- **AWSIoT** 
  - Using custom atomic dictionary for topic listeners (#5415)
  - Fixing random crash when a connection is attempted just after disconnecting

## 2.36.6

### Bug Fixes

- **AWSIoT** 
  - Fixing a potential race condition on topic listeners (#5402)

## 2.36.5

### New features 

- **AWSIoT** 
  - Adding completion callbacks for registerWithShadow and unregisterFromShadow methods (#5192)

### Misc. Updates

- Model updates for the following services
  - AWSRekognition
  - AWSConnect
  - AWSAutoScaling
  - AWSEC2
  - AWSDynamoDB
  - AWSPolly
  - AWSCognitoIdentityProvider
  - AWSKMS
  - AWSSNS
  - AWSLocation
  - AWSFirehose
  - AWSTranscribe

## 2.36.4

### Deprecated release

This release is deprecated due to errors. Please use 2.36.5 or greater.

## 2.36.3

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSCognitoIdentityProvider
  - AWSPolly
  - AWSElasticLoadBalancingv2
  - AWSDynamoDB
  - AWSKMS
  - AWSConnect

- **AWSCore**
  - Fixing a name collision with CocoaLumberjack (#5361)

## 2.36.2

- **AWSMobileClient**
  - Fixing HostedUI page not being shown when providing a navigationController (#5324)

## 2.36.1

### Bug Fixes

- **AWSMobileClient**
  - Fixing a crash when attempting to use HostedUI (#5316)

## 2.36.0

### New features

- Updating the iOS deployment target to 12.0 for the following services:
  - AWSAPIGateway
  - AWSAuth
  - AWSAuthCore
  - AWSAuthUI
  - AWSAutoScaling
  - AWSChimeSDKIdentity
  - AWSChimeSDKMessaging
  - AWSCloudWatch
  - AWSCognitoAuth
  - AWSCognitoIdentityProvider
  - AWSCognitoIdentityProviderASF
  - AWSComprehend
  - AWSConnect
  - AWSConnectParticipant
  - AWSCore
  - AWSDynamoDB
  - AWSEC2
  - AWSElasticLoadBalancing
  - AWSFacebookSignIn
  - AWSGoogleSignIn
  - AWSiOSSDKv2
  - AWSIoT
  - AWSKinesis
  - AWSKinesisVideo
  - AWSKinesisVideoArchivedMedia
  - AWSKinesisVideoSignaling
  - AWSKinesisVideoWebRTCStorage
  - AWSKMS
  - AWSLambda
  - AWSLex
  - AWSLocation
  - AWSLogs
  - AWSMachineLearning
  - AWSMobileClient
  - AWSPinpoint
  - AWSPolly
  - AWSRekognition
  - AWSS3
  - AWSSageMakerRuntime
  - AWSSES
  - AWSSimpleDB
  - AWSSNS
  - AWSSQS
  - AWSTextract
  - AWSTranscribe
  - AWSTranscribeStreaming
  - AWSTranslate
  - AWSUserPoolsSignIn

- **AWSCore**
  - Updating CocoaLumberjack to version 3.4.8

### Misc. Updates
- **AWSIoT**
  - Updating `AWSIoTMQTTConfiguration.keepAliveTimeInterval`'s default value in its attribute comment.

## 2.35.0

### Bug Fixes

- **AWSIoT**
  - Fixing an intermittent crash when deallocating AWSIoTStreamThread (See [PR #5269](https://github.com/aws-amplify/aws-sdk-ios/issues/5269))

### Misc. Updates

- Model updates for the following services
  - AWSLambda
  - AWSEC2
  - AWSFirehose
  - AWSDynamoDB
  - AWSConnect
  - AWSCloudWatchLogs (**Breaking Change**)
  - AWSKMS
  - AWSElasticLoadBalancingv2
  - AWSCognitoIdentityProvider
  - AWSAutoScalling
  - AWSIoT

## 2.34.2

### Misc. Updates
- privacy manifest pod specs (#5259)

## 2.34.1

### Misc. Updates
- Add privacy manifest (#5214)
- privacy manifest targets for AWSAuthSDK targets (#5248)

## 2.34.0

### Misc. Updates

- Model updates for the following services
  - AWSKinesisVideo
  - AWSFirehose
  - AWSLambda
  - AWSDynamoDB
  - AWSConnectParticipant
  - AWSSNS
  - AWSPolly
  - AWSCognitoIdentityProvider
  - AWSElasticLoadBalancingv2
  - AWSEC2
  - AWSComprehend
  - AWSAutoScaling
  - AWSConnect
  - AWSIoT (**Breaking Change**)

## 2.33.10

### New features

- **AWSS3TransferUtility**
  - Adding support for path-style access requests

### Bug Fixes

- **AWSIoT**
  - Fixing auto reconnection not working properly

## 2.33.9

### Bug Fixes

- **AWSIoT**
  - Fixing crash in AWSIoTMQTTClient (See [PR #5185](https://github.com/aws-amplify/aws-sdk-ios/pull/5185))

### Misc. Updates

- Model updates for the following services
  - AWSDynamoDB
  - AWSLocation
  - AWSConnectParticipant
  - AWSConnect
  - AWSEC2

## 2.33.8

### Misc. Updates

- Model updates for the following services
  - AWSKinesisVideoArchivedMedia
  - AWSLocation
  - AWSComprehend
  - AWSIoT
  - AWSKMS
  - AWSPinpoint
  - AWSFirehose
  - AWSCognitoIdentityProvider
  - AWSEC2
  - AWSConnect

## 2.33.7

### New features
- **AWSCore**
  - Support for `ca-west-1` - Canada West (Calgary) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.33.6

### New features

- **AWSCognito**
  - add UIAdaptivePresentationControllerDelegate to handle user swipe down to dismiss the SafariViewController

- **AWSS3TransferUtility**
  - added MD5 content verification for multi-part uploads

### Bug Fixes

- **CognitoIdentity**
  - Don't overwrite AWSServiceConfiguration provided headers.

- **AWS Mobile Client**
  - make AWSMobileClientError message getter public

- **AWS Mobile Client**
  - add missing userSub property to SignUpResult

- **AWSS3**
  - set taskIdentifier attribute to nonatomic in transferutilitytask_private

### Misc. Updates

- Model updates for the following services
  - AWSElasticLoadBalancingv2
  - AWSCloudWatchLogs
  - AWSTranscribe
  - AWSLocation
  - AWSSTS
  - AWSKinesisVideo
  - AWSConnect
  - AWSEC2

### 2.33.5

### Bug Fixes

- IoT
  - fix(IoT): Fixing naming collision with SocketRocket

### Misc. Updates

- Model updates for the following services
  - AWSCognitoIdentityProvider
  - AWSConnect
  - AWSConnectParticipant
  - AWSElasticLoadBalancingv2
  - AWSEC2
  - AWSFirehose
  - AWSPolly
  - AWSIoT
  - AWSLambda

## 2.33.4

### Misc. Updates

- Model updates for the following services
  - AWSDynamoDB
  - AWSEC2
  - AWSSTS
  - AWSLambda
  - AWSPolly
  - AWSSES
  - AWSEC2
  - AWSConnect
  - AWSElasticLoadBalancingv2
  - AWSKinesisVideo
  - AWSRekognition
  - AWSKinesisVideoArchivedMedia
  - AWSAutoScaling
  - AWSCognitoIdentityProvider
  - AWSPinpoint
  - AWSSQS

## 2.33.3

### New features
- **AWSCore**
  - Support for `il-central-1` - Israel (Tel Aviv) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.33.2

### Bug Fixes
- **AWSAuthUI**
  - Fixed spacing and color issues in `AWSSignInViewController` when displaying social providers.

- **AWSFacebookSignIn** & **AWSAuthGoogleSignIn**
  - Added support for Dark Mode colors

- **AWSTranscribeStreaming**
  - Fixed assigning of host for CN regions in AWSTranscribeStreaming

### Misc. Updates

- Model updates for the following services
  - AWSCloudWatchLogs
  - AWSCognitoIdentityProvider
  - AWSEC2
  - AWSLocation
  - AWSConnect
  - AWSTranslate
  - AWSTranscribe
  - AWSCognitoIdentityProvider

## 2.33.1

### Misc. Updates
- **AWSComprehend**
  - Updating text used in the `testDetectSentimentNeutral` integration test.

- Model updates for the following services
  - AWSChimeSDKIdentity
  - AWSChimeSDKMessaging
  - AWSCloudWatchLogs
  - AWSConnect
  - AWSDynamoDB
  - AWSEC2
  - AWSIoT
  - AWSIoTDataPlane
  - AWSKinesisVideo
  - AWSKMS
  - AWSLambda
  - AWSLocation
  - AWSPinpoint
  - AWSPolly
  - AWSRekognition
  - AWSSQS
  - AWSSTS
  - AWSTranslate

### Bug Fixes
- **AWSAuthUI**
  - Fix ability to hide keyboard in `AWSSignInViewController`, using `keyboardDismissMode`
  - Fix black navigation bar in `AWSSignInViewController`, using view controllers option to 'Extend edges Under Opaque Bars'.
   [Issue #2321](https://github.com/aws-amplify/aws-sdk-ios/issues/2321)

## 2.33.0

### Misc. Updates

- Model updates for the following services
  - AWSConnect
  - AWSSTS

## 2.32.0

### New features
- **AWSKinesisVideoWebRTCStorage**
  - Adding new framework for Kinesis Video WebRTC Storage

### Misc. Updates

- Model updates for the following services
  - AWSSQS
  - AWSEC2
  - **Breaking Changes** to AWSChimeSDKMessaging
  - AWSConnect
  - AWSPinpoint
  - AWSLambda
  - AWSRekognition
  - AWSIoT
  - AWSKMS

## 2.31.1

### Bug Fixes
- **AWSS3**
  - Increase speed of foreground uploads by specifying `NetworkServiceType`

## 2.31.0

### Bug Fixes

- **AWSMobileClient**
  - Handling AWSMobileClient state issues gracefully handled gracefully

- **AWSIot**
  - Include the certificate tag in Keychain query to look up identity

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSComprehend
  - AWSConnect
  - AWSDynamoDB
  - AWSEC2
  - AWSIoT
  - AWSLambda
  - AWSLocation
  - AWSTranscribe
  - AWSChimeSDKIdentity
  - AWSChimeSDKMessaging
  - AWSKinesisVideoWebRTCStorage
  - AWSRekognition
  - AWSSageMakerRuntime
  - AWSTextract
  - AWSConnectParticipant
  - AWSIoTDataPlane

## 2.30.4

### Bug Fixes

- **AWSCore**
    - Add sync control to avoid crash during concurrent credential requests

## 2.30.3

### Bug Fixes

- **AWSMobileClient**
  - Fixed a thread safety issue in `AWSMobileClient.getTokens(_:)` that could result in a crash. (See [PR #4563](https://github.com/aws-amplify/aws-sdk-ios/pull/4563))

- **AWSIoT**
    - Fixed a potential point of priority inversion, resolving new Xcode 14 threat performance warning. (See [PR #4575](https://github.com/aws-amplify/aws-sdk-ios/pull/4575))

### Misc. Updates

- **AWSMobileClient**
    - Add validation for the initial state of AWSMobileClient (See [PR #4547](https://github.com/aws-amplify/aws-sdk-ios/pull/4547))

- **AWSS3**
    - Fixing the integration tests by using correct value for AWSS3ServerSideEncryption (See [PR #4592](https://github.com/aws-amplify/aws-sdk-ios/pull/4592))

- Model updates for the following services
  - AWSEC2
  - AWSKMS
  - AWSLambda
  - AWSConnect
  - AWSLocation

## 2.30.2

### Bug Fixes

- **AWSPinpoint**
  - Fixed a deadlock that happened when `AWSPinpointAnalyticsClient.submitEvents` was called from different threads at the same time. (See [PR #4558](https://github.com/aws-amplify/aws-sdk-ios/pull/4558))

### Misc. Updates
- Model updates for the following services
  - AWSSTS
  - AWSSageMakerRuntime
  - AWSIoT
  - AWSElasticLoadBalancingv2
  - AWSConnect
  - AWSAutoScaling
  - AWSSNS
  - AWSPolly
  - AWSEC2

## 2.30.1

### Misc. Updates

- **Auth**
  - Added migration of keychain to the current accessibility level set for different Auth SDK. This will enabled keychain items that are stored in different accessibility level to get fixed to the current accessibility. (See [PR #4516](https://github.com/aws-amplify/aws-sdk-ios/pull/4516))


## 2.30.0

### New features
- **AWSCore**
  - Support for `ap-southeast-4` - Asia Pacific (Melbourne) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)


### Misc. Updates
- Model updates for the following services
  -AWSCloudWatchLogs
  -AWSConnect
  -AWSConnectParticipant
  -AWSComprehend
  -AWSEC2
  -AWSLambda
  -AWSLocation

## 2.29.1

### Bug Fixes

- **AWSMobileclient**
    - Fix an issue where keychain values are in an invalid state when migrating to a new device with iCloud backup. (See [PR #4480](https://github.com/aws-amplify/aws-sdk-ios/pull/4480))

## 2.29.0

### Misc. Updates
- **AWSAPIGateway**
  - Update cache control to disable caching by default. This can be overridden by setting the `Cache-Control` request header. (See [PR #4478](https://github.com/aws-amplify/aws-sdk-ios/pull/4478))

- Model updates for the following services
  - AWSConnect
  - Breaking change to AWSConnectParticipant

## 2.28.6

### New features
- **AWSTranscribeStreaming**
  - Add support for the following addtional language codes:
    - EnAU
    - ItIT
    - DeDE
    - PtBR
    - JaJP
    - KoKR
    - ZhCN
    - HiIN
    - ThTH

### Misc. Updates
- **AWSIoT**
  - remove basic authentication support in `AWSSRWebsocket` (See [PR #4444](https://github.com/aws-amplify/aws-sdk-ios/pull/4444))

- Model updates for the following services
  - AWSIoT
  - AWSCloudWatchLogs
  - AWSTranscribe
  - AWSTextract
  - AWSIoTDataPlane
  - AWSKMS
  - AWSFirehose
  - AWSEC2
  - AWSLambda
  - AWSDynamoDB
  - AWSConnect
  - AWSSTS
  - AWSElasticLoadBalancingv2
  - AWSPolly
  - AWSComprehend
  - AWSRekognition
  - AWSSNS
  - AWSAutoScaling

## 2.28.5

-Features for next release

- **AWSCore**
  - Support for `ap-south-2` - Asia Pacific (Hyderabad) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.28.4

### New features

- **AWSCore**
  - Support for `eu-south-2` - Europe (Spain) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSAutoScaling

## 2.28.3

### New features
- **AWSCore**
  - Support for `eu-central-2` - Europe (Zurich) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSConnect
  - AWSEC2
  - AWSPolly

## 2.28.2

### Bug Fixes

- **AWSCore/AWSCredentialsProvider**
    - Fixed an issue where `getAWSCredentials` thinks it has valid credentials despite them being potentially invalidated through a concurrent call to `invalidateCachedTemporaryCredentials`. (See [PR #4379](https://github.com/aws-amplify/aws-sdk-ios/pull/4379))

### Misc. Updates

- Model updates for the following services
 - AWSIoT
 - AWSConnect
 - AWSTextract
 - AWSEC2
 - AWSCloudWatchLogs

## 2.28.1

### Bug Fixes

- **AWSAuthUI**
  - Fixed `AWSAuthUIViewController` not being able to display its contents on landscape orientation (See [PR #4338](https://github.com/aws-amplify/aws-sdk-ios/pull/4338))

- **AWSPinpoint** (See [PR #4348](https://github.com/aws-amplify/aws-sdk-ios/pull/4348) and [PR #4357](https://github.com/aws-amplify/aws-sdk-ios/pull/4357))
  - Updated events max attributes/metrics limit and attribute value limit to align with what the Pinpoint service expects.
  - Events that failed to submit due to connectivity errors are now considered to be retryable indefinitely, i.e. their retry counter won't be increased.
  - Removed warnings with `NSKeyedUnarchiver`.

### Misc. Updates

- Model updates for the following services
 - AWSDynamoDB
 - AWSComprehend
 - AWSLocation
 - AWSPolly
 - AWSEC2
 - AWSTranslate
 - AWSConnect
 - AWSChimeSDKMessaging
 - AWSSageMakerRuntime
 - AWSEC2
 - AWSConnect
 - AWSElasticLoadBalancingv2
 - AWSCognitoIdentityProvider

## 2.28.0

### Bug Fixes

- **AWSMobileClient**
  - Add getToken hashTable access inside a serial queue to avoid race condition (See [PR #4290](https://github.com/aws-amplify/aws-sdk-ios/pull/4290))

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSConnect
  - AWSSNS
  - **Breaking Change** AWSCognitoIdentityProvider
  - **Breaking Change** AWSTranscribe


## 2.27.15

### New features
- **AWSCore**
  - Support for `me-central-1` - Middle East (UAE) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

## 2.27.14

### Bug Fixes

- **AWSMobileClient**
  - Add missing parameters for SignInResult init in getNewPasswordDetails (See [PR #4200](https://github.com/aws-amplify/aws-sdk-ios/pull/4200))

- **AWSPinpoint**
  - Migrate key-value storage from NSUserdefaults to Keychain (See [PR #4223](https://github.com/aws-amplify/aws-sdk-ios/pull/4223))

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSConnect
  - AWSKMS
  - AWSAutoScaling
  - AWSPolly
  - AWSIoT
  - AWSPinpoint
  - AWSLocation
  - AWSChimeSDKMessaging
  - AWSRekognition
  - AWSLambda
  - AWSDynamoDB

## 2.27.13

### Bug Fixes

- **AWSMobileClient**
  - Fixes duplicated callbacks when getToken fails on device operations (See https://github.com/aws-amplify/aws-sdk-ios/pull/4229)

- **AWSIoT**
  - Adds support for handling certificate with certificateId (See [PR #4219](https://github.com/aws-amplify/aws-sdk-ios/pull/4219))
  - Eliminates Dispatch Semaphore in MQTT internal code [PR #4211](https://github.com/aws-amplify/aws-sdk-ios/pull/4211)

## 2.27.12

### Bug Fixes

- **AWSMobileClient**
- fix(AWSMobileClient): AWSMobileclient will refresh the token before making user attribute calls (See [PR #4215](https://github.com/aws-amplify/aws-sdk-ios/pull/4215))
- fix(AWSMobileClient): Change logic to handle weak reference of token operations (See [PR #4205](https://github.com/aws-amplify/aws-sdk-ios/pull/4205))

## 2.27.11

### Bug Fixes

- **AWSMobileClient**
  - fix(awsmobileclient): Makes fetch aws credentials serial with the rest of the calls. (See [PR #4202](https://github.com/aws-amplify/aws-sdk-ios/pull/4202))

### Misc. Updates

- Model updates for the following services
  - AWSLambda
  - AWSIoT
  - AWSEC2
  - AWSPolly
  - AWSElasticLoadBalancingv2
  - AWSTranslate
  - AWSSTS
  - AWSRekognition
  - AWSKMS
  - AWSComprehend
  - AWSCloudWatchLogs
  - AWSCognitoIdentityProvider
  - AWSTranscribe
  - AWSConnect
  - AWSChimeSDKMessaging
  - AWSDynamoDB

## 2.27.10

### Bug Fixes

- **AWSCognito**
  - Fix the parsing of providerName used in the loginMap to use the right value in case of customer endpoint is configured. (See [PR #4162](https://github.com/aws-amplify/aws-sdk-ios/pull/4162))

### Misc. Updates
- **Core**
  - Update keychain accessibility level to `kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly` as default to keep the keychain value in the device. (See [PR #4159](https://github.com/aws-amplify/aws-sdk-ios/pull/4159))

## 2.27.9

### Bug Fixes

- **AWSS3**

  - fix: adds details to userInfo for NSError for TransferUtility (See [PR #4115](https://github.com/aws-amplify/aws-sdk-ios/pull/4115))
  - fix: Reduces memory use for multipart uploads with `@autoreleasepool` to prevent excessive memory allocation (See [PR #4129](https://github.com/aws-amplify/aws-sdk-ios/pull/4129))

### Misc. Updates

- Model updates for the following services
  - AWSLocation
  - AWSEC2
  - AWSSTS
  - AWSRekognition

## 2.27.8

### Bug Fixes

- **AWSPinpoint**
  - fix: Updates Pinpoint to allow for push events for received and opened (See [PR #4105](https://github.com/aws-amplify/aws-sdk-ios/pull/4105))

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSConnect
  - AWSRekognition
  - AWSKinesisVideo
  - AWSKinesisVideoArchivedMedia
  - AWSIoT

## 2.27.7

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSLambda
  - AWSIoT
  - AWSConnect
  - AWSIoTDataPlane
  - AWSKMS
  - AWSPolly
  - AWSTextract
  - AWSAutoScaling

## 2.27.6

### Misc. Updates

- **AWSMobileClient**
  - chore: Remove unused completion handler and cleanup (See [PR #4067](https://github.com/aws-amplify/aws-sdk-ios/pull/4067))

## 2.27.5

### Misc. Updates

- **AWSMobileClient**
  - chore: Modified getToken flow for hostedUI signIn (See [PR #4049](https://github.com/aws-amplify/aws-sdk-ios/pull/4049))

- Model updates for the following services
  - AWSLocation
  - AWSPolly
  - AWSEC2
  - AWSLambda
  - AWSTranscribe

- **AWSCore**
  - Improves `AWSSynchronizedMutableDictionary` and adds unit tests (See [PR #4051](https://github.com/aws-amplify/aws-sdk-ios/pull/4051))

## 2.27.4

### Misc. Updates

- **AWSMobileClient**
  - chore: Modified getToken flow for userpool signIn (See [PR #4022](https://github.com/aws-amplify/aws-sdk-ios/pull/4022))

- Model updates for the following services
  - AWSConnect
  - AWSLambda
  - AWSLocation
  - AWSCognitoIdentityProvider

## 2.27.3

### Misc. Updates

- Model updates for the following services
  - AWSSTS
  - AWSConnect
  - AWSEC2
  - AWSComprehend
  - AWSTranscribe

## 2.27.2

### Bug Fixes

- **AWSMobileClient**
  - Clears old keychain if the configuration changes (See [PR #3853](https://github.com/aws-amplify/aws-sdk-ios/pull/3853))

### Misc. Updates

- Model updates for the following services
  - AWSSNS
  - AWSPinpoint
  - AWSComprehend
  - AWSDynamoDB
  - AWSCognitoIdentityProvider
  - AWSLambda
  - AWSTextract
  - AWSTranslate
  - AWSAutoScaling


## 2.27.1

### Misc. Updates

- **AWSCognito**
  - Removed unused values from AWSCognitoIdentityProviderASF calculation. (See [PR #3985](https://github.com/aws-amplify/aws-sdk-ios/pull/3985))

- Model updates for the following services
  - AWSTranscribe
  - AWSConnect

## 2.27.0

### Breaking Changes

- **AWSMobileClient**
  - **Breaking Change** Remove the option to not signout when deleting a user.

### Bug Fixes

- **AWSMobileClient**
  - Prevent user from cancelling signout after account deletion with hosted UI. (See [PR #3965](https://github.com/aws-amplify/aws-sdk-ios/pull/3965))
  - Fix issue that caused access token to be revoked when user canceled hosted UI signout. (See [PR #3964](https://github.com/aws-amplify/aws-sdk-ios/pull/3964))

- **AWSCognitoAuth**
  - Fixes memory leak in hostedUI. (See [PR #3969](https://github.com/aws-amplify/aws-sdk-ios/pull/3969))

- **CI/CD**
  - Fixes CocoaPods release step which reports `pod repo update` to run after AWSCore is pushed (See [PR #3961](https://github.com/aws-amplify/aws-sdk-ios/pull/3961))

- **AWSS3**
  - Fixed an issue with Multi Part uploads when uploading from a file URL that contains a space (See [PR #3956](https://github.com/aws-amplify/aws-sdk-ios/pull/3956))

### Misc. Updates

- Model updates for the following services
  - AWSLocation
  - AWSPinpoint
  - AWSTranscribe
  - AWSRekognition
  - **Breaking Change** AWSConnect

## 2.26.7

### New features

- **AWSMobileClient**
  - Add DeleteUser API to AWSMobileClient (See [PR #3948](https://github.com/aws-amplify/aws-sdk-ios/pull/3948))

### Bug Fixes

- **AWSMobileClient**
  - Reset completion sources in AWSMobileClient (See [PR #3732](https://github.com/aws-amplify/aws-sdk-ios/pull/3732))
  - Crash fix in AWSMobileClient for call to leave DispatchGroup (See [PR #3951](https://github.com/aws-amplify/aws-sdk-ios/pull/3951))

- **AWSIoT**
  - Adds leeway in unit tests (See [PR #3952](https://github.com/aws-amplify/aws-sdk-ios/pull/3952))

## 2.26.6

### Bug Fixes
- Return Swift optionals from Objective C methods that can return nil ([PR #3912)](https://github.com/aws-amplify/aws-sdk-ios/pull/3912))
- **AWSMobileClient**
  - fix(AWSMobileClient): eliminates thread blocking in operations ([PR #3872](https://github.com/aws-amplify/aws-sdk-ios/pull/3872))

### Misc. Updates
- Model updates for the following services
  - AWSRekognition
  - AWSSageMakerRuntime
  - AWSDynamoDB
  - AWSTextract
  - AWSPinpoint
  - AWSAutoScaling
  - AWSLambda
  - AWSTranslate
  - AWSSQS
  - AWSElasticLoadBalancingv2

## 2.26.5

### New features
- **AWSCore**
  - Support for `ap-southeast-3` - Asia Pacific (Jakarta) (see [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/) for a list of services supported in the region)

### Misc. Updates

- Model updates for the following services
  - AWSLocation
  - AWSDynamoDB
  - AWSTranslate
  - AWSLambda
  - AWSSNS

## 2.26.4

### Bug Fixes

- **AWSIoT**
  - fix(AWSIoT): adds back Message type ([PR #3852](https://github.com/aws-amplify/aws-sdk-ios/pull/3852))

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSTextract
  - AWSConnectParticipant
  - AWSConnect
  - AWSTranscribe
  - AWSRekognition
  - AWSTranslate

## 2.26.3

### Misc. Updates

- **AWSChime**
  - feat(AWSChimeSDKIdentity): update models to latest ([PR #3834](https://github.com/aws-amplify/aws-sdk-ios/pull/3834))
  - feat(AWSChimeSDKMessaging): update models to latest ([PR #3835](https://github.com/aws-amplify/aws-sdk-ios/pull/3835))

- **AWSConnect**
  - feat(AWSConnect): update models to latest ([PR #3831](https://github.com/aws-amplify/aws-sdk-ios/pull/3831))

- **AWSIoT**
  - feat(AWSIoT): update models to latest ([PR #3782](https://github.com/aws-amplify/aws-sdk-ios/pull/3782))

### Bug Fixes

- **AWSS3**
  - Removes tasks from completed dictionary and clears progress and completion handlers ([PR #3833](https://github.com/aws-amplify/aws-sdk-ios/pull/3833))
  - Fixes for a regression found with integration tests on main branch ([PR #3838](https://github.com/aws-amplify/aws-sdk-ios/pull/3838))

## 2.26.2

### Bug Fixes

- **AWSCore**
  - Handle special characters in AWSSignatureV4Signer (See [PR #3763](https://github.com/aws-amplify/aws-sdk-ios/pull/3763))

- **AWSS3**
  - Saving relative path of files in the DB to avoid issues arising with sandbox path changing after app restarts. [PR #3794](https://github.com/aws-amplify/aws-sdk-ios/pull/3794)
  - Makes `propagateHeaderInformation:requestHeaders:` function public [PR #3720](https://github.com/aws-amplify/aws-sdk-ios/pull/3720)
  - Makes transferUtilityConfiguration public as read-only so properties like bucket can be accessed [PR #3789](https://github.com/aws-amplify/aws-sdk-ios/pull/3789)
  - Moves suspended tasks from in progress dictionary to waiting dictionary during recovery process [PR #3818](https://github.com/aws-amplify/aws-sdk-ios/pull/3818)

- **AWSIoT**
  - Fixes crash caused by a race condition in IoT [PR #3823](https://github.com/aws-amplify/aws-sdk-ios/pull/3823)

### Misc. Updates

- Support Xcode 13.0.0 for CircleCI build ([PR #3803](https://github.com/aws-amplify/aws-sdk-ios/pull/3803))

- **AWSIoT**
  - Adds support to read settings from `awsconfiguration.json` [PR #3815](https://github.com/aws-amplify/aws-sdk-ios/pull/3815)

- Model updates for the following services
  - AWSFirehose
  - AWSElasticLoadBalancingv2
  - AWSAutoScaling
  - AWSLocation
  - AWSKMS

## 2.26.1

### Bug Fixes

- **Core**
  - Defines NS_BLOCK_ASSERTIONS and NDEBUG for Release builds  ([PR #3787](https://github.com/aws-amplify/aws-sdk-ios/pull/3787))

- **AWSS3**

  - Rewrite of method which creates partial files for multipart upload process
  - Adds test coverage for new code

### Misc. Updates

- Model updates for the following services
  - AWSChimeSDKMessaging
  - AWSCloudWatchLogs
  - AWSComprehend
  - AWSConnect
  - AWSEC2
  - AWSElasticLoadBalancingv2
  - AWSFirehose
  - AWSIoTDataPlane
  - AWSKMS
  - AWSLambda
  - AWSPinpoint
  - AWSPolly
  - AWSSageMakerRuntime
  - AWSSQS
  - AWSTranscribe

## 2.26.0

### New Features

- **AWSS3**
   - Marks enumerate blocks methods as deprecated and provides and alternative which works with Swift. (See [PR #3726](https://github.com/aws-amplify/aws-sdk-ios/pull/3726))

## 2.25.0

### New Features
- **AWSIoT**
  - AWSIoT now supports retained messages ([PR #3681](https://github.com/aws-amplify/aws-sdk-ios/pull/3681))

### Breaking Changes
  - IoT: updates nullability status for ackCallback for publishing messages

## 2.24.5

### New Features

- **AWSChimeSDK**
  - Add AWSChimeSDKMessaging and AWSChimeSDKIdentity SDK (See [PR #3711](https://github.com/aws-amplify/aws-sdk-ios/pull/3711))

### Bug Fixes

- **AWSChimeSDK**
  - Use correct Chime endpoints (See [PR #3713](https://github.com/aws-amplify/aws-sdk-ios/pull/3713))

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSRekognition
  - AWSConnect
  - AWSTranscribe
  - AWSElasticLoadBalancing
  - AWSIoT
  - AWSTextract

## 2.24.4

### Features

- **AWSMobileClient**
  - Sign out with revoke token ([PR #3638](https://github.com/aws-amplify/aws-sdk-ios/pull/3638))

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSElasticLoadBalancing
  - AWSLambda
  - AWSLocation

## 2.24.3

### Bug fixes

- **AWSTranscribing**
  - Fixed build issue due to import statements. [PR #3655](https://github.com/aws-amplify/aws-sdk-ios/pull/3655)
- **AWSMobileClient (HostedUI)**
  - Fixed an issue Base64-decoding claims containing non-ASCII characters ([PR #3533](https://github.com/aws-amplify/aws-sdk-ios/pull/3533)). Thanks, [@NivisUnder7](https://github.com/NivisUnder7)!
- **AWSLocation**
  - AWSLocation Blob deserialization ([PR #3651](https://github.com/aws-amplify/aws-sdk-ios/pull/3651))
  - fixes Blob handling by limiting change to Location ([PR #3664](https://github.com/aws-amplify/aws-sdk-ios/pull/3664))
- **AWSIoT**
  - imports for private headers were not found ([PR #3655](https://github.com/aws-amplify/aws-sdk-ios/pull/3655))

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSCognitoIdentityProvider
  - AWSConnect
  - AWSEC2
  - AWSKMS
  - AWSSTS
  - AWSSQS
  - AWSElasticLoadBalancing
  - AWSSNS
  - AWSLambda

## 2.24.2

### Bug fixes
- Fix for decoding AWSPinpointEndpointProfile when it includes attributes ([PR #3601](https://github.com/aws-amplify/aws-sdk-ios/pull/3601))

- **AWSMobileClient**
  - Fix hostedUI signIn when the refresh token is expired ([PR #3565](https://github.com/aws-amplify/aws-sdk-ios/pull/3565))
- **AWSCore**
  - Support null timestamp during deserialization. Thanks @dpwspoon for providing the fix ([PR #3587](https://github.com/aws-amplify/aws-sdk-ios/pull/3587))

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSTranscribe
  - AWSLocation
  - AWSRekognition
  - AWSAutoScaling
  - AWSCloudWatchLogs
  - AWSIoT
  - AWSSQS
  - AWSSNS
  - AWSPolly

- **AWSS3**
	- Added option to use Content-MD5 for multipart uploads with AWSS3TransferUtility (`useContentMD5` in `AWSS3TransferUtilityMultiPartUploadExpression`)

## 2.24.1

### Bug fixes
- **AWSMobileClient**
  - Fix crash in getUserAttribute api ([PR #3501](https://github.com/aws-amplify/aws-sdk-ios/pull/3501))
- **AWSPinpoint**
  - Fixed cross-module imports, which should fix support for `generate_multiple_pod_projects` in CocoaPods ([PR #3510](https://github.com/aws-amplify/aws-sdk-ios/pull/3510)). Thanks [@hcanzonetta](https://github.com/aws-amplify/aws-sdk-ios/commits?author=hcanzonetta)!

### Misc. Updates

- Model updates for the following services
  - AWSCognitoIdentityProvider
  - AWSConnect
  - AWSCore (Updated the AWSSTS model)
  - AWSEC2
  - AWSLex
  - AWSSNS

## 2.24.0

### New Features

- **AWSMobileClient**, **AWSCognitoIdentityProvider**
  - AWSCognitoIdentityProvider now accepts an `Endpoint` configuration value that can be used to override the default endpoint of `cognito-idp.<region>.amazonaws.com`. (See [PR #3482](https://github.com/aws-amplify/aws-sdk-ios/pull/3482).)

    You can use this override value to specify the domain name of, for example, a CloudFront distribution fronted by a Web Application Firewall for DDOS protection on your Cognito User Pool account. The value of `Endpoint` should be a fully-qualified host name, not a URL. Example:

    ```json
    "CognitoUserPool": {
      "Default": {
        "AppClientId": "xxx",
        "AppClientSecret": "xxx",
        "Endpoint": "d2XXXXXXXXXXXX.cloudfront.net",
        "PoolId": "xxxxx",
        "Region": "xx-xxx-1"
      }
    }
    ```

    > **WARNING** The Amplify CLI will overwrite customizations to the `awsconfiguration.json` and `amplifyconfiguration.json` files if you do an `amplify push` or `amplify pull`. You will need to manually re-apply the `Endpoint` customization if you use the CLI to modify your cloud backend.

    > **Note** This feature was originally was originally released incorrectly as a patch version update in [2.23.4](https://github.com/aws-amplify/aws-sdk-ios/releases/tag/2.23.4). It was reverted by [PR #3553](https://github.com/aws-amplify/aws-sdk-ios/pull/3553) and released in [2.23.5](https://github.com/aws-amplify/aws-sdk-ios/releases/tag/2.23.5) to allow backwards compatability. After 2.23.5 was released, it was added back with [PR #3556](https://github.com/aws-amplify/aws-sdk-ios/pull/3556) for this minor version release.

## 2.23.5

### Backwards Compatibility Fix
  - Revert: feat: Support AWSCognitoIdentityProvider custom endpoint and AWSMobileClient integ tests (See [PR #3553](https://github.com/aws-amplify/aws-sdk-ios/pull/3553).). This removes the new constructor added to `AWSServiceConfiguration` in the 2.23.4 patch update, fixing [Amplify Flutter Issue #539](https://github.com/aws-amplify/amplify-flutter/issues/539).

## 2.23.4

### New Features

- **AWSMobileClient**, **AWSCognitoIdentityProvider**
  - AWSCognitoIdentityProvider now accepts an `Endpoint` configuration value that can be used to override the default endpoint of `cognito-idp.<region>.amazonaws.com`. (See [PR #3482](https://github.com/aws-amplify/aws-sdk-ios/pull/3482).)

    You can use this override value to specify the domain name of, for example, a CloudFront distribution fronted by a Web Application Firewall for DDOS protection on your Cognito User Pool account. The value of `Endpoint` should be a fully-qualified host name, not a URL. Example:

    ```json
    "CognitoUserPool": {
      "Default": {
        "AppClientId": "xxx",
        "AppClientSecret": "xxx",
        "Endpoint": "d2XXXXXXXXXXXX.cloudfront.net",
        "PoolId": "xxxxx",
        "Region": "xx-xxx-1"
      }
    }
    ```

    > **WARNING** The Amplify CLI will overwrite customizations to the `awsconfiguration.json` and `amplifyconfiguration.json` files if you do an `amplify push` or `amplify pull`. You will need to manually re-apply the `Endpoint` customization if you use the CLI to modify your cloud backend.

### Bug fixes
- **AWSMobileClient**
  - Fix crash in getUserAttribute api  ([PR #3501](https://github.com/aws-amplify/aws-sdk-ios/pull/3501))

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSComprehend
  - AWSEC2
  - AWSPinpoint
  - AWSRekognition
  - AWSLex
  - AWSSQS
  - AWSTranscribe

## 2.23.3

### New Features

- **Swift Package Manager**
  - The AWS Mobile SDK for iOS can now be installed via Swift Package Manager. See the [README](https://github.com/aws-amplify/aws-sdk-ios/blob/main/README.md) for full details.

### Bug fixes

- **AWSLocation**
  - Created a new target named `AWSLocationXCF` to support building AWSLocation as an XCFramework. [PR #3475](https://github.com/aws-amplify/aws-sdk-ios/pull/3475)

### Misc. Updates
- Added CI/CD support for building the AWS Mobile SDK for iOS as a Swift Package Manager binary framework. ([PR #3494](https://github.com/aws-amplify/aws-sdk-ios/pull/3494))

## 2.23.2

### Bug fixes

- **AWSCognitoIdentityProvider**
  - Fix ignored `isInitialCustomChallenge` parameter in `AWSCognitoIdentityUser` ([PR #3461](https://github.com/aws-amplify/aws-sdk-ios/pull/3461)). Thanks @johntmcintosh!

### Misc. Updates

- Model updates for the following services
  - AWSEC2
  - AWSComprehend

## 2.23.1

### Bug fixes
- **AWSMobileClient**
  - Fix callback URL scheme in ASWebAuthenticationSession handling ([PR #3456](https://github.com/aws-amplify/aws-sdk-ios/pull/3456))

### Misc. Updates

- Model updates for the following services
   - AWSPinpointTargeting
   - AWSAutoScaling
   - AWSConnect
   - AWSSageMakerRuntime

## 2.23.0

### Breaking Changes

- **AWSAuthSDK**
   - Upgrade Facebook SDK to 9.0.0 ([PR #3433](https://github.com/aws-amplify/aws-sdk-ios/pull/3433)). Facebook SDK has removed automatic initialization of the SDK in v9.0.0. Follow the steps provided [here](https://developers.facebook.com/docs/ios/getting-started/#step-3--connect-the-app-delegate) to initialize the Facebook SDK during app setup.
   Support for `limited` signin configuration will be added in a later release.

### Misc. Updates

- Model updates for the following services
  - AWSElasticLoadBalancing
  - AWSPinpointTargeting
  - AWSEC2

## 2.22.3

### Bug fixes

- **Cognito**
  - fix(Cognito): Use given vc for signout via SafariViewController. Thanks @kateinoigakukun! (See [PR #3402](https://github.com/aws-amplify/aws-sdk-ios/pull/3402))

### Misc. Updates

- Model updates for the following services
  - AWSConnect
  - AWSEC2
  - AWSElasticLoadBalancing
  - AWSLambda
  - AWSLocation

## 2.22.2

### Misc. Updates

- **AWSMobileClientXCF**
  - Added convenience init method for SignInUIOptions to fix a run time error in AWSMobileClientXCF. [PR #3411](https://github.com/aws-amplify/aws-sdk-ios/pull/3411)

## 2.22.1

### Misc. Updates

Binary versions of the AWS Mobile SDK are now distributed as XCFrameworks. Please refer to the [setup instructions](https://github.com/aws-amplify/aws-sdk-ios#setup) for guidance on installing XCFrameworks from Carthage or standalone binaries.

- **AWSMobileClient**
  - Created a new target named `AWSMobileClientXCF` to support building AWSMobileClient as an XCFramework. [PR #3334](https://github.com/aws-amplify/aws-sdk-ios/pull/3334)
- **AWSLex**
  - Updated the AWSLex with the latest version of libBlueAudioSourceiOS and added arm64 iphonesimulator into Excluded Architecture. [PR #3365](https://github.com/aws-amplify/aws-sdk-ios/pull/3365)
- Model updates for the following services
  - AWSCognitoIdentity
  - AWSEC2
  - AWSIoT
  - AWSKMS
  - AWSPinpoint
  - AWSSNS

## 2.22.0

### New Features

- AWSMobileClient
  - Add support for ASWebAuthenticationSession [PR #3310](https://github.com/aws-amplify/aws-sdk-ios/pull/3310)

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling

## 2.21.1

### Misc. Updates

- **AWSIoT**
  - The `generateCSRForCertificate` method now uses SHA256 to sign Certificate Signing Requests. (See [PR #3345](https://github.com/aws-amplify/aws-sdk-ios/pull/3345))

- Model updates for the following services
  - AWSConnect
  - AWSConnectParticipant
  - AWSEC2
  - AWSIoT
  - AWSKMS
  - AWSSQS

## 2.21.0

### New Features

- **AWSAppleSignIn**
  - Add ASAuthorizationAppleIDCredential as property of AWSAppleSignInProvider. Thanks @BillBunting! (See [Issue #3143](https://github.com/aws-amplify/aws-sdk-ios/pull/3143), [PR #3291](https://github.com/aws-amplify/aws-sdk-ios/pull/3291))
- **AWSLocation**
  - Add AWSLocation SDK (See [PR #3311](https://github.com/aws-amplify/aws-sdk-ios/pull/3311))
  - Add AWSLocationTracker client (See [PR #3314](https://github.com/aws-amplify/aws-sdk-ios/pull/3314))

### Bug fixes

- **AWSS3TransferUtility**
  - fix: S3TransferUtility uniquely identify completedParts (See [Issue #3173](https://github.com/aws-amplify/aws-sdk-ios/issues/3173), [PR #3282](https://github.com/aws-amplify/aws-sdk-ios/pull/3282))

### Misc. Updates

- **AWSCore**
  - Remove deprecated iOS 8 API from UICKeyChainStore. Thanks @1mash0! ([Issue #3225](https://github.com/aws-amplify/aws-sdk-ios/issues/3225), [PR #3245](https://github.com/aws-amplify/aws-sdk-ios/pull/3245))
- Model updates for the following services
  - AWSAutoScaling
  - AWSEC2
  - AWSSageMakerRuntime
  - AWSLambda

## 2.20.0

### Breaking Changes

- **Removed deprecated clients** AWS Mobile SDK for iOS has removed these deprecated clients ([PR #3281](https://github.com/aws-amplify/aws-sdk-ios/pull/3281)):
  - `AWSCognito` (Amazon Cognito Sync) - Use [`Amplify DataStore`](https://docs.amplify.aws/lib/datastore/getting-started/q/platform/ios) for data synchronization.
  - `AWSMobileAnalytics` - Use [`Amplify Analytics`](https://docs.amplify.aws/lib/analytics/getting-started/q/platform/ios) for analytics.
  - `AWSS3TransferManager` - Use [`Amplify Storage`](https://docs.amplify.aws/lib/storage/getting-started/q/platform/ios) for uploads and downloads with Amazon S3.

- **AWSCore**
  - Removed deprecated MD5-related extensions to `NSString`: `aws_md5String` and `aws_md5StringLittleEndian`. ([PR #3283](https://github.com/aws-amplify/aws-sdk-ios/pull/3283))

### Bug fixes

- **Amazon Cognito**
  - Remove cached AWS Credentials when tokens expire (See [PR #3237](https://github.com/aws-amplify/aws-sdk-ios/pull/3237))

### Misc. Updates

- Model updates for the following services
  - AWSPolly
  - AWSIoT
  - AWSElasticLoadBalancing
  - AWSTextract
  - AWSSNS
  - AWSConnect
  - AWSEC2
  - AWSLex
  - AWSAutoScaling
  - AWSLambda
  - AWSTranslate
  - AWSDynamoDB
  - AWSCognitoIdentity
  - AWSComprehend
  - AWSCognitoIdentityProvider

## 2.19.1

### Bug fixes

- Fixed an issue where id token is not refreshed automatically for customers who set short custom expiration intervals (See [Issue #869](https://github.com/aws-amplify/amplify-ios/issues/869), [PR #3220](https://github.com/aws-amplify/aws-sdk-ios/pull/3220/))

### Misc. Updates

- Model updates for the following services
  - AWSAutoScaling
  - AWSElasticLoadBalancing
  - AWSEC2
  - AWSDynamoDB

## 2.19.0

### Breaking Changes
- **Amazon Cognito**
  - **Breaking Change** Custom auth now sets the correct `username` after a sign in flow. Before, if a user signed in with an alias (for example, an email) in a custom auth sign in flow, after a successful signIn, `AWSMobileClient.default().username` would return that entered alias. This has been fixed in this release to conform to the behavior in the standard SRP flow: instead of the returning the alias, `AWSMobileClient.default().username` will return the actual Cognito username of the user. (See [Issue #3194](https://github.com/aws-amplify/aws-sdk-ios/issues/3194), [PR #3198](https://github.com/aws-amplify/aws-sdk-ios/pull/3198))

### Misc
- AWS IoT: optimistic workaround for cleaning up nsoutputstream (See [Issue #2770](https://github.com/aws-amplify/aws-sdk-ios/issues/2770), [PR #3208](https://github.com/aws-amplify/aws-sdk-ios/pull/3208))
- Build project with Xcode 12.1
- Model updates for the following services
  - Amazon DynamoDB
  - AWS Auto Scaling
  - Amazon EC2
  - AWS IoT
  - Amazon Lambda

## 2.18.1

### New Features
- The following models now support `NSSecureCoding`
  - Amazon EC2 ([PR #3150](https://github.com/aws-amplify/aws-sdk-ios/pull/3150))
  - Amazon Elastic Load Balancing ([PR #3158](https://github.com/aws-amplify/aws-sdk-ios/pull/3158))
  - AWS IoT ([PR #3153](https://github.com/aws-amplify/aws-sdk-ios/pull/3153)). Note that the following base request and response objects that include untyped (i.e., `id`) properties do not support `NSSecureCoding`. To support `NSSecureCoding` for those types, create a subclass of the base type, and override the appropriate `initWithCoder:` methods to provide a type-safe unarchiving method:
    - `AWSIoTDataDeleteThingShadowResponse`
    - `AWSIoTDataGetThingShadowResponse`
    - `AWSIoTDataPublishRequest`
    - `AWSIoTDataUpdateThingShadowRequest`
    - `AWSIoTDataUpdateThingShadowResponse`
  - Amazon Kinesis Data Streams ([PR #3163](https://github.com/aws-amplify/aws-sdk-ios/pull/3163))
  - Amazon Kinesis Video Streams ([PR #3161](https://github.com/aws-amplify/aws-sdk-ios/pull/3161))
  - Amazon Kinesis Video Streams Archived Media ([PR #3161](https://github.com/aws-amplify/aws-sdk-ios/pull/3161))
  - Amazon Lambda ([PR #3154](https://github.com/aws-amplify/aws-sdk-ios/pull/3154)). Note that the following base request and response objects that include untyped (i.e., `id`) properties do not support `NSSecureCoding`. To support `NSSecureCoding` for those types, create a subclass of the base type, and override the appropriate `initWithCoder:` methods to provide a type-safe unarchiving method:
    - `AWSLambdaInvocationRequest`
    - `AWSLambdaInvocationResponse`
  - Amazon Machine Learning ([PR #3162](https://github.com/aws-amplify/aws-sdk-ios/pull/3162))
  - Amazon S3 ([PR #3145](https://github.com/aws-amplify/aws-sdk-ios/pull/3145)). Note that the following base request and response objects that include untyped (i.e., `id`) properties do not support `NSSecureCoding`. To support `NSSecureCoding` for those types, create a subclass of the base type, and override the appropriate `initWithCoder:` methods to provide a type-safe unarchiving method:
    - `AWSS3GetObjectOutput`
    - `AWSS3GetObjectTorrentOutput`
    - `AWSS3PutObjectRequest`
    - `AWSS3RecordsEvent`
    - `AWSS3UploadPartRequest`
  - Amazon Transcribe Streaming ([PR #3164](https://github.com/aws-amplify/aws-sdk-ios/pull/3164))
- `AWSPinpointEndpointProfileUser` now supports adding user attributes (See [Issue #3086](https://github.com/aws-amplify/aws-sdk-ios/issues/3086), [PR #3142](https://github.com/aws-amplify/aws-sdk-ios/pull/3142))

### Bug fixes
- **AWSCore**
  - Fixed link for `AWSTask` documentation (See [Issue #3171](https://github.com/aws-amplify/aws-sdk-ios/issues/3171), [PR #3177](https://github.com/aws-amplify/aws-sdk-ios/pull/3177))
- **AWSMobileClient**
  - Fix decoding claims that contain special characters ([PR #2928](https://github.com/aws-amplify/aws-sdk-ios/pull/2928)) Thanks @rolisanchez!
  - Gracefully error out if idToken is not returned from service (See [Issue #2961](https://github.com/aws-amplify/aws-sdk-ios/issues/2961), [PR #3090](https://github.com/aws-amplify/aws-sdk-ios/pull/3090))
  - Fixed cancel signout that takes the app into an inconsistent state (See [Issue #2886](https://github.com/aws-amplify/aws-sdk-ios/issues/2886), [PR #3190](https://github.com/aws-amplify/aws-sdk-ios/pull/3190))
- **AWSPinpoint**
  - End AWSPinpoint background task when app enters foreground (See [Issue #2651](https://github.com/aws-amplify/aws-sdk-ios/issues/2651), [PR #3084](https://github.com/aws-amplify/aws-sdk-ios/pull/3084))
- **AWSS3TransferUtility**
  - Register S3TransferUtility prior to async loading (See [Issue #2962](https://github.com/aws-amplify/aws-sdk-ios/issues/2962), [PR #3135](https://github.com/aws-amplify/aws-sdk-ios/pull/3135))

### Misc. Updates
- Model updates for the following services
  - Amazon EC2
  - Amazon Elastic Load Balancing (ELB)
  - AWS IoT
  - Amazon S3
  - Amazon Simple Notification Service (SNS)

- Enhanced code generated model support
  - Consider timestamp format for JSON protocol serialization ([PR #3182](https://github.com/aws-amplify/aws-sdk-ios/pull/3182))
  - Support `listType` for url parameters ([PR #3186](https://github.com/aws-amplify/aws-sdk-ios/pull/3186))
  - Use `hostPrefix` when available to prepend to endpoint ([PR #3183](https://github.com/aws-amplify/aws-sdk-ios/pull/3183))

## 2.18.0

### New Features
- The following models now support `NSSecureCoding` ([PR #3127](https://github.com/aws-amplify/aws-sdk-ios/pull/3127)):
  - AWS Auto Scaling
  - Amazon CloudWatch Logs
  - Amazon CloudWatch Monitoring
  - Amazon Cognito Identity
  - Amazon Cognito Identity Provider
  - Amazon Comprehend
  - Amazon Connect
  - Amazon Connect Participant Service
  - Amazon DynamoDB
  - Amazon Kinesis Firehose
  - Amazon Kinesis Video Signaling
  - AWS Key Management Service (KMS)
  - Amazon Lex
  - Amazon Pinpoint
  - Amazon Polly
  - Amazon Rekognition
  - Amazon SageMaker
  - Amazon Security Token Service (STS)
  - Amazon Simple DB
  - Amazon Simple Email Service (SES)
  - Amazon Simple Notification Service (SNS)
  - Amazon Simple Queue Service (SQS)
  - Amazon Textract
  - Amazon Transcribe
  - Amazon Translate

### Misc. Updates
- **AWSAuthSDK**
  - Upgrade Facebook SDK to 8.0.0 ([PR #3082](https://github.com/aws-amplify/aws-sdk-ios/pull/3082))
- Support Xcode 12.0.1 for Carthage build ([PR #3085](https://github.com/aws-amplify/aws-sdk-ios/pull/3085))
- Model updates for the following services
  - Amazon Connect
  - Amazon DynamoDB
  - Amazon EC2
  - Amazon Elastic Load Balancing
  - Amazon Pinpoint
  - Amazon Rekognition
  - Amazon Simple Notification Service (SNS)
  - Amazon Textract

### Deprecation removal warning

AWS Mobile SDK for iOS will remove these deprecated clients in December 2020:

- `AWSCognito` (Amazon Cognito Sync) - Use [`Amplify DataStore`](https://docs.amplify.aws/lib/datastore/getting-started/q/platform/ios) for data synchronization.
- `AWSMobileAnalytics` - Use [`Amplify Analytics`](https://docs.amplify.aws/lib/analytics/getting-started/q/platform/ios) for analytics.
- `AWSS3TransferManager` - Use [`Amplify Storage`](https://docs.amplify.aws/lib/storage/getting-started/q/platform/ios) for uploads and downloads with Amazon S3.

## 2.17.0

### Bug fixes

- Fixed build errors in Xcode 12. (See [Issue #2927](https://github.com/aws-amplify/aws-sdk-ios/issues/2927), [PR #3039](https://github.com/aws-amplify/aws-sdk-ios/pull/3039))

### New features

- **Amazon S3**
  - **Breaking Change** We have normalized URL construction for the AWSS3 SDK, and now support virtual host style (V2) URLs for S3.

    Previously, the SDK constructed URLs for S3 requests with different rules depending on the region (e.g., calls to endpoints in us-east-1 would be made to `s3.amazonaws.com`, while calls to endpoints in some older regions would be constructed as `s3-<region>.amazonaws.com`, while calls to endpoints in newer regions would be constructed as `s3.<region>.amazonaws.com`). With this revision of the SDK, the base URL for **all** S3 operations to supported endpoints will be constructed as: `"s3" + "." + region name + ".amazonaws.com"`. See [PR #3008](https://github.com/aws-amplify/aws-sdk-ios/pull/3008).

    In addition to this, the SDK now uses [virtual-host style addressing](https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html#virtual-hosted-style-access) for DNS-compliant bucket names. (See [issue #1535](https://github.com/aws-amplify/aws-sdk-ios/issues/1535), and [PR #2996](https://github.com/aws-amplify/aws-sdk-ios/pull/2996)).

    Thus, this revision of the SDK will make most requests to endpoint URLs of the form: `<bucket>.s3.<region>.amazonaws.com`.

    **Impact**

    This change should be transparent to most customers. If you used the Amplify CLI to provision their S3 backend, and set up your SDKs with an `awsconfiguration.json` file or `amplifyconfiguration.json` file, you won't need to take any action. If you set up the S3 client manually using an AWSEndpoint initialized with `-[AWSEndpoint initWithRegion:service:useUnsafeURL:]`, you also won't need to take any action.

    - This change may impact customers who manually set up their S3 SDK using URL-based initializers like `-[AWSEndpoint initWithRegion:service:URL:]`.
    - This change may impact customers who have custom security setups in their app (such as SSL pinning or host validation), since the constructed host names are now different
    - This change may impact customers who parse access logs in CloudTrail, since accesses will now be recorded using a different URL

    **Limitations**

    The AWS Mobile SDK for iOS automatically uses virtual host style URLs for operations made via the S3 SDK APIs, operations made via TransferUtility, and operations using transfer acceleration via TransferUtility. However, there are a few cases where the SDK will not use virtual host style URLs:
    - When the client is configured with a custom endpoint, including custom endpoints to specify `dualstack` or FIPS-compliant endpoints
    - When the specified bucket name is not DNS compliant
    - When the specified bucket name contains a dot character (`"."`)
    - When making a [`GetBucketLocation`](https://github.com/aws-amplify/aws-sdk-ios/blob/df5cb0b37d34759104512fd705a1c9e7e62a2517/AWSS3/AWSS3Service.h#L851) API call

    **Resources**
    - [Virtual host style addressing](https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html#virtual-hosted-style-access)
    - [Path-style deprecation](https://aws.amazon.com/blogs/aws/amazon-s3-path-deprecation-plan-the-rest-of-the-story/)

### Breaking Changes
- **Amazon S3**
  - **Breaking Change** We have normalized URL construction for the AWSS3 SDK, and now support virtual host style (V2) URLs for S3 (see above)
- **AWSCognitoIdentityProviderASF**
  - **Breaking Change** The AWSCognitoIdentityProviderASF SDK no longer ships the `libAWSCognitoIdentityProviderASFBinary.a` static library. The `AWSCognitoIdentityProvider` SDK consumes ASF via the framework. Projects that rely on ASF should remove references to the static library. The AWSCognitoIdentityProviderASF SDK is now versioned the same as the overall SDK.

### Misc. Updates
- **AWSPinpoint**
  - The SDK now uses [`NSSecureCoding`](https://developer.apple.com/documentation/foundation/nssecurecoding?language=objc) and version-appropriate methods of `NSKeyedUnarchiver` to encode and decode `AWSPinpointSession` and `AWSPinpointEndpointProfile`. ([PR #3031](https://github.com/aws-amplify/aws-sdk-ios/pull/3031))
  - Deprecate handler argument in intercept notification ([PR #2910](https://github.com/aws-amplify/aws-sdk-ios/pull/2910))
- **AWSAuthSDK**
  - Upgrade Facebook SDK to 6.5.2 ([PR #2990](https://github.com/aws-amplify/aws-sdk-ios/pull/2990))
- **Project**
  - Refactored unit tests into separate "AWSAllUnitTests" aggregate target for easier execution
  - Removed unused "Documentation" aggregate target. Documentation is generated in a pipeline build step and doesn't use an Xcode target.
- Model updates for the following services
  - Amazon Comprehend
  - Amazon Connect
  - Amazon EC2
  - Amazon Elastic Load Balancing
  - Amazon Security Token Service (STS)
  - Amazon Simple Queue Service (SQS)
  - Amazon Transcribe
  - Amazon Translate

## 2.16.0

### Note for Xcode 12 support
- All SDKs have been updated to support minimum iOS version 9.0, dropping support for iOS 8.0 in this release. Xcode 12 has dropped support for iOS 8 and requires setting your app's minimum supported version to 9.0 or greater to continue building on Xcode 12. ([PR #2981](https://github.com/aws-amplify/aws-sdk-ios/pull/2981))

### Bug Fixes
- **AWSiOT**
  - Backport crash fix into AWSSRWebSocket ([PR #2984](https://github.com/aws-amplify/aws-sdk-ios/pull/2984))

### Misc. Updates
- Model updates for the following services.
  - **Breaking Change** Amazon EC2 - reverted a change that was mistakenly released in the previous model update ([PR #2986](https://github.com/aws-amplify/aws-sdk-ios/pull/2986))
  - **Breaking Change** Amazon Elastic Load Balancing - updated to API version `2015-12-01` ([PR #2951](https://github.com/aws-amplify/aws-sdk-ios/pull/2951))

## 2.15.3

### Misc. Updates

- Updated version for AWSCognitoIdentityProviderASF library to reconcile discrepancy between previous published version and license

## 2.15.2

### Misc. Updates
- Model updates for the following services
  - Amazon CloudWatch Logs
  - Amazon Cognito Identity Provider
  - Amazon Comprehend
  - Amazon Lambda
  - Amazon Lex
  - Amazon Simple Notification Service (SNS)
  - Amazon Transcribe

- **AWSIoT**
  - Improved IoT reconnection handling to reduce occurrences of crashes reported in [#2770](https://github.com/aws-amplify/aws-sdk-ios/issues/2770) and [#2939](https://github.com/aws-amplify/aws-sdk-ios/issues/2939). ([PR #2949](https://github.com/aws-amplify/aws-sdk-ios/pull/2949), [PR #2957](https://github.com/aws-amplify/aws-sdk-ios/pull/2957))

- **AWSCore**
  - Deprecated two MD5-related extensions to `NSString`: `aws_md5String` and `aws_md5StringLittleEndian`. These will be removed in an upcoming version of the SDK. ([PR #2964](https://github.com/aws-amplify/aws-sdk-ios/pull/2964))

### Bug Fixes
- **AWSLex**
  - Replace PermissionBlock alias with block signature (See [PR #2868](https://github.com/aws-amplify/aws-sdk-ios/pull/2868))
- **AWSMobileClient**
  - Fixed an issue where the completion handler is not set before a status change is returned to the api. (See [PR #2948](https://github.com/aws-amplify/aws-sdk-ios/pull/2948))

## 2.15.1

### New features
- **AWSMobileClient**
  - Support ClientMetaData in verifyUserAttribute, resendSignUpCode, updateUserAttributes (See [PR #2872](https://github.com/aws-amplify/aws-sdk-ios/pull/2872))
  - Pass clientMetadata for MFA confirmSignIn (See [PR #2890](https://github.com/aws-amplify/aws-sdk-ios/pull/2890))
  - Pass clientMetadata for SignIn SRP_A, migration, customAuth auth flows (See [PR #2883](https://github.com/aws-amplify/aws-sdk-ios/pull/2883))

- **AWSIoT**
  - Add username and password to MQTT ioTMQTTConfiguration for enhanced custom authorizer (See [PR #2856](https://github.com/aws-amplify/aws-sdk-ios/pull/2856), [PR #2875](https://github.com/aws-amplify/aws-sdk-ios/pull/2875))

### Bug Fixes
- **AWSMobileClient**
  - Serialized access to keychain on setData (See [PR #2900](https://github.com/aws-amplify/aws-sdk-ios/pull/2900))

### Misc. Updates
- Binary framework distributions via Carthage and S3 are now built using Xcode 11.6
- Model updates for the following services
  - AWS AutoScaling
  - Amazon EC2
  - Amazon Kinesis Data Firehose

## 2.15.0

### New features
- **AWSAuthSDK**
  - **Breaking Change** Updated AWSGoogleSignInProvider to GoogleSignIn Version 5.0.2. This change requires any app that uses GoogleSignIn to update the framework to version 5.0.2. (See [Issue #1993](https://github.com/aws-amplify/aws-sdk-ios/issues/1993) and [PR #2851](https://github.com/aws-amplify/aws-sdk-ios/pull/2851)) Thanks, [@cornr](https://github.com/cornr)!

### Bug Fixes
- **AWSMobileClient**
  - Fixed drop-in ui button background issue [PR: #2852](https://github.com/aws-amplify/aws-sdk-ios/pull/2852)
  - Crash while accessing user attributes/password when not signed in to Cognito User Pool [PR: #2866](https://github.com/aws-amplify/aws-sdk-ios/pull/2866)

- **AWSPinpoint**
  - Removed global event source attributes on session end [PR: #2858](https://github.com/aws-amplify/aws-sdk-ios/pull/2858)

### Misc. Updates
- Deprecated AWSiOSSDKv2 aggregate pod in favor of Amplify [PR: #2855](https://github.com/aws-amplify/aws-sdk-ios/pull/2855)
- Model updates for the following services:
  - Amazon EC2
  - Amazon Connect
  - Amazon Comprehend
  - Amazon SNS

## 2.14.2

### Bug Fixes

- **AWSAuthSDK**
  - Fix import errors in AWSAppleSignIn, AWSAuth, AWSAuthCore

## 2.14.1

### New features
- **AWSMobileClient**
  - Add support for SignIn with Apple in DropInUI. See [PR: #2819](https://github.com/aws-amplify/aws-sdk-ios/pull/2819)

## 2.14.0

### Bug Fixes

- **AWSCognitoIdentityProvider**
  - **Breaking Change** Added `nullable` modifier to the return instance form the method `CognitoIdentityUserPoolForKey:`. See [PR: #2815](https://github.com/aws-amplify/aws-sdk-ios/pull/2815)

## 2.13.6

### Misc. Updates

- Changed the repo's default branch to 'main'
- Model updates for the following services:
  - Amazon Autoscaling

## 2.13.5

### Bug Fixes

- **Amazon Pinpoint**
  - Fix issue where SDK is not respecting developer set OptOut value. Persist the developer set optOut in user defaults. See [PR: #2552](https://github.com/aws-amplify/aws-sdk-ios/pull/2552)

- **AWSMobileClient**
  - If the token expired while signed in using HostedUI, AWSMobileClient will now send the event signedOutUserPoolsTokenInvalid and the request that invoked the token fetch will wait till the user signin or signout or invoke release signin wait. In the previous implementation the requested operation will complete with error and user event listener was not invoked.
    See [PR: #2739](https://github.com/aws-amplify/aws-sdk-ios/pull/2739)

### Misc. Updates
- Model updates for the following services:
  - Amazon Autoscaling
  - Amazon EC2
  - AWS IoT
  - AWS KMS
  - AWS Lambda
  - Amazon Pinpoint
  - Amazon Polly
  - Amazon Rekognition
  - Amazon SQS
  - Amazon SageMaker

## 2.13.4
### New features
- **Integration tests**
    - AWS Mobile SDK for iOS integration tests are now provisioned from a CloudFormation stack created by [the new amplify-ci-support package](https://github.com/aws-amplify/amplify-ci-support). See [the README](LINK TBD) for details on how to provision your account to run integration tests.

- **AWSMobileClient**
    - Added api to fetch userSub for the loggedin user. [PR #2599](https://github.com/aws-amplify/aws-sdk-ios/pull/2599)

### Bug Fixes
- **AWSMobileClient**
    - Crash in `releaseSignInWait` api due to over fulfilling a fetchlock. See [Issue #1278](https://github.com/aws-amplify/aws-sdk-ios/issues/1278) and [PR #2571](https://github.com/aws-amplify/aws-sdk-ios/pull/2571)
    - Fix `releaseSignInWait` for custom Auth to clear the lock correctly. [PR #2571](https://github.com/aws-amplify/aws-sdk-ios/pull/2571)

- **AWSCognitoIdentityProvider**
    - Removed cyclic retry logic in custom auth delegate. See [Issue #2504](https://github.com/aws-amplify/aws-sdk-ios/issues/2504), [PR #2571](https://github.com/aws-amplify/aws-sdk-ios/pull/2571)

### Misc. Updates
- Model updates for the following services:
  - AWS Lambda

## 2.13.3

### New features
- **AWS Core**
  - Added support for `af-south-1` - Africa (Cape Town) region
  - Added support for `eu-south-1` - Europe (Milan) region

### Bug Fixes
- **Amazon Pinpoint**
  - Fix Missing address issue related to apps which have enabled push notifications, is using the pinpoint SDK, but is not registering the token with the endpoint [PR: #2455](https://github.com/aws-amplify/aws-sdk-ios/pull/2455)

### Misc. Updates
- Model updates for the following services
  - Amazon EC2
  - Amazon Transcribe
  - AWS Lambda

## 2.13.2

### New features
- **AWSMobileClient**
  - Added IdentityProvider strings for Sign in with Apple: `IdentityProvider.apple`. See [Issue #1809](https://github.com/aws-amplify/aws-sdk-ios/issues/1809) and [PR #2425](https://github.com/aws-amplify/aws-sdk-ios/pull/2425).
- **Amazon Pinpoint**
  - Added support for adding custom demographic to pinpoint [PR: #2410](https://github.com/aws-amplify/aws-sdk-ios/pull/2410)
  - Added support for Pinpoint Journey Push Notifications [PR: #2407](https://github.com/aws-amplify/aws-sdk-ios/pull/2407)

### Bug Fixes
- **AWSMobileClient** Persist scopes defined using `HostedUIOptions` across cognito auth sessions. Should not break existing calls to these functions. If the developer wishes to change the scopes, it is recommended that the users are forced to sign in to accept the permissions for new scopes. See [PR #2397](https://github.com/aws-amplify/aws-sdk-ios/pull/2397) [Issue #2357](https://github.com/aws-amplify/aws-sdk-ios/issues/2357) for more details

### Misc. Updates
- Update CI/CD system to build with Xcode 11.4 See [issue #2365](https://github.com/aws-amplify/aws-sdk-ios/issues/2365).
- Model updates for the following services:
  - AWS Lambda
  - Amazon Pinpoint
  - Amazon Rekognition

## 2.13.1

### New features

- **AWSMobileClient** Added an optional parameter `clientMetaData` to `signUp`, `confirmSignUp`, `forgotPassword` and `confirmForgotPassword`. Should not break existing calls to these functions. See [PR #2328](https://github.com/aws-amplify/aws-sdk-ios/pull/2328) [Issue #2299](https://github.com/aws-amplify/aws-sdk-ios/issues/2299) for more details

### Misc. Updates
- Model updates for the following services
  - Amazon EC2
  - Amazon Pinpoint
  - Amazon Transcribe
  - Amazon Cognito Identity Provider
  - Amazon IoT

## 2.13.0

### Bug Fixes

- **Breaking Change** Updated nullability flags for the `AWSSignatureSignerUtility`, `AWSSignatureV4Signer`, `AWSSignatureV2Signer` and `AWSS3ChunkedEncodingInputStream` classes. Methods in these classes will have new signatures in Swift code, and may require code changes in your app to consume. See [PR #2235](https://github.com/aws-amplify/aws-sdk-ios/pull/2235) for more details.

- **Amazon S3**
  - TransferUtility now properly cancels waiting parts when canceling a multipart upload. See [Issue #2280](https://github.com/aws-amplify/aws-sdk-ios/issues/2280), [PR #2288](https://github.com/aws-amplify/aws-sdk-ios/pull/2288/). Thanks, [@colinhumber](https://github.com/colinhumber)!

### Misc. Updates

- Model updates for the following services

  - Amazon Autoscaling
  - Amazon Cognito Identity Provider
  - Amazon DynamoDB
  - Amazon EC2
  - AWS KMS
  - AWS Lambda
  - Amazon Pinpoint
  - Amazon Rekognition

## 2.12.8

This version has been deprecated. Please use the latest release.

## 2.12.7

### Bug Fixes

- **Amazon IoT**
  - Fixed a crash in AWSIoTManager when importing PKCS12 data with an incorrect passphrase. (See [#1166](https://github.com/aws-amplify/aws-sdk-ios/issues/1166))
- **AWSMobileClient, Amazon Cognito Identity Provider**
  - Fixed issue where users in a `FORCE_CHANGE_PASSWORD` flow are unable to update their password. We confirmed with the service team that we should not be sending back these parameters, and instead be sending an empty dictionary. (See [#2203](https://github.com/aws-amplify/aws-sdk-ios/issues/2203))
- **AWSAuthUI**
  - Fix crash on NewPasswordRequired flow when UIAlertView is presented on service error
- **AWSMobileClient**
  - Fixed issue where custom auth challenge task completion wasn't being reset to nil if user logged out before completing it (See [#2261](https://github.com/aws-amplify/aws-sdk-ios/issues/2261))
- Include x86_64-apple-ios-simulator.swiftmodule files for binary releases (See [#2274](https://github.com/aws-amplify/aws-sdk-ios/issues/2274))

### Misc. Updates

- **AWSEC2**
  - Fix for hardcoded AMI in EC2 integration test that had been deprecated. Updated to hardcoded AMI that was created 01/2020.
- **AWSMobileAnalytics**
  - Updated podspec with `deprecated` and `deprecated_in_favor_of` attributes
- Added workaround for `use_modular_headers!` inside of Podfile (experimental)
- Model updates for the following services:
  - Amazon EC2
  - Amazon IoT
  - AWS KMS
  - AWS Lambda

### Note for CocoaPods users

The source code of the AWSiOSSDKV2.podspec at the 2.12.7 release tag includes a [subspec for AWSTranscribeStreaming](https://github.com/aws-amplify/aws-sdk-ios/blob/2.12.7/AWSiOSSDKv2.podspec#L152-L154). However, that subspec is not in the actual 2.12.7 release of the AWSiOSSDKv2 pod, since it requires iOS 9.0 or higher. Future releases will properly reflect that AWSTranscribeStreaming is not packaged as a subspec of AWSiOSSDKv2. Note that we don’t recommend using the AWSiOSSDKv2 pod, but rather importing individual pods.

## 2.12.6

### Misc. Updates

- **Amazon Transcribe Streaming**
  - Made the event decoder classes public

- Model updates for the following services
  - Amazon CloudWatch Logs
  - Amazon Comprehend
  - Amazon EC2
  - Amazon Translate

## 2.12.5

### New Features

- **AWSMobileClient**
  - confirmSignIn method now takes in `clientMetaData` as an argument. (See [pr #2209](https://github.com/aws-amplify/aws-sdk-ios/pull/2209) for more details.)

### Bug Fixes

- **AWSMobileClient**
  - Fix an issue where the custom auth is not passing challenge parameters back to the callback. (See [issue #2148](https://github.com/aws-amplify/aws-sdk-ios/issues/2148) for more details.)

### Misc. Updates

- **AWSCore**
  - Improved error handling on network requests by propagating errors encountered deserializing the NSURLSessionDelegate's response in the returned error's `userInfo` dictionary. If present, the response object's error will be under the new key `AWSResponseObjectErrorUserInfoKey`.  (See [issue #1062](https://github.com/aws-amplify/aws-sdk-ios/issues/1062) and [PR #2052](https://github.com/aws-amplify/aws-sdk-ios/pull/2052)).  Thanks @coredumped!

- **Amazon Transcribe Streaming**
   - The Amazon Transcribe streaming SDK can now be configured with a custom web socket provider that overrides the default web socket provider, Socket Rocket.

- Model updates for the following services:
  - Amazon EC2
  - Amazon IoT
  - Amazon Pinpoint
  - Amazon Transcribe

- Updated copyright year throughout

## 2.12.4

### Deprecated release

This release is deprecated due to errors. Please use 2.12.5 or greater.

## 2.12.3

### New Features
- **Amazon Kinesis Video Signaling**
  - Amazon Kinesis Video Signaling Channels supports GetIceServerConfig and SendAlexaOfferToMaster. See [Amazon Kinesis Video Signaling Channels Documentation](https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_Operations_Amazon_Kinesis_Video_Signaling_Channels.html) for more details

### Misc. Updates

- Model updates for the following services:
  - Amazon Autoscaling
  - Amazon Cognito Identity Provider
  - Amazon Comprehend
  - Amazon DynamoDB
  - Amazon EC2
  - Amazon Kinesis Firehose
  - Amazon IoT
  - Amazon Kinesis Video Streams
  - Amazon Kinesis Video Signaling
  - AWS KMS
  - AWS Lambda
  - Amazon Lex
  - Amazon Pinpoint
  - Amazon Rekognition
  - Amazon SageMaker
  - Amazon Simple Notification Service (SNS)
  - Amazon Security Token Service (STS)
  - Amazon Transcribe

## 2.12.2

### New Features

- **Amazon Connect Participant Service**
  - Amazon Connect Participant Service Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage a customer contact center and provide reliable customer engagement at any scale. Amazon Connect enables customer contacts through voice or chat. The Amazon Connect Participant Service is used by chat participants, such as agents and customers. See [Amazon Connect Participant Service Documentation](https://aws.amazon.com/connect/) for more details.

### Misc. Updates

- Model updates for the following services

  - Amazon CloudWatch Logs
  - Amazon Cognito Identity
  - Amazon Cognito Identity Provider
  - Amazon Comprehend
  - Amazon Connect
    - Added a new api to support `CHAT` media in Connect. See [API reference](https://docs.aws.amazon.com/connect/latest/APIReference) for more details.
  - Amazon DynamoDB
  - Amazon EC2
  - Amazon IoT
  - Amazon Polly
  - Amazon Security Token Service (STS)
  - Amazon Transcribe

## 2.12.1

### New Features

- **Amazon Polly**
  - `AWSPollySynthesizeSpeechURLBuilder` now supports the ability to specify the engine (standard or neural) for a request.
    See [the Amazon Polly documentation](https://docs.aws.amazon.com/polly/latest/dg/API_SynthesizeSpeech.html#polly-SynthesizeSpeech-request-Engine)
    for a discussion of the Engine. See [Issue #1973](https://github.com/aws-amplify/aws-sdk-ios/issues/1973).

- **AWS AuthUI**
  - `AWSMobileClient` now supports the ability to hide sign up flow in the Drop-In UI. See [#1324](https://github.com/aws-amplify/aws-sdk-ios/pull/1324) for more details. Thanks @jamesingham!

### Bug Fixes
- **AWS AuthUI**
  - Present sign-in modal fullscreen to avoid undesirable gap. See issue [#1963](https://github.com/aws-amplify/aws-sdk-ios/issues/1963). Thanks @BillBunting!
- **AWS S3 TransferUtility**
  - Fix a bug where the SDK crashes during uploading data to S3. See iseeu [#1994](https://github.com/aws-amplify/aws-sdk-ios/issues/1994).
- **AWSFacebookSignIn**
  - Fixes issues[#1516](https://github.com/aws-amplify/aws-sdk-ios/issues/1516) and [#1974](https://github.com/aws-amplify/aws-sdk-ios/issues/1974) from deprecated and old FBSDK. FBSDK has been updated to 5.8
- **AWS IoT**
  - IoT now propagates errors properly if it encounters a situation where the MQTT header is malformed


### Misc. Updates

- Model updates for the following services

  - Amazon Cognito Identity Provider
  - Amazon EC2
  - Amazon Kinesis Firehose
  - Amazon Lex
  - Amazon Pinpoint

## 2.12.0

### New Features

- **AWSMobileClient**
  - DropIn UI now supports `FORCE_CHANGE_PASSWORD` UI flow. See issue [#1711](https://github.com/aws-amplify/aws-sdk-ios/issues/1711) for more details.
  - AWSMobileClient now supports Cognito Custom Authentication flow. See relevant [cognito docs](https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow.html#amazon-cognito-user-pools-custom-authentication-flow) and [amplify docs](https://aws-amplify.github.io/docs/ios/authentication#customizing-authentication-flow) for details
- **Amazon Transcribe Streaming**
  - Amazon Transcribe streaming transcription enables you to send an audio stream and receive a stream of text in real time using WebSockets.
    See [AWS Documentation](https://docs.aws.amazon.com/transcribe/latest/dg/websocket.html) for more information, and the
    [integration test](https://github.com/aws-amplify/aws-sdk-ios/blob/main/AWSTranscribeStreamingTests/AWSTranscribeStreamingSwiftTests.swift)
    for an example of usage.

### Misc. Updates

- **General SDK improvements**
  - **Breaking Build Change** The AWS SDK for iOS now requires Xcode 11 or above to build

### Bug Fixes

- **AWSCognito**
  - Fix an issue where token is not refreshed after update attribute is invoked. See [Issue #1733](https://github.com/aws-amplify/aws-sdk-ios/issues/1733) and [PR #1734](https://github.com/aws-amplify/aws-sdk-ios/pull/1734) for details. Thanks @JesusMartinAlonso!

- **AWSMobileClient**
  - Fixed an issue where the DropIn UI styles are inconsistent when dark mode is enabled on iOS 13. See [Issue #1953](https://github.com/aws-amplify/aws-sdk-ios/issues/1953) and [PR #1962](https://github.com/aws-amplify/aws-sdk-ios/pull/1962) for details.

- **Model updates for the following services**
  - Amazon EC2
  - Amazon Transcribe

## 2.11.1

### Bug Fixes

- **AWSPinpoint**
  - Fixed a bug retrieving APNS device tokens on iOS 13. See [Issue #1926](https://github.com/aws-amplify/aws-sdk-ios/pull/1926)

### Misc. Updates

- Model updates for the following services
  - Amazon EC2
    - NOTE: This model update includes a change to the mapping of certain service-emitted enum values. The symbols to which these values map
      remains the same, but customers using older versions of the AWSEC2 SDK may wish to upgrade. Enum values affected:
      - "deleted-running" is now "deleted_running"
      - "deleted-terminating" is now "deleted_terminating"
      - "pending-fulfillment" is now "pending_fulfillment"
      - "pending-termination" is now "pending_termination"
  - Amazon Simple Email Service
- Removed redundant import of `AWSNetworking.h` from model service files. See [PR #1855](https://github.com/aws-amplify/aws-sdk-ios/pull/1855). Thanks @thii!

## 2.11.0

### New Features

- **AWSCore**
  - Added the option of passing the configuration as an in-memory object (i.e. `[String: Any]`/`NSDictionary`) instead of the default `awsconfiguration.json` through the new API `AWSInfo.configureDefaultAWSInfo(config: [String: Any])`.
- **AWSMobileClient**
  - Based on the ability to pass a custom configuration through an in-memory object described above, exposed a new initializer that accepts a custom configuration: `AWSMobileClient.init(configuration: [String: Any])`.
    - Changed `AWSMobileClient.sharedInstance()` in favor of `AWSMobileClient.default()` since it better communicates the API intent. The `sharedInstance` is deprecated as of now and still available for backwards compatibility.
    - Refer to [Issue #1649](https://github.com/aws-amplify/aws-sdk-ios/issues/1649) for the feature request details.
  - When `AWSMobileClient.signOut` is called all existing credential fetch are cancelled.

### Bug Fixes

- **AWSPinpoint**
  - The limit of "Maximum number events in a request" defined by the [Pinpoint service limits](https://docs.aws.amazon.com/pinpoint/latest/developerguide/limits.html#limits-events) (100 per request) is now enforced by the client. When recording more than 100 events the client will submit multiple batches of 100 to avoid a service failure. See [Issue #1680](https://github.com/aws-amplify/aws-sdk-ios/issues/1680) and [PR #1743](github.com/aws-amplify/aws-sdk-ios/pull/1743) for details.
- **AWSMobileClient**
  - Fixed a race condition where the confirm signIn callback becoming nil. See issues [#1248](https://github.com/aws-amplify/aws-sdk-ios/issues/1248) and
    [#1686](https://github.com/aws-amplify/aws-sdk-ios/issues/1686), and [PR #1815](https://github.com/aws-amplify/aws-sdk-ios/pull/1815).
  - Fix an issue where the signIn callback and user state listener callback are out of sync. See issues [#1700](https://github.com/aws-amplify/aws-sdk-ios/issues/1700) and
    [#1314](https://github.com/aws-amplify/aws-sdk-ios/issues/1314), and [PR #1822](https://github.com/aws-amplify/aws-sdk-ios/pull/1822).
- **Amazon S3**
  - TransferUtility now properly reports progress on failed and restarted uploads. See [Issue #1512](https://github.com/aws-amplify/aws-sdk-ios/issues/1512), [PR #1813](https://github.com/aws-amplify/aws-sdk-ios/pull/1813).
  - Fix an issue where getIdentity call fails without waiting. See PR [#1824](https://github.com/aws-amplify/aws-sdk-ios/pull/1824)
  - Fix an issue with signUp API not returning the correct status back. See [#1469](https://github.com/aws-amplify/aws-sdk-ios/issues/1469) and PR [#1844](https://github.com/aws-amplify/aws-sdk-ios/pull/1844).
- **AWSCore**
  - Fixed a bug where credentials would be retrieved from the keychain instead of in-memory. See [#1554](https://github.com/aws-amplify/aws-sdk-ios/issues/1554)
    and [#1691](https://github.com/aws-amplify/aws-sdk-ios/issues/1691). Thanks @phanchutoan!
- **S3**
  - Fixed issue with uploading large files in transferutility. See [#1836](https://github.com/aws-amplify/aws-sdk-ios/pull/1836). Thanks @benmckillop!

### Misc. Updates

- Model updates for the following services
  - Amazon EC2
  - Amazon Transcribe
  - Amazon SQS
  - Amazon Lambda

- **AWSMobileClient**
  * **Breaking API change** Removed deprecated methods inside AWSMobileClient. See PR [#1738](https://github.com/aws-amplify/aws-sdk-ios/pull/1738)

## 2.10.3

### Bug Fixes

- **AWS Core**
  - `-[AWSURLSessionManager invalidate]` now invokes `-[NSURLSession finishTasksAndInvalidate]` before releasing the underlying URLSession.
    If you attempt to start a new task on the invalidated session, AWSNetworking will now throw an `AWSNetworkingErrorSessionInvalid` error.
    (See [PR #1203](https://github.com/aws-amplify/aws-sdk-ios/pull/1203) and [PR #1556](https://github.com/aws-amplify/aws-sdk-ios/pull/1556)).
    Thanks @jkennington and @jaetzold!

- **AWSCognitoAuth**
  - `delegate` property is now retained weakly

- **AWSMobileClient**
  - Fixes the crash during signout while setting error on completed task (See [Issue 1505](https://github.com/aws-amplify/aws-sdk-ios/issues/1505) and [Issue 1682](https://github.com/aws-amplify/aws-sdk-ios/issues/1682).)
  - Fixed an issue where signOut callback is not called (See [Issue 1717](https://github.com/aws-amplify/aws-sdk-ios/issues/1717).)
  - Code clean up on source and test files

### Misc. Updates
- Model updates for the following services
  - Amazon EC2
  - Amazon Lex
  - Amazon Polly
  - Amazon Rekognition
  * Amazon Simple Queue Service (SQS)
  - AWS IoT

## 2.10.2

### New Features

- **Amazon Textract**
  - Amazon Textract is a service that automatically extracts text and data from scanned documents. Amazon Textract goes beyond simple optical character
    recognition (OCR) to also identify the contents of fields in forms and information stored in tables. See
    [Amazon Textract Documentation](https://aws.amazon.com/textract/) for more details.

## 2.10.1

### New Features

- **AWS Core**
  - Added support for `me-south-1` - Middle East South (Bahrain) region.

### Bug Fixes

- **Amazon Kinesis**
  - Fixed default value of `batchRecordsByteLimit`--the documented size is 512**KB**, but the code incorrectly set it to 512**MB**.
    See [PR #1688](https://github.com/aws-amplify/aws-sdk-ios/pull/1688). Thanks @runlucky!
- **Amazon Polly**
  - Fixed error trying to use 'Zeina' voice with presigned URLs

### Misc. Updates
- Model updates for the following services
  - Amazon CloudWatch Logs
  - Amazon Comprehend
  - Amazon EC2
  - Amazon Pinpoint
  - Amazon Security Token Service (STS)
- Fix incorrect license specification in AWSCognitoIdentityProvider.podspec (See
  [Issue #1684](https://github.com/aws-amplify/aws-sdk-ios/issues/1684), [PR #1699](https://github.com/aws-amplify/aws-sdk-ios/pull/1699).)

## 2.10.0

### New Features

* **Amazon Connect**
  * Amazon Connect is a self-service, cloud-based contact center service that makes it easy for any business to deliver better customer service at lower cost. Amazon Connect is based on the same contact center technology used by Amazon customer service associates around the world to power millions of customer conversations. The self-service graphical interface in Amazon Connect makes it easy for non-technical users to design contact flows, manage agents, and track performance metrics – no specialized skills required. There are no up-front payments or long-term commitments and no infrastructure to manage with Amazon Connect; customers pay by the minute for Amazon Connect usage plus any associated telephony services. See [Amazon Connect Documentation](https://aws.amazon.com/connect/) for more details.

### Bug Fixes

- **Amazon S3**
  - Fixed a bug where errors in the presigned URL builder phase were not returned.
    See [PR #1555](https://github.com/aws-amplify/aws-sdk-ios/pull/1555) for details.
    Thanks @wfan9!

### Misc. Updates
- Fix include files to properly use the framework prefix for cross-framework includes. This fixes breakage when each framework is in a separate project
  file, as when using the new `generate_multiple_pod_projects` feature in cocoapods 1.7.
  See [PR #1540](https://github.com/aws-amplify/aws-sdk-ios/pull/1540) and [#1611](https://github.com/aws-amplify/aws-sdk-ios/pull/1611).
  Thanks @hughescr and @colinhumber!
- **AWSMobileClient**
  - Added a `message` convenience property to AWSMobileClientError. See [#1268](https://github.com/aws-amplify/aws-sdk-ios/issues/1268) and
    [PR #1270](https://github.com/aws-amplify/aws-sdk-ios/pull/1270). Thanks @medvedNick!

- Model updates for the following services
  - Amazon EC2
    - **Breaking API Change**
      - The AWSEC2 method `-[assignPrivateIpAddresses:]` now returns an `AWSTask<AWSEC2AssignPrivateIpAddressesResult *>` instead of an `AWSTask<nil>`.
      - The first argument to the completion handler for the AWSEC2 method `-[assignPrivateIpAddresses:completionHandler]` is now a nullable
      `AWSEC2AssignPrivateIpAddressesResult`, rather than a `nil`.
  - Amazon Kinesis Video Streams

## 2.9.10

### New Features

* **Amazon SageMaker**
  * Amazon SageMaker provides every developer and data scientist with the ability to build, train, and deploy machine learning models quickly. Amazon SageMaker is a fully-managed service that covers the entire machine learning workflow to label and prepare your data, choose an algorithm, train the model, tune and optimize it for deployment, make predictions, and take action. Your models get to production faster with much less effort and lower cost. See [Amazon SageMaker Documentation](https://aws.amazon.com/sagemaker/) for more details.

### Bug Fixes

- **AWSCore**
  - Fixed a bug where multiple values would be added to the 'host' header when using the V4 signer on a request that already included a 'host' header.
- **Amazon S3**
  - Fixed a bug where the multipart data/file upload crashes while upload is in progress. See [issue #1249](https://github.com/aws-amplify/aws-sdk-ios/issues/1249) for details.
- **Amazon Kinesis**
  - Fix modular imports when using CocoaPods 1.7. Thanks @igor-makarov!

### Misc. Updates

* Model updates for the following services
  * Amazon CloudWatch Logs
  * Amazon DynamoDB
  * Amazon EC2
  * Amazon Simple Email Service
  * Amazon Pinpoint

## 2.9.9

### Bug Fixes

* **AWS IoT**
  * Added a check for the upper limit of `lengthMultiplier` used for calculation of remaning length of MQTT packets. See [PR #1595](https://github.com/aws-amplify/aws-sdk-ios/pull/1595), [issue #1398](https://github.com/aws-amplify/aws-sdk-ios/issues/1398).

### Misc. Updates

* Model updates for the following services
  * Amazon Cognito Identity Provider
  * Amazon Comprehend
  * Amazon EC2
  * Amazon Security Token Service (STS)
  * Amazon Transcribe
  * AWS Lambda

## 2.9.8

### Misc. Updates

* Ensured compatibility when building with Xcode 10.2
* Model updates for the following services
  * Amazon Cognito Identity Provider
  * Amazon DynamoDB
  * Amazon EC2
  * Amazon Simple Notification Service (SNS)
  * AWS Lambda
* The Amazon Cognito Sync and Amazon Cognito Identity Provider subcomponents of the AWS Mobile SDK for iOS are now licensed under the Apache 2.0 License. See LICENSE and LICENSE.APACHE for more details.

## 2.9.7

### New Features

* **AWS Core**
  * Added support for `ap-east-1` - AP (Hong Kong) region.

### Misc. Updates

* Model updates for the following services
  * Amazon Cognito Identity Provider
  * Amazon Transcribe

## 2.9.6

### Bug Fixes

* **Amazon S3**
  * Fixed a error propagation bug for downloads using TransferUtility. See [PR #1316](https://github.com/aws-amplify/aws-sdk-ios/pull/1316), [issue #1310](https://github.com/aws-amplify/aws-sdk-ios/issues/1310).

* **Amazon Kinesis**
  * Kinesis now opens its SQLite connections in serial mode, which resolves occasional crashes on creating a new database connection. See [PR #1444](https://github.com/aws-amplify/aws-sdk-ios/pull/1444), [issue #1161](https://github.com/aws-amplify/aws-sdk-ios/issues/1161).

### Misc. Updates

* Model updates for the following services
  * Amazon Cognito Identity
  * Amazon EC2
  * Amazon Polly

## 2.9.5

### Bug Fixes

* **AWSMobileClient**
  * Fixed a bug which caused compilation error with Swift 5. See [PR #1377](https://github.com/aws-amplify/aws-sdk-ios/pull/1377), [issue #1394](https://github.com/aws-amplify/aws-sdk-ios/issues/1394).

### Misc. Updates

* Model updates for the following services
  * Amazon Comprehend

## 2.9.4

### Bug Fixes

* **AWS IoT**
  * Fixed bug in userMetaData logic
  * Fixed a `objc_retain` crash in thread initiation. See [issue #1257](https://github.com/aws-amplify/aws-sdk-ios/issues/1257), and [issue #1190](https://github.com/aws-amplify/aws-sdk-ios/issues/1190)

* **AWSMobileClient**
  * Fixed issue where error was not correctly cast to `AWSMobileClientError` when using `changePassword` API. [issue #1246](https://github.com/aws-amplify/aws-sdk-ios/issues/1246)

### Misc. Updates

* Model updates for the following services
  * Amazon Comprehend
  * AWS AutoScaling
  * Amazon Rekognition
  * Amazon EC2
  * AWS IoT
  * Amazon CloudWatch Logs
  * Amazon Kinesis Video Streams
  * Amazon Lex
  * Amazon Transcribe
  * Amazon Pinpoint
  * Amazon Cognito Identity
  * Amazon Cognito Userpools

## 2.9.3

### New Features

* **AWSMobileClient**
  * Added support for SAML in `federatedSignIn()`.
  * Added support Cognito Hosted UI in `showSignIn()`.
  * Added support to use OAuth 2.0 provider like `Auth0` in `showSignIn()`. Federation for AWS credentials requires OpenID support from the provider.
  * Added support for global sign out.
  * Added support for device features which include `list`, `get`, `updateStatus` and `forget`. These APIs are available through `getDeviceOperations()`.

### Bug Fixes

* **Amazon S3**
  * Fixed TransferUtility issue with serverside encryption using customer provided key. See [PR #1282](https://github.com/aws-amplify/aws-sdk-ios/pull/1282)

## 2.9.2

### New Features

* **AWS IoT**
  * Added ALPN (Application Layer Protocol Negotiation) support for the AWS IoT client. ALPN support enables the client to connect using TLS client authentication on port 443. This feature is only supported on iOS 11 and above. See [MQTT with TLS client authentication on port 443: Why it is useful and how it works](https://aws.amazon.com/blogs/iot/mqtt-with-tls-client-authentication-on-port-443-why-it-is-useful-and-how-it-works/) for more details.

### Bug Fixes

* **Amazon S3**
  * Fixed race condition in multipart subtask creation. [issue #1230](https://github.com/aws-amplify/aws-sdk-ios/issues/1230)
  * Fixed memory issue in multipart subtask creation. [issue #1254](https://github.com/aws-amplify/aws-sdk-ios/issues/1254)
  * Fixed bug in custom AWSS3TransferUtility instantiation that was setting the `timeoutIntervalForResource` configuration to 0. See [PR #1260](https://github.com/aws/aws-sdk-ios/pull/1260). Thanks @colinhumber

## 2.9.1

### Enhancements

* **AWSAuthSDK**
  - Added a configurable option to disable & hide the "Create new account" (SignUp) button in the Amazon Cognito User Pools UI. See [PR #1094](https://github.com/aws-amplify/aws-sdk-ios/pull/1094). Thanks @jamesingham!

### Bug Fixes

* **Amazon Pinpoint**
  - Fixed a deadlock that can occur when adding events from the main queue
    while the app is moving to the background or manually stopping a Pinpoint
    session.

* **AWSCore**
  - Fixed threading issue in `AWSCredentialsProvider`. See [PR #1192](https://github.com/aws-amplify/aws-sdk-ios/pull/1192/files). Thanks @fer662!

### Misc. Updates

* **AWS Core**
  - Added `+[AWSEndpoint regionNameFromType:]` utility method to get a string
    (e.g., "us-east-1") from an AWSRegionType

## 2.9.0

### Misc. Updates

* **Amazon S3**
  * **Breaking API Change** The return value for the `S3TransferUtilityForKey` method is set to nullable and will map to an Optional type in Swift. The `S3TransferUtilityForKey` method is typically used in conjunction with a previously registered client (using one of the `registerS3TransferUtility*` methods). The lookup will return a null value if the registration had failed due to errors instantiating the client.

* **Amazon Transcribe**
  * **Breaking API Change** The enum value `EnUK` in the `AWSTranscribeLanguageCode` enum has been replaced with `EnGB`.

* Model updates for the following services
  * Amazon Rekognition
  * Amazon DynamoDB
  * Amazon Cognito Identity Provider
  * Amazon Comprehend
  * AWS IoT
  * Amazon Kinesis Firehose
  * AWS KMS
  * AWS Lambda
  * Amazon Lex
  * Amazon Translate
  * Amazon Transcribe
  * Amazon Polly
  * Amazon Pinpoint
  * Amazon CloudWatch
  * Amazon CloudWatch Logs
  * Amazon S3

### Bug Fixes

* **AWS IoT**
  * Fixed memory leaks in MQTT Client.See [PR #1202](https://github.com/aws-amplify/aws-sdk-ios/pull/1202). Thanks @jkennington!
  * Fixed crash due to the same thread being started multiple times. See [Issue #1190](https://github.com/aws-amplify/aws-sdk-ios/issues/1190)

* **Amazon Pinpoint**
  * Pinpoint now opens its SQLite connections in serial mode, which resolves occasional crashes on entering background

## 2.8.4

### New Features

* **AWS IoT**
  * Added support for Custom Authorizers. AWS IoT allows you to define custom authorizers that allow you to manage your own authentication and authorization strategy using a custom authentication service and a Lambda function. Custom authorizers allow AWS IoT to authenticate your devices and authorize operations using bearer token authentication and authorization strategies. See [AWS IoT Custom Authentication](https://docs.aws.amazon.com/iot/latest/developerguide/iot-custom-authentication.html) for more details.

### Bug Fixes

* **Amazon Kinesis Firehose**
  * Fixed error handling in `-[AWSFirehoseRecorderHelper submitRecordsForStream:records:rowIds:putRowIds:retryRowIds:stop:]`. [See PR #1176](https://github.com/aws-amplify/aws-sdk-ios/pull/1176). Thanks @dataxpress!

## 2.8.3

### Bug Fixes

* **AWSMobileClient**
  * Fixed completion handler not being called on success for `AWSMobileClient.updateUserAttrinutes(...)`. See [issue #1162](https://github.com/aws-amplify/aws-sdk-ios/issues/1162)

## 2.8.2

### Enhancements

* **AWSMobileClient**
  * Added support for `Developer Authenticated Identities` for `federatedSignIn` API. See [issue #1131](https://github.com/aws-amplify/aws-sdk-ios/issues/1131)

* **Amazon S3**
   * NSURL Tasks for Multipart uploads are now created during the initiation of the MulitPart request. See [issue #1088](https://github.com/aws-amplify/aws-sdk-ios/issues/1088), [issue #1065](https://github.com/aws-amplify/aws-sdk-ios/issues/1065), and [issue #769](https://github.com/aws-amplify/aws-sdk-ios/issues/769)

### Bug Fixes

* **AWSMobileClient**
  * Fixed an issue where Google Sign In would not correctly reflect sign in status and completion handler callback. See [issue #1147](https://github.com/aws-amplify/aws-sdk-ios/issues/1147)

* **AWSCognitoAuth**
  * Fixed an issue where `getSession` callback is not invoked when the user hits the `Done` button. See [issue #1117](https://github.com/aws-amplify/aws-sdk-ios/issues/1117)

* **Amazon S3**
  * Fixed crash in AWSTransferUtility due to null value for subTask in inProgressPartsDictionary. See [issue #1152](https://github.com/aws-amplify/aws-sdk-ios/issues/1152)
  * Canceled all session tasks as part of `removeS3TransferUtilityForKey` method  and implemented error propagation for NSURLSession creation. See [issue #1049](https://github.com/aws-amplify/aws-sdk-ios/issues/1049)

## 2.8.1

### Bug Fixes

* Fixed an issue which caused failure in building SDK from source when using `Carthage`.

## 2.8.0

### New Features

* **AWS Core**
  * Added support for `eu-north-1` - EU (Stockholm) region.

### Bug Fixes

* **AWSMobileClient**
   * Fixed bug where `newPasswordRequired` flow for `confirmSignIn` would not work. See [issue #1141](https://github.com/aws-amplify/aws-sdk-ios/issues/1141)

### Misc. Updates

* Model updates for the following services
  * Amazon Comprehend
  * Amazon Machine Learning
  * Amazon Rekognition

* Deprecated Clients
  * `AWSMobileAnalytics` library is now deprecated. Please use [`AWSPinpoint`](https://aws-amplify.github.io/docs/ios/analytics#using-amazon-pinpoint) for analytics.
  * `AWSS3TransferManager` client is now deprecated. Please use [`AWSS3TransferUtility`](https://aws-amplify.github.io/docs/ios/storage#using-transferutility) for uploads and downloads with Amazon S3.
  * `AWSCognito` (Amazon Cognito Sync) library is now deprecated. Please use [`AWSAppSync`](https://aws-amplify.github.io/docs/ios/api#graphql-realtime-and-offline) for data synchronization.

## 2.7.4

### Enhancements

* **AWS S3**
   * Changed imports to include from module. See [PR #1133]( https://github.com/aws-amplify/aws-sdk-ios/pull/1133)
   * Changed S3 endpoint check to include `self.endpoint.serviceType` in signing logic. See [PR #1114]( https://github.com/aws-amplify/aws-sdk-ios/pull/1114)

### Misc. Updates

* **AWS IoT**
  * Update IOT client to the latest service model.

* **Amazon Pinpoint**
  * The following APIs have been changed:
      * `PutEventsRequest`
          * The type of `Endpoint` field is now changed back from `EndpointRequest` to `PublicEndpoint`.
      * `PutEventsResponse`
          * `PutEventsResponse` will have an `EventsResponse` field. The `Results` object in the `PutEventsResponse` is now nested under `EventsResponse`.

### Bug Fixes

* **AWSMobileClient**
   * Fixed bug where the specified logoImage would not appear while using `showSignIn` method. See [issue #1113](https://github.com/aws-amplify/aws-sdk-ios/issues/1113), [issue #1115](https://github.com/aws-amplify/aws-sdk-ios/issues/1115)
   * Fixed bug where errors were not mapped to `AWSMobileClientError` for `signIn` method. See [PR #1121](https://github.com/aws-amplify/aws-sdk-ios/pull/1121)
   * Don't embed Swift libraries with AWSMobileClient.framework See [issue #1123](https://github.com/aws-amplify/aws-sdk-ios/issues/1123)
   * Fixed issue where Xcode would log a warning for `AWSAuthUI.bundle` not being loaded as SDK would incorrectly try to load executable for `AWSAuthUI.bundle` which only contains resources. See [issue #1107](https://github.com/aws-amplify/aws-sdk-ios/issues/1107)
   * Added `getUserAttributes` method which fetches attributes of signed in user. See [issue #123](https://github.com/awslabs/aws-mobile-appsync-sdk-ios/issues/123)
   * Fixed an issue where the storyboard or logo file would not be loaded when consuming SDK via Cartahge. See [issue #1064](https://github.com/aws-amplify/aws-sdk-ios/issues/1064)
   * Fixed an issue where in drop-in UI if `tab` key was pressed from keyboard, the text field would not show the active input. See [issue #984](https://github.com/aws-amplify/aws-sdk-ios/issues/984)

* **Amazon Pinpoint**
  * `AppPackageName`, `AppTitle`, `AppVersionCode`, `SdkName` fields will now be accepted as part of the `Event` when submitting events from your app to Amazon Pinpoint. This fixes the issue where the event when exported by Amazon Kinesis Streams was missing these fields in the exported event.

* **Amazon S3**
   * Fixed warning due to the Validation category being defined twice. See [PR #1132]( https://github.com/aws-amplify/aws-sdk-ios/pull/1132)

* **AWSCognitoAuth**
   * Fixed a memory leak due to retain cycle caused by `NSBlockOperation` retaining the `NSOperation` object. See [issue #1134](https://github.com/aws-amplify/aws-sdk-ios/issues/1134)

## 2.7.3

### Enhancements

* **Amazon Polly**
   * Add support for new voices - `Bianca`, `Lucia` and `Mia`.

### Misc. Updates

* Model updates for the following services
  * Amazon Auto Scaling
  * Amazon Kinesis Firehose
  * Amazon Polly
  * Amazon Simple Notification Service (SNS)

## 2.7.2

### Bug Fixes

* **AWSCognitoAuth**
  * Fixed bug where the `completeGetSession:` callback would be invoked with an
    error if `safariViewController:didCompleteInitialLoad:` is invoked after a
    redirection (e.g., as can happen if an external identity provider bypasses
    the login screen for an already-authenticated user). See
    [PR #1100](https://github.com/aws-amplify/aws-sdk-ios/pull/1110)
  * Fixed bug where the callback to `getSession` would not be given in case the customer dismisses the `SFSafariViewController`. See [PR #1109](https://github.com/aws-amplify/aws-sdk-ios/pull/1109)

## 2.7.1

### New Features

* **AWS Core**
  * Added support for `us-gov-east-1` - AWS GovCloud (US East) region.

### Bug Fixes

* **Amazon Cognito Identity Provider**
  * Deprecate `claims` property of `AWSCognitoIdentityUserSessionToken` since
      it incorrectly declares the type as `NSDictionary<NSString*, NSString*>`.
      Instead, callers should use `tokenClaims`, which has the proper type of
      `NSDictionary<NSString*, id>`. See [PR #1068](https://github.com/aws-amplify/aws-sdk-ios/pull/1068)

       > Note: The existing `claims` property is deprecated and will be removed in a future minor version.

### Misc. Updates

* Model updates for the following services
  * Amazon EC2

## 2.7.0

### New Features

* **AWS Mobile Client**
  * The `AWSMobileClient` provides client APIs and building blocks for developers who want to create user authentication experiences.  It supports the following new features:
    - User state tracking: `AWSMobileClient` offers on-demand querying for the “login state” of a user in the application.
    - Credentials management: Automatic refreshing of `Cognito User Pools` `JWT Token` and `AWS Credentials` from `Cognito Identity`.
    - Offline support: `AWSMobileClient` is optimized to account for applications transitioning from offline to online connectivity, and refreshing credentials at the appropriate time so that errors do not occur when actions are taken and connectivity is not available.
    - Drop-in Auth UI: `AWSMobileClient` client supports easy “drop-in” UI for your application.
    - Simple, declarative APIs `signUp`, `signIn`, `confirmSignIn`, etc.

> Note: The existing methods of `AWSMobileClient` are deprecated and will be removed in a future minor version. `AWSMobileClient` now takes a dependency on `AWSCognitoIdentityProvider`(Cognito User Pools SDK) package to offer integration with `CognitoUserPools`. When using the new drop-in UI, `AWSAuthUI` and `Social sign-in` features continue to be pluggable dependencies for `AWSMobileClient`.

All documentation is now centralized at [https://aws-amplify.github.io/](https://aws-amplify.github.io/)

## 2.6.35

### Bug Fixes

* **AWS CognitoAuth**
    * Fixes regression in AWSCognitoAuthConfiguration constructor. See [issue#1090](https://github.com/aws-amplify/aws-sdk-ios/issues/1090)

## 2.6.34

### Enhancements

* **Amazon CognitoAuth**
   * Added capability to use `SFAuthenticationSession` for devices running iOS 11+. It can be enabled using the `enableSFAuthSessionIfAvailable` in the initializer or through `EnableSFAuthenticationSesssion` property in the  `awsconfiguration.json`.

### Bug Fixes

* **Amazon S3**
  * Fixed bug in AWSTransferUtility that was reporting incorrect status for transfers when the app was force-closed. See [issue#1058](https://github.com/aws/aws-sdk-ios/issues/1058)
  * Fixed crash in AWSTransferUtility due to a null value for MultiPartUpload ID. See [issue#1060](https://github.com/aws/aws-sdk-ios/issues/1060)

* **Amazon Pinpoint**
  * `putEvents` now correctly logs the number of accepted, retryable, and dirty
    events. See [issue#1074](https://github.com/aws/aws-sdk-ios/issues/1074)
  * Fixed data race issues in AWSPinpointSessionEventClient

* **AWS IoT**
  * Fixed crash in the drainSenderQueue routine by using a semaphore to manage access of the underlying queue. See [issue#1071](https://github.com/aws/aws-sdk-ios/issues/1071)

### Misc. Updates

* Model updates for the following services
  * Amazon EC2
  * AWS Lambda
  * Amazon S3

## 2.6.33

### Bug Fixes

* **Amazon Pinpoint**
  * Fixed 'Undefined symbols' error where `AWSPinpointVersionString` was not
    implemented when importing AWSPinpoint as a static library using CocoaPods.
    See [issue#1050](https://github.com/aws/aws-sdk-ios/issues/1050)
  * Fixed incorrectly reported SDK version in Pinpoint events
    See [issue#1051](https://github.com/aws/aws-sdk-ios/issues/1051)

* **Amazon S3**
  * Fixed bug in AWSTransferUtility.default client to use a constant value for the NSURLSessionID. See [issue#1067](https://github.com/aws/aws-sdk-ios/issues/1067)

### Misc. Updates

* Model updates for the following services
  * Amazon EC2
  * Amazon Transcribe
* In all SDKs, the `SDKVersion` and `SDKVersionString` in the umbrella header
  are now deprecated, and will be removed in an upcoming minor version of the
  SDK. Use the service-specific version string instead.

## 2.6.32

### Bug Fixes

* **Amazon Kinesis**
  * Use row id instead of partition key to delete submitted events in database. See [PR #792](https://github.com/aws/aws-sdk-ios/pull/792)
  * GZIP encoded `PutRecord` and `PutRecords` requests for Kinesis Streams; `PutRecord` and `PutRecordBatch` for Firehose.

* **Amazon S3**
  * For background transfers using `AWSS3TransferUtility`, the `backgroundURLSessionCompletionHandler` callback will be called on the main thread.

### Misc. Updates

* Model updates for the following services
  * Amazon EC2

## 2.6.31

### Bug Fixes

* **Amazon S3**
  * Fixed bug in S3 Transfer Utility that was causing progress tracking for multipart transfers to be underreported for background transfers.

### Misc. Updates

* Model updates for the following services
  * Amazon EC2

## 2.6.30

### Enhancements

* **General SDK Improvements**
  * Fix warnings in the SDK imposed by the iOS 12 platform update.

### Misc. Updates

* Model updates for the following services
  * Amazon CloudWatch
  * Amazon CloudWatch Logs
  * Amazon DynamoDB
  * Amazon EC2
  * Amazon Elastic Load Balancing
  * Amazon Polly
  * Amazon Simple Email Service

## 2.6.29

### Enhancements

* **Amazon Polly**
  * Added support for new voice `Zhiyu`.

* **Amazon CognitoAuth**
  * User completion code called after SFSafariViewController dismissed See [pull#1000](https://github.com/aws/aws-sdk-ios/pull/1000)
  * Allow developer to decide if sign in screen should be shown again if the refresh token has expired. See [pull#1007](https://github.com/aws/aws-sdk-ios/pull/1007)

### Bug Fixes

* **Amazon CognitoAuth**
  * Added check to see if refreshToken is received from the server. If not, retrieve it from the keychain. See [issue#1035](https://github.com/aws/aws-sdk-ios/issues/1035)

## 2.6.28

### Misc. Updates

* Model updates for the following services
  * Amazon Autoscaling
  * Amazon CloudWatch Logs
  * Amazon Cognito Identity Provider
  * Amazon DynamoDB
  * Amazon EC2
  * AWS KMS
  * Amazon Rekognition
  * Amazon Transcribe

### Bug Fixes

* **Amazon S3**
  * Fixed bug in MultiPart transfer utility where resuming multiple times finishes the upload before it has been completed. See [issue#1015](https://github.com/aws/aws-sdk-ios/issues/1015)

* **Amazon Core**
  * Added checks to AWSURLSessionManager to prevent crashes and instead propagate error due to transient IO issues. See [issue#1025](https://github.com/aws/aws-sdk-ios/issues/1025)

## 2.6.27

### Bug Fixes

* **Amazon Pinpoint**
  * Fixed a bug where accessing `AWSPinpointEndpointProfile` from multiple threads would potentially lead to a crash. See [issue#906](https://github.com/aws/aws-sdk-ios/issues/906)

## 2.6.26

### New Features

* **Amazon Polly**
  * Amazon Polly enables female voice Aditi to speak Hindi language

### Enhancements

* **AWS IoT**
  * Refactored MQTTClient to address namespace conflict. See [issue#961](https://github.com/aws/aws-sdk-ios/issues/961)

### Misc. Updates

* Model updates for the following services
  * Amazon Cognito Identity
  * Amazon Cognito Identity Provider
  * Amazon DynamoDB
  * Amazon EC2
  * AWS Lambda
  * Amazon Polly
  * Amazon Rekognition
  * Amazon Transcribe

### Bug Fixes

* **AWS IoT**
  * Fixed reconnection logic for the case where the connection is closed by the Server. See [issue#1002](https://github.com/aws/aws-sdk-ios/issues/1002)

* **Amazon Pinpoint**
  * Fixed bug that demographic information in endpoint profile never gets updated after initialization. Demographic information now is updated with values in the main bundle whenever currentEndpoint is called.

* **Amazon S3**
  * Fixed bug in MultiPart transfer utility progress tracking. See [issue#759](https://github.com/aws/aws-sdk-ios/issues/759)

## 2.6.25

### Enhancements

* **Amazon CognitoAuth**
  * Made `signOutLocally` and `signOutLocallyAndClearLastKnownUser` methods public. See [issue#279](https://github.com/awslabs/aws-sdk-ios-samples/issues/279)

* **Amazon Polly**
  * Added support for new `SynthesisTask` feature which allows asynchronous and batch processing.

* **Amazon S3**
  * Added completion handler for TransferUtility instantiation, improved the getTasks function and status tracking. See [issue#769](https://github.com/aws/aws-sdk-ios/issues/769) and [issue #759](https://github.com/aws/aws-sdk-ios/issues/759)

### Bug Fixes

* **AWS IoT**
  * Optimized AWS IoT reconnection logic and reduced extraneous attempts. See [issue#965](https://github.com/aws/aws-sdk-ios/issues/965)
  * Fixed bug in connectionAge timer logic. See [pr#992](https://github.com/aws/aws-sdk-ios/pull/992)
  * Fixed code references in documentation. See [pr#973](https://github.com/aws/aws-sdk-ios/pull/973)

* **Amazon S3**
  * Fixed bug in SigV4 Signing logic. See [issue#985](https://github.com/aws/aws-sdk-ios/issues/985)

## 2.6.24

### New Features

* **Amazon Kinesis Video Streams**
  * Amazon Kinesis Video Streams is a fully managed video ingestion and storage service. It enables you to securely ingest, process, and store video at any scale for applications that power robots, smart cities, industrial automation, security monitoring, machine learning (ML), and more. Kinesis Video Streams also ingests other kinds of time-encoded data like audio, RADAR, and LIDAR signals. Kinesis Video Streams provides you SDKs to install on your devices to make it easy to securely stream video to AWS. Kinesis Video Streams automatically provisions and elastically scales all the infrastructure needed to ingest video streams from millions of devices. It also durably stores, encrypts, and indexes the video streams and provides easy-to-use APIs so that applications can access and retrieve indexed video fragments based on tags and timestamps. Kinesis Video Streams provides a library to integrate ML frameworks such as Apache MxNet, TensorFlow, and OpenCV with video streams to build machine learning applications.
  * HLS streaming feature is supported through `AWSKinesisVideoArchivedMedia` and pod `AWSKinesisVideoArchivedMedia`.

## 2.6.23

### Enhancements

* **Amazon S3**
  * Added enhancements to TransferUtility to resume transfers after app restart, convenience methods for status, completion handler and status tracking. See [issue#489](https://github.com/aws/aws-sdk-ios/issues/489), [issue#755](https://github.com/aws/aws-sdk-ios/issues/755), [issue#759](https://github.com/aws/aws-sdk-ios/issues/759), and [issue#769](https://github.com/aws/aws-sdk-ios/issues/769)

### Bug Fixes

* **AWS IoT**
  * Fixed bugs in AWS IoT reconnection logic. See [issue#965](https://github.com/aws/aws-sdk-ios/issues/965), [issue#968](https://github.com/aws/aws-sdk-ios/issues/968), and [issue#972](https://github.com/aws/aws-sdk-ios/issues/972)

## 2.6.22

### Bug Fixes

* **Amazon Pinpoint**
  * Fixed bug where Pinpoint endpoint profile optOut property could not be manually set to "ALL" or "NONE" via profile update. See [issue#928](https://github.com/aws/aws-sdk-ios/issues/928)

* **Amazon S3**
  * Fixed the dictionary key for bucket name in `AWSTransferUtilityTask`. See [pull#964](https://github.com/aws/aws-sdk-ios/pull/964)

### Enhancements

* **Amazon Cognito Identity Provider**
 * Added  `claims` property to `AWSCognitoIdentityUserSessionToken` to get the users' claims from the JWT token.
 * Added `clearSession` method to `AWSCognitoIdentityUser` to clear id and access token without clearing the refresh token.  This enables you to force a session refresh without requiring the end user sign in again.
 * Clear id and access tokens when you call `updateAttributes` on a `AWSCognitoIdentityUser` so the session will automatically refresh with the new attributes on next call to `getSession`

### Misc. Updates

* Model updates for the following services
  * Amazon Auto Scaling
  * Amazon CloudWatch
  * Amazon CloudWatch Logs
  * Amazon DynamoDB
  * Amazon Elastic Compute Cloud (EC2)
  * Amazon Elastic Load Balancing (ELB)
  * Amazon Kinesis Firehose
  * Amazon Kinesis Streams
  * Amazon Polly
  * Amazon Rekognition
  * Amazon Security Token Service (STS)
  * Amazon Simple DB
  * Amazon Simple Email Service (SES)
  * Amazon Simple Notification Service (SNS)
  * Amazon Simple Queue Service (SQS)
  * Amazon Transcribe
  * AWS IoT
  * AWS Key Management Service (KMS)
  * AWS Lambda

## 2.6.21

### Bug Fixes

* **AWS IoT**
  * Fixed crash in AWS IoT due to use of API that was not backward compatible with iOS 8.0. See [issue#949](https://github.com/aws/aws-sdk-ios/issues/949)

### Enhancements

* **Amazon Polly**
  * Added support for new voice - `Lea`

## 2.6.20

### New Features

* **Amazon S3**
  * Enabled AWSS3TransferUtilityTimeoutIntervalForResource to be customizable using AWSS3TransferUtilityConfiguration. See [issue#910](https://github.com/aws/aws-sdk-ios/issues/910)

### Bug Fixes

* **Amazon S3**
  * Fixed bug in TransferUtility error handling logic. See [issue#932](https://github.com/aws/aws-sdk-ios/issues/932)
  * Fixed heap overflow crash related to non-null terminated string handling in TransferUtility. See [issue#941](https://github.com/aws/aws-sdk-ios/issues/941)

* **Amazon Pinpoint**
  * Fixed bug where Pinpoint endpoint profile update would improperly set optOut status to ALL when opted into notifications with non-visible notification type. See [issue#927](https://github.com/aws/aws-sdk-ios/issues/927)

### Misc. Updates

* **Amazon EC2**
  * Update Amazon EC2 client to the latest service model.

## 2.6.19

### New Features

* **Amazon Translate**
  * Amazon Translate is a neural machine translation service that delivers fast, high-quality, and affordable language translation.

* **Amazon Comprehend**
  * Amazon Comprehend is a natural language processing (NLP) service that uses machine learning to find insights and relationships in text

### Bug Fixes

* **AWS IoT**
  * Fixed crashes in AWS IoT during disconnect. See [issue#904](https://github.com/aws/aws-sdk-ios/issues/904) and [issue#752](https://github.com/aws/aws-sdk-ios/issues/752)
  * Fixed connection retry logic. See [issue#856](https://github.com/aws/aws-sdk-ios/issues/856) and [issue#901](https://github.com/aws/aws-sdk-ios/issues/901)

### Misc. Updates

* **Amazon CloudWatch Logs**
  * Update Amazon CloudWatch Logs client to the latest service model.

* **Amazon Cognito Identity**
  * Update Amazon Cognito Identity client to the latest service model.

## 2.6.18

### New Features

* **Amazon Transcribe**
  * Amazon Transcribe is an automatic speech recognition (ASR) service that makes it easy for developers to add speech to text capability to their applications.

* **AWS IoT**
  * Add new methods for `publish`, `subscribe` and `unsubscribe` which allow `ack` messages callback using `ackCallback` parameter. See [example.](https://github.com/aws/aws-sdk-ios/blob/main/AWSIoTTests/AWSIoTDataManagerTests.swift#L304)

### Bug Fixes

* **AWS Core**
  * Fixed crash in AWS Core during retry of service requests. See [issue#913](https://github.com/aws/aws-sdk-ios/issues/913)
  * Exit gracefully by returning nil instead of crashing if `awsconfiguration.json` is not present or empty or has invalid data.

* **Amazon S3**
  * Fixed multipart upload crash due to memory consumption while transferring very large files. [issue#914](https://github.com/aws/aws-sdk-ios/issues/914)

### Enhancements

* **General SDK improvements**
  * Declare framework dependencies in podspecs. See [PR #827](https://github.com/aws/aws-sdk-ios/pull/827)
  * Fix incorrect clang pragmas. See [PR #915](https://github.com/aws/aws-sdk-ios/pull/915)

* **Amazon S3**
  * Propogate S3 service errors through "Error" field in `userInfo` dictionary of error. See [PR #666](https://github.com/aws/aws-sdk-ios/pull/666)

## 2.6.17

### Bug Fixes

* **Amazon S3**
  * Fixed bugs registering customer configuration in S3 TransferUtility for Multipart uploads. See [issue#900](https://github.com/aws/aws-sdk-ios/issues/900)
  * Fixed crash due to incorrect instantiation of Upload and Download tasks during a lookup operation in S3 TransferUtility. See [issue#907](https://github.com/aws/aws-sdk-ios/issues/907)

* **AWS Core**
  * Fixed Macro redefinition conflict of the THIS_FILE macro if CocoaLumberJack used with the AWS SDK. See [issue#895](https://github.com/aws/aws-sdk-ios/issues/895)

* **AWS AuthUI**
  * Fixed an issue where input fields would not be visible when keyboard appears. See [issue #877](https://github.com/aws/aws-sdk-ios/issues/877), [issue #878](https://github.com/aws/aws-sdk-ios/issues/878), [issue #897](https://github.com/aws/aws-sdk-ios/issues/897)

### Enhancements

* **General SDK improvements**
  * Versioning IDEWorkspaceChecks.plist for Xcode 9.3. See [pr#881](https://github.com/aws/aws-sdk-ios/pull/881)
  * Fix nullability warnings. See [pr#882](https://github.com/aws/aws-sdk-ios/pull/882)
  * Preventing corruption from failed malloc. See [pr#883](https://github.com/aws/aws-sdk-ios/pull/883)
  * Format consistency. See [pr#884](https://github.com/aws/aws-sdk-ios/pull/884)
  * Fix availability warnings by declaring sharedInstance inside the implementation. See [pr#885](https://github.com/aws/aws-sdk-ios/pull/885)
  * Fix analyzer warning "Converting a pointer value of type NSNumber * to a primitive boolean value". See [pr#887](https://github.com/aws/aws-sdk-ios/pull/887)
  * Fix analyzer memory leak. See [pr#888](https://github.com/aws/aws-sdk-ios/pull/888)
  * Fix "Method accepting NSError** should have a non-void return value to indicate whether or not an error occurred ". See [pr#889](https://github.com/aws/aws-sdk-ios/pull/889)
  * Fix "method is expected to return a non-null value". See [pr#890](https://github.com/aws/aws-sdk-ios/pull/890)
  * Fix "finalize isn't supported in ARCs". See [pr#892](https://github.com/aws/aws-sdk-ios/pull/892)

## 2.6.16

### Bug Fixes

* **Amazon Pinpoint**
  * Fixed an issue that prevented EndpointProfile from receiving updates of Device Token. See [issue#886](https://github.com/aws/aws-sdk-ios/issues/886)

## 2.6.15

### Enhancements

* **AWS Core**
  * Removed the deprecated methods `synchronize` and `synchronizeWithError` from `AWSUICKeyChainStore` to reduce warnings. See [issue#863](https://github.com/aws/aws-sdk-ios/issues/863)
  * Fix recommended Xcode 9.3 warnings. See [pr #868](https://github.com/aws/aws-sdk-ios/pull/868)

* **Amazon S3**
  * Updated AWSS3 low level clients to conform latest S3 service model.
  * Fix import for static library build to succeed. See [pr #866](https://github.com/aws/aws-sdk-ios/pull/866)

### Bug Fixes

* **Amazon S3**
  * Fixed header propagation bugs in S3 TransferUtility for Multipart uploads. See [issue#869](https://github.com/aws/aws-sdk-ios/issues/869)

* **Amazon Pinpoint**
  * Fixed an issue that caused 400 errors when submitting events with a boolean metric.

## 2.6.14

### Bug Fixes

* **AWS AuthUI**
  * Fixed a bug which would hide the input fields when keyboard shows. The view now moves towards the top when keyboard appears. See [issue#835](https://github.com/aws/aws-sdk-ios/issues/835)

* **Amazon S3**
  * Fixed bug to handle custom metadata in multipart uploads. See [issue#858](https://github.com/aws/aws-sdk-ios/issues/858)

* **Amazon Pinpoint**
  * Prevent Crash in endCurrentSessionTimeoutWithTimer [issue#826](https://github.com/aws/aws-sdk-ios/issues/826)
  * Fixed an issue in which updating the userId in the AWSPinpointEndpointProfileUser is not reflected when retrieving the currentEndpointProfile from the AWSPinpointTargetingClient.

## 2.6.13

### New Features

* **Amazon S3**
  * Added support for MultiPart uploads in Transfer Utility
  * Included error retry logic for Transfer Utility

## 2.6.12

### New Features

* **Amazon Cognito Identity Provider**
  * Support for user migration over lambda trigger in Cognito User Pools.

## 2.6.11

### New Features

* **AWS IoT**
  * Starting from this release, AWS IoT SDK by default sends metrics indicating which language and version of the SDK is being used. However, user may disable this by calling `enableMetricsCollection(false)` before calling `connect` method, if they do not want metrics to be sent.

### Bug Fixes

* **AWS S3**
  * Assert instead of raising exception when reponse is not of type `NSHTTPURLResponse` in `AWSS3TransferUtility`. See [pr #799](https://github.com/aws/aws-sdk-ios/pull/799).

### Misc. Updates

* **General**
  * Update README for formatting, code indentation and highlighting. [PR #790](https://github.com/aws/aws-sdk-ios/pull/790)
  * Update README to point to the new documentation. [PR #804](https://github.com/aws/aws-sdk-ios/pull/804)

## 2.6.10

### New Features

* **AWS Core**
  * Added support for `eu-west-3`(EU - Paris) region.

## 2.6.9

### New Features

* **AWS Core**
  * Added support for `cn-northwest-1`(China - Ningxia) region.

### Misc. Updates

* **Amazon Pinpoint**
  * Improved the comment in `generateSessionIdWithContext` method in `AWSPinpointSessionClient`. [PR #777](https://github.com/aws/aws-sdk-ios/pull/777)

## 2.6.8

### New Features

* **Amazon Rekognition**
  * **Breaking API Change** The `AWSRekognitionLandmarkType` enum entries have changed lowercase `b` to capital `B`. For instance `AWSRekognitionLandmarkTypeLeftEyeBrowLeft`.
  * Update the enum value of LandmarkType and GenderType to be consistent with service response. [Github Issue #650](https://github.com/aws/aws-sdk-ios/issues/650)
  * Update to add face and text detection. [Github Issue #771](https://github.com/aws/aws-sdk-ios/issues/771)
  * Update to Amazon Rekognition in general to latest API specifications.

### Bug fixes

* **Amazon Cognito Identity Provider**
  * Fix broken Cocoapods due to duplicate library being found. [Github Issue #770](https://github.com/aws/aws-sdk-ios/issues/770)

* **Amazon Cognito Auth**
  * Fix broken Cocoapods due to duplicate library being found. [Github Issue #770](https://github.com/aws/aws-sdk-ios/issues/770)

## 2.6.7

### New Features

* **Amazon Cognito Auth**
  * Add support for the adaptive authentication feature of Amazon Cognito advanced security features (Beta).

* **Amazon Cognito Identity Provider**
  * Add support for Time-based One-time Passcode multi-factor authentication.
  * Add support for the adaptive authentication feature of Amazon Cognito advanced security features (Beta).

## 2.6.6

### Enhancements

* **Amazon Polly**
    * Added support for new voices - `Aditi` and `Seoyeon`.
    * Added support for new language code - `ko-KR`.

### New Features

* **AWS MobileClient**
    * Added `AWSMobileClient` to initialize the SDK and create instances of other SDK clients. Currently support is limited to `AWS Auth SDK`. AWSMobileClient creates the `AWSConfiguration` based on `awsconfiguration.json`, fetches the Cognito Identity and registers the SignIn providers with the permissions based on the `AWSConfiguration`.

### Bug fixes

* **Amazon Pinpoint**
    * Fixed a bug which didn't allow APNs Sandbox endpoints to be registered.

* **AWS IoT**
    * Change default keep alive timer to 300 seconds.

## 2.6.5

### Bug fixes

* **All Services**
    * Fix Xcode 9 strict prototype warnings. [Github PR #747](https://github.com/aws/aws-sdk-ios/pull/747)

* **Amazon Kinesis**
    *  Ensure `submitAllRecords` returns an error on failure to submit.  [Github PR #698](https://github.com/aws/aws-sdk-ios/pull/698)

* **Amazon Pinpoint**
    * Made submission of events thread safe.

## 2.6.4

### Enhancements

* **Amazon Polly**
    * Added support for new voices - `Matthew` and `Takumi`.
    * Polly is now available in `ap-northeast-1` region.

## 2.6.3

### Bug fixes

* **Amazon Pinpoint**
    * Removed unused variable causing intermittent crashes.
    * Fix deadlock bug in submission of events.

* **Amazon Mobile Analytics**
    * Fixed bug where an empty string causes app to crash when writing it to file.

## 2.6.2

### New features

* **Amazon Pinpoint**
    * Added a debug configuration to be used for push notifications with a Sandbox certificate.

* **Amazon Cognito Identity Provider**
    * Add support for Pinpoint Analytics integration in Cognito User Pools.

### Enhancements

* **Amazon Kinesis**
    * Add overloaded method `saveRecord:streamName:partitionKey` to allow control of `partitionKey`. [Github PR #696](https://github.com/aws/aws-sdk-ios/pull/696)

* **Amazon Cognito Identity Provider**
    * Return user sub in signup.  [Github Issue: #732](https://github.com/aws/aws-sdk-ios/issues/732)

### Bug fixes

* **Amazon Pinpoint**
    * Fixed bug causing events to be sent without sessionId.
    * Fixed issue where calling UIApplication API from background thread displays a warning. Github Issues: [#734](https://github.com/aws/aws-sdk-ios/issues/734)
    * Added possible fix for issue where ending session got an EXC_BAD_ACCESS. Github Issues: [#630](https://github.com/aws/aws-sdk-ios/issues/630)

* **Amazon Cognito Identity Provider**
    * Fix crash when username is only set in authParameters and appClientSecret is used.  [Github Issue: #724](https://github.com/aws/aws-sdk-ios/issues/724)

* **Amazon S3**
    * Remove `Transfer-Encoding` from streaming signature.  [Github  PR #638](https://github.com/aws/aws-sdk-ios/pull/638)

## 2.6.1

### New features

* **AWS Auth SDK**
  * Add new Auth SDK which provides login integration with Cognito User Pools, Facebook and Google.

* **Core**
  * Add support for client configuration through `awsconfiguration.json`.

## 2.6.0

### New feature

* **AWS IoT**
  * Add API to enable/disable auto-resubscribe topics. Clients can now control whether they want SDK to automatically resubscribe to previously subscribed topics after abnormal network disconnection.
  * Add API to get current connection status to AWS IoT. Clients can now get the current connection status of the SDK.
  * Add update/documents topic supoort for shadow operation. Clients now may let SDK subscribe to update/documents topic for shadow operations, so that they can get messages published on update/documents topic by AWS IoT.

### Enhancements

* **Amazon S3**
  * Introduce new `bucket` property in `AWSS3TransferUtilityConfiguration` which can be used to set a default bucket. The `bucket` property will be used when the upload / download methods are called without using `bucket` parameter.
  * Allow setting custom endpoint for `S3PresignedURLBuilder` client. [Github Issue: #709](https://github.com/aws/aws-sdk-ios/issues/709)

* **AWS IoT**
  * **Breaking API change** Clients may need to customize all parameters in AWSIoTMqttConfiguration object when initializing it before connecting to AWS IoT.

### Bug fixes

* **Core**
  * Fixed issue where compilation would fail with Xcode 9. Github Issues: [#704](https://github.com/aws/aws-sdk-ios/issues/704), [#705](https://github.com/aws/aws-sdk-ios/issues/705), [#719](https://github.com/aws/aws-sdk-ios/issues/719), [#721](https://github.com/aws/aws-sdk-ios/issues/721)

* **Amazon API Gateway**
  * Fixed bug where `rawResponse` field is always `nil` and inaccessible. [Github Issue: #631](https://github.com/aws/aws-sdk-ios/issues/631)

* **Amazon Lex**
  * Fixed [issue](https://forums.aws.amazon.com/thread.jspa?threadID=260137&tstart=0) where session attributes passed in to the `AWSLexInteractionKit` methods `textInTextOut` and `textInAudioOut` would be ignored in certain cases
  * Fixed similar issue in `AWSLexInteractionKit` `startStreaming` method where attributes set in `sessionAttributesForSpeechInput` would be ignored in certain cases

## 2.5.10

### Enhancements

* **Amazon Pinpoint**
  * Introduce 'didReceiveRemoteNotification:fetchCompletionHandler:shouldHandleNotificationDeepLink:' to 'AWSPinpointNotificationManager'. Introduces new parameter 'handleDeepLink', to optionally specify whether or not notification manager should attempt to open the remote notification deeplink, if present.

* **Amazon Cognito Auth**
  * Amazon Cognito Auth is now Generally Available.

### Bug fixes

* **Amazon Cognito Auth**
  * Fix bug causing error messages not to be surfaced
  * Fix bug causing refresh tokens not to work in all scenarios

* **AWS IoT**
  * Fixed bug to improve stability of encoding and decoding MQTT packet thread.
  * Add mutex to synchronize the buffer used for encoding messages.

## 2.5.9

### Bug fixes

* **Amazon Lex**
  * Fixed bug where an application consuming `Lex` cannot be signed and distributed [Github Issue #704](https://github.com/aws/aws-sdk-ios/issues/704)

* **Amazon Pinpoint**
  * Fixed bug where saving a session cause a crash. [Github Issue #580] (https://github.com/aws/aws-sdk-ios/issues/580)
  * Removed all calls that blocked the main thread [Github Issue #614] (https://github.com/aws/aws-sdk-ios/issues/614)

* **AWS IoT**
  * Moved encoding and decoding MQTT packet into background thread
  * Moved websocket delegate methods (webSocketDidOpen:, webSocket:didFailWithError:, webSocket:didReceiveMessage:, webSocket:didCloseWithCode: ) into background thread
  * Fixed bug where app receives duplicate "Disconnected" callback when previously connected to AWS IoT via websocket
  * Fixed bug where reconnect timer incorrectly triggered after user disconnects

## 2.5.8

### New Features
* **Amazon Cognito Auth (Beta)**
  * A new SDK that enables sign-up and sign-in for Amazon Cognito Your User Pools via a lightweight hosted ui.

### Enhancements

* **Amazon Pinpoint**
  * Introduce `isApplicationLevelOptOut` block to `AWSPinpointConfiguration`. Use this to configure whether or not client should receive push notifications, at an application level.

### Bug fixes

* **Amazon SNS**
    * Fixed error parsing for service responses. **Note:** This change also fixes error response parsing for `AutoScaling`, `CloudWatch`, `ELB`, `SES`, `SimpleDB`, `SQS` and `STS`. [Github Issue #676](https://github.com/aws/aws-sdk-ios/issues/676) and [Github Issue #671](https://github.com/aws/aws-sdk-ios/issues/671)

* **Amazon Cognito Identity Provider**
  * Fixed crash with AWSCognitoIdentityUserPool.calculateSecretHash when username contained non ASCII characters. [Github Issue #679](https://github.com/aws/aws-sdk-ios/issues/679)

### Misc changes

* **AWS IoT**
  * Deprecating default endpoint for AWSIoTDataService. Client should use custom endpoint when initializing AWSServiceConfiguration to be used for AWSIoTDataManager.

## 2.5.7

### Enhancements

* **Amazon Polly**
  * Added support for new voice id - `Vicki`.

### Bug fixes

* **SDK Core**
    * Fixed `LOG Macros` error. [Github Issue #664](https://github.com/aws/aws-sdk-ios/issues/664)
    * Allow for future expired/unauthed token calls to properly refresh the aws token. [Github Issue #563](https://github.com/aws/aws-sdk-ios/pull/563/)
* **AWS Lambda**
    * Fixed clock skew retry handling bug. [Github Issue #673](https://github.com/aws/aws-sdk-ios/issues/673)


## 2.5.6

### Enhancements

* **AWS IoT**
  * Updated AWS IoT to the latest API specifications.

### Bug fixes
* **Amazon S3**
  * Fixed bug where file paths with spaces were not correctly handled and caused upload failures. [Github Issue #634](https://github.com/aws/aws-sdk-ios/issues/634)
* **AWS IoT**
    * Fixed bug where timer was not started on currentRunLoop.
* **SDK Core**
    * Remove definition of `LOG_LEVEL_DEF` for compatibility. [Github Issue #655](https://github.com/aws/aws-sdk-ios/issues/655)

## 2.5.5

### Bug fixes
* **SDK Core**
  * **Breaking API change** `doesAppRunInBackground` method is renamed to `awsDoesAppRunInBackground`. [GitHub Issue #643](https://github.com/aws/aws-sdk-ios/issues/643)

* **AWS IoT**
  * Fixed bug which caused crash when shadow timer timeout is called after shadow is unregistered. [Github Issue #640](https://github.com/aws/aws-sdk-ios/issues/640)

## 2.5.4

### New Features
* **SDK Core**
  * `AWSLogger` is now deprecated. Suggested to use `AWSDDLog` for logging; SDK now uses `CocoaLumberjack` for logging.

### Enhancements
* **Amazon Lex**
  * Amazon Lex is now Generally Available.
  * Added support for input transcripts.

* **Amazon Polly**
  * Added support for requesting use of multiple Lexicons through `AWSPollySynthesizeSpeechURLBuilder`.
  * Added support for speech marks.

* **Amazon Rekognition**
  * Added support for moderation labels and age range estimation.

## 2.5.3
### New Features
* **Amazon Cloud Watch Logs**
  * Amazon CloudWatch is a monitoring service for AWS cloud resources and the applications you run on AWS. You can use Amazon CloudWatch to collect and track metrics, collect and monitor log files, and set alarms.

### Resolved Issues
* **SDK Core**
  * Added support for BasicSessionCredentials Provider [GitHub Issue #561](https://github.com/aws/aws-sdk-ios/issues/561)
* **Amazon APIGateway**
  * Support for Swift 3 in API Gateway code generation.
  * Fixed Invalid bitcast AWSServiceConfiguration. [GitHub Issue #585](https://github.com/aws/aws-sdk-ios/issues/585)
* **Amazon S3**
  * Fixed issues which might cause compilation erros when using the SDK with C++ runtimes. [GitHub issue #613](https://github.com/aws/aws-sdk-ios/issues/613)
  * Fixed crash when uploading file that does not exist through `AWSTransferUtility `. [GitHub issue #618](https://github.com/aws/aws-sdk-ios/issues/618)
* **Amazon Cognito Identity Provider**
  * Fixed a bug in which the User Confirmation status was not getting set correctly in the sdk.
### Enhancements
* **Amazon Lex - beta**
  * Use different images for `LexVoiceButton` to distinguish between when playing audio response vs when listening to audio.


## 2.5.2
### New Features
* **AWS KMS**
    *  AWS Key Management Service (KMS) is a managed service that makes it easy for you to create and control the encryption keys used to encrypt your data, and uses Hardware Security Modules (HSMs) to protect the security of your keys. AWS Key Management Service is integrated with several other AWS services to help you protect the data you store with these services. AWS Key Management Service is also integrated with AWS CloudTrail to provide you with logs of all key usage to help meet your regulatory and compliance needs.

### Breaking API Changes
* **Amazon Cognito Identity Provider**
  * Changed `AWSCognitoIdentityProviderSchemaAttributeType` property from `mutable` to `varying` for compatibility when used with C++. [Github Issue #597](https://github.com/aws/aws-sdk-ios/issues/597)

### Resolved Issues
* **SDK Core**
  * Fixed invalid chunk data signature. [Github Issue #592](https://github.com/aws/aws-sdk-ios/issues/592)
  * Added us-east-2, eu-west-2, and ca-central-1 regions to `aws_regionTypeValue`.
*  **Amazon Cognito Identity Provider**
  *  Fixed bug which caused `deleteAttributes` to not delete the attributes specified by caller. The method no longer causes user logout.
  *  Improved reliability of `registerDevice:deviceToken` with reduced `NotAuthorizedException` occurances.
*  **Amazon Cognito Sync**
  *  Fixed bug which caused possible deadlock during `synchronize` call.
*  **Amazon Lex - beta**
  *  Added support to switch between audio outputs during conversation.
  *  Removed unnecessary header search path in AWSLex.podspec.
* **AWS IoT**
  * Fixed bug which caused shadow timer to not expire shadow operation. [Github Pull Request #601](https://github.com/aws/aws-sdk-ios/pull/601) [Github Issue #565](https://github.com/aws/aws-sdk-ios/issues/565)

### Enhancements
* **Amazon Cognito Identity Provider**
  * Added more error logging.
* **AWS IoT**
  * Added more error logging and missing `NSURLNetworkServiceTypeCallSignaling` case handling.
* **AWS STS**
  * Updated STS to the latest API specifications.
* **Amazon S3**
  * Updated S3 to the latest API specifications.

## 2.5.1
### Resolved Issues
* **SDK Core**
  * Fix namespace collision with Bolts framework. [Github Issue #572](https://github.com/aws/aws-sdk-ios/issues/572)
  * Fix a bug which caused bad memory access when no data is read from stream [Github Pull Request #582](https://github.com/aws/aws-sdk-ios/pull/582) [Github Issue #586](https://github.com/aws/aws-sdk-ios/issues/586)
* **Amazon Lex - Beta**
  * Fix a bug which cutoff beginning of audio stream.
  * Fix a bug which caused bad memory access during race conditions when in voice mode.

## 2.5.0
### General Updates
* **All Services**
  * Swift 3 documentation and naming definitions added. The naming definitions will affect all Swift users by changing method names. Please refer to the [blog](https://aws.amazon.com/blogs/mobile/aws-mobile-sdk-for-ios-version-2-5-0-improvements-and-changes-to-swift-support/) for more details on changes and how to upgrade from 2.4.X to 2.5.X.
* **SDK Core**
  * For Swift, `AWSRegionType` and `AWSServiceType` enums do not follow the convention that uses lowercase at the beginning. Example: `.USEast1` and `.DynamoDB`
* **Updated AWSTask**
  * AWSTask has been updated to the latest version of the Bolts framework.

### Breaking API Changes
* **SDK Core**
  * **AWSTask** no longer has `exception` property and affiliated methods due to Bolts update. This means that AWSTask will not handle exceptions and they will be thrown.
  * **AWSCredentialsProvider**
    * Removed deprecated property`login`. Please use `AWSIdentityProviderManager` to provide a valid logins dictionary to the credentials provider.
    * Removed deprecated method `initWithRegionType:identityId:identityPoolId:logins:`. Please use `initWithRegionType:identityPoolId:identityProviderManager:`.
    * Removed deprecated method `initWithRegionType:identityId:accountId:identityPoolId:unauthRoleArn:authRoleArn:logins:`. Please use `initWithRegionType:identityPoolId:unauthRoleArn:authRoleArn:identityProviderManager:`.
  * **AWSIdentityProvider**
    * Removed deprecated enum `AWSCognitoLoginProviderKey`.
    * `AWSCognitoCredentialsProviderHelperErrorType` enum entries changed to conform to convention.
      * Please use `AWSCognitoCredentialsProviderHelperErrorTypeIdentityIsNil` instead of `AWSCognitoCredentialsProviderHelperErrorIdentityIsNil`.
      * Please use `AWSCognitoCredentialsProviderHelperErrorTypeTokenRefreshTimeout` instead of `AWSCognitoCredentialsProviderHelperErrorTokenRefreshTimeout`.
* **Amazon S3**
  * **AWSS3TransferUtility** parameter name `completionHander` corrected to `completionHandler`. Afffected methods are `uploadData:bucket:key:contentType:expression:completionHander:`, `uploadFile:bucket:key:contentType:expression:completionHander:`, `downloadDataFromBucket:key:expression:completionHander:`, and `downloadToURL:bucket:key:expression:completionHander:`.
* **Amazon Cognito**
  * **AWSCognitoIdentityUser**
    * Removed deprecated method `getSession:password:validationData:scopes:`. Please use `getSession:password:validationData`.
    * Removed deprecated method `getSession:`. Please use `getSession` (no parameters).
* **AWS IoT**
  * **AWSIoTDataManager**
    * Removed deprecated method `publishString:onTopic:`. Please use `publishString:onTopic:QoS:`.
    * Removed deprecated method `publishString:qos:onTopic:`. Please use `publishString:onTopic:QoS:`.
    * Removed deprecated method `publishData:onTopic`. Please use `publishData:onTopic:QoS:`.
    * Removed deprecated method `publishData:qos:onTopic`. Please use `publishData:onTopic:QoS:`.
    * Removed deprecated method `subscribeToTopic:qos:messageCallback`. Please use `registerWithShadow:eventCallback`.
* **AWS IoT, Amazon DynamoDB, Amazon Cognito**
  * Type parameters specified for generic types where applicable.

### Resolved Issues
* **SDK Core**
  * Fix bug related to URL encoding [Github Issue 442](https://github.com/aws/aws-sdk-ios/issues/442)
* **Amazon Cognito Sync**
  * Fix and repair datasets stuck with "No such SyncCount" errors during synchronize.

## 2.4.16
### New Features
* **SDK Core**
  * Introducing new AWS `EUWest2` - Europe (London) region, endpoint `eu-west-2`.

* **Amazon Rekognition**
  * Amazon Rekognition is a service that makes it easy to add image analysis to your applications. With Rekognition, you can detect objects, scenes, and faces in images. You can also search and compare faces. Rekognition’s API enables you to quickly add sophisticated deep learning-based visual search and image classification to your applications.

### Misc. Updates

* **Amazon SQS**
  * Update SQS client to latest service model.

## 2.4.15
### New Features
* **SDK Core**
  * Introducing new AWS `CACentral1` - Canada (Central) region, endpoint `ca-central-1`.

### Resolved Issues

* **Amazon Pinpoint**
    *  Fix bugs related to session timeout and campaign opens analytics.

## 2.4.14
### New Features
* **Amazon Pinpoint**
  * Amazon Pinpoint makes it easy to run targeted campaigns to improve user engagement. Pinpoint helps you understand your users behavior, define who to target, what messages to send, when to deliver them, and tracks the results of the campaigns.


## 2.4.13
### New Features
* **Amazon Polly**
    *  Amazon Polly is a service that turns text into lifelike speech, making it easy to develop applications that use high-quality speech to increase engagement and accessibility. With Amazon Polly the developers can build speech-enabled apps that work in multiple geographies.
* **Amazon Lex - Beta**
    * Amazon Lex is a service for building conversational interactions into any application using voice and text. With Lex, the same conversational engine that powers Amazon Alexa is now available to any developer, enabling you to build sophisticated, natural language, conversational bots (chatbots) into your new and existing applications. Amazon Lex provides the deep functionality and flexibility of automatic speech recognition (ASR) for converting speech to text and natural language understanding (NLU) to understand the intent of the text. This allows you to build highly engaging user experiences with lifelike, conversational interactions.

### Resolved Issues

* **Amazon Mobile Analytics**
    * Do not allow empty keys for attributes or metrics.


## 2.4.12
### New Features
* **Amazon Mobile Analytics**
  *  Added support for setting custom max keystorage size. [Github Issue 500](https://github.com/aws/aws-sdk-ios/issues/500)

### Resolved Issues

* **Amazon API Gateway**
    * Fixed a URL encoding bug. [Github Issue 505](https://github.com/aws/aws-sdk-ios/issues/505)
* **Amazon S3 TransferUtility**
    * Added fix for timeout based on configuration.
* **Amazon Cognito Identity**
    * Fix issue causing SDK to call getOpenIdToken even with useEnhancedFlow set to YES
    * Fix issue introduced in 2.4.0 causing credentials to be refreshed on every AWS service call even when they were still valid
* **Amazon Cognito Sync**
    * Fix issue causing synchronize() to fail with "Mismatch between session identity id and request identity id" on the first sync with Developer Authenticated Identities and in other scenarios

## 2.4.11
### New Features
* **SDK Core**
  * Introducing new AWS `USEast2` (Ohio) region, endpoint `us-east-2`.

### Resolved Issues

* **Amazon API Gateway**
    * Fixed a URL encoding bug. [Github Issue 491](https://github.com/aws/aws-sdk-ios/issues/491)


## 2.4.10
### New Features
* **Amazon API Gateway**
  * Added support for a custom API invoker method with configurable HTTP parameters.
* **Amazon Cognito Identity Provider**
    * Added support for end user to set password and required attributes during initial authentication if they were created using AdminCreateUser.

### Resolved Issues

* **Amazon Cognito Identity Provider**
    * Fixed a bug causing AWSCognitoIdentityUserPool.clearAll to not clear the keychain. [Github Issue #476](https://github.com/aws/aws-sdk-ios/issues/476)

* **Amazon S3**
    * Fixed a bug which disabled creating an empty folder. [Github Issue #480](https://github.com/aws/aws-sdk-ios/issues/480)
    * Fixed a bug which did not set error object when bucket name is empty in request. [Github Issue #469](https://github.com/aws/aws-sdk-ios/issues/469)

## 2.4.9
### New Features
* **All Services**
    * Added support for Custom Endpoints.

### Resolved Issues
* **Amazon S3**
    * Fixed a bug which caused compilation errors when using SDK version 2.4.8 through CocoaPods.

### Misc. Updates
* **Amazon Mobile Analytics**
    * Deprecated the `mobileAnalyticsForAppId:identityPoolId:` and `mobileAnalyticsForAppId:identityPoolId:completionBlock:` client initializers.

## 2.4.8
### New Features
* **Amazon Cognito Identity Provider**
    * Added feature for custom authentication handlers.
    * Added support for getDevice, forgetDevice and added convenience methods to perform operations on this device.

### Misc Changes
* **All Services**
    * Updated all of the low-level clients with the latest models.

## 2.4.7
### Resolved Issues
* **Amazon Cognito Identity Provider**
  * Fixed integration between Cognito Identity Provider and Cognito Identity. [#438](https://github.com/aws/aws-sdk-ios/issues/438)

## 2.4.6
### New Features
* **SDK Core**
    * Added support for shared container identifier for extension support.
* **AWS Cognito Identity Provider**
    * Added support for devices in Cognito User Pools.
    * Added support for global sign out in Cognito User Pools.
    * Updated to support GA Cognito User Pools API's with exception of custom authentication. Custom authentication will be supported in a future release.
* **AWS S3**
    * Added userInfo to error objects in AWSS3TransferUtility.
* **Amazon SNS**
    * General service updates.

### Resolved Issues
* **Amazon Cognito Identity Provider**
    * Made providerId nullable in AWSCredentialProvider.
    * Fixed non-optional error parameter in Cognito User Pools.
    * Fixed issue causing resendConfirmationCode to return a null destination in Cognito User Pools.
* **Amazon S3**
    * Switched behavior from assert to throwing exception in AWSS3TransferUtility when response is not of class NSHTTPURLResponse type to avoid crashes.
* **Amazon Mobile Analytics**
    * Bug fix for [issue](https://github.com/aws/aws-sdk-ios/issues/409). Please refer to [this forum post](https://forums.aws.amazon.com/ann.jspa?annID=3935) for more details .

## 2.4.5
### New Features
* **SDK Core**
  * Introducing new AWS region Asia Pacific (Mumbai) region, endpoint `ap-south-1`.

### Resolved Issues
* **SDK Core**
    * Fixed a bug with response serialization to sometimes fail.

## 2.4.4
### New Features
* **SDK Core**
    * Added SAML support for `Amazon Cognito Federated Identities`.
### Resolved Issues
* **SDK Core**
    * Fixed a bug causing SDK to use legacy flow instead of enhanced flow when `IdentityProviderManager` is set.

## 2.4.3
### New Features
* **Amazon S3**
    * Added support for Amazon S3 Transfer Acceleration in `AWSS3TransferUtility`.

### Resolved Issues
* **Amazon S3**
    * Fixed the [issue](https://github.com/aws/aws-sdk-ios/issues/390) related to wrong error handling in AWSS3TransferUtility.

## 2.4.2
### New Features
* **SDK Core**
    * Added a new init method for the Cognito Identity credentials provider.
    * Added full support for IPv6.
* **Amazon S3**
    * Added `requestHeaders` to `AWSS3PreSignedURLBuilder` and `AWSS3TransferUtility`. Now you can specify the headers to sign for pre-signed URLs.
* **AWS IoT**
    * Added MQTT device shadow APIs to `AWSIoTDataManager`
    * Added support in `AWSIoTDataManager` for message callbacks with mqtt client and topic parameters
* **All services**
    * Updated all of the low-level clients with the latest models.

### Resolved Issues
* **SDK Core**
    * Fixed `AWSCore.podspec` for the extobjc conflict.
    * Fixed the enhanced flow switch in the Cognito Identity credentials provider.
* **Amazon Cognito User Pools**
    * Fixed [issue](https://forums.aws.amazon.com/thread.jspa?threadID=230694&tstart=0) with sign-in in locales other than English not working.
    * Fixed [issue](https://github.com/aws/aws-sdk-ios/issues/373) with sign-in using aliases.
    * [Added ability to determine whether a user is signed in and clearing last known user](https://github.com/aws/aws-sdk-ios/issues/370).
    * Fixed [issue](https://github.com/aws/aws-sdk-ios/issues/383) causing user pool delegate to not be released
* **Amazon Cognito Sync**
    * Serialize calls to synchronize and discard duplicate synchronize requests to prevent ResourceConflicts when syncing from one device.
    * Fixed issue with identity id being preserved when database was cleared.
    * [Correctly set datasets’s lastModified and creationDate](https://github.com/aws/aws-sdk-ios/issues/246).
* **Amazon Kinesis**
    * Fixed the threading issue in the Kinesis Recorder.
* **Amazon S3**
    * Fixed the response serialization issue when the response content type is HTML.


## 2.4.1

### New Features
* **Amazon S3**
    * **(Breaking)** `AWSS3TransferUtility` is generally available. Now you have access to the underlying `NSURLSessionTask`, `NSURLRequest` and `NSHTTPURLResponse`. The progress feedback block is updated to use `NSProgress`. Also, the error messages returned by Amazon S3 are correctly propagated as an `NSError`.
* **Amazon Cognito Identity Provider (Beta)**
    * Fixed the issue requiring password reentry with a valid refresh token.
    * The SDK retries for bad auth attempts.
    * **(Breaking)** Switched from blocks to delegates for interactive authentication. Set a class that conforms to the `AWSCognitoIdentityInteractiveAuthenticationDelegate` protocol as the delegate on `AWSCognitoIdentityUserPool`.
    * **(Breaking)** `- signUp:password:userAttributes:validationData:` on `AWSCognitoIdentityUserPool` returns an `AWSCognitoIdentityUserPoolSignUpResponse` containing the `AWSCognitoIdentityUser` instead of directly returning an `AWSCognitoIdentityUser`.

### Misc Changes
* **SDK Core**
    * Now the SDK fails fast to help identify an issue when you mix different versions of the `AWSCore` SDK and service client SDKs. You need to use the same version of the AWS Mobile SDKs within a project.
    * The AWS Signature related logs are moved from the `Debug` to `Verbose` level.

## 2.4.0

### New Features
* **SDK Core**
    * **(Breaking)** Migrated from the static frameworks to the dynamic frameworks. The AWS Mobile SDK for iOS now supports iOS 8 and above due to this change. If you need iOS 7 support, continue using 2.3.x.
    * Added official support for [Carthage](https://github.com/Carthage/Carthage). See `README.md` for more information.
    * Added support for the SDK configurations through `Info.plist`.
    * **(Breaking)** Updated the credentials provider and identity provider protocols to asynchronous interfaces instead of previous synchronous ones. The `logins` dictionary of `AWSCognitoCredentialsProvider` is now deprecated. Use `AWSIdentityProviderManager` to provide login providers' credentials. See `AWSCredentialsProvider.h` and `AWSIdentityProvider.h` for more details.
* **Amazon Cognito Identity Provider (Beta)**
    * You can now use Amazon Cognito to easily add user sign-up and sign-in to your mobile and web apps. Your User Pool in Amazon Cognito is a fully managed user directory that can scale to hundreds of millions of users, so you don't have to worry about building, securing, and scaling a solution to handle user management and authentication. See `AWSCognitoIdentityUserPool.h` for more details.
* **AWS IoT**
    * Added support for Amazon Cognito Identity with WebSocket connections, identity import, custom `Keep-Alive` and Last Will and Testament, and exponential back-off on reconnect.
* **Amazon DynamoDB**
    * Added the attribute name override capability to `AWSDynamoDBObjectMapper` by implementing `+ JSONKeyPathsByPropertyKey` in the model class.

### Resolved Issues
* **SDK Core**
    * Fixed an issue where Cognito Identity Id is not properly cleaned up under certain circumstances.
    * Improved the retry handling for certain throttling exceptions.
    * Fixed an AWS Signature Version 4 issue when there is an extra `/` at the end of the endpoint URL.
    * Fixed the `FMDatabasePoolDelegate` naming collision.
* **Amazon DynamoDB**
    * Fixed `- load:hashKey:rangeKey:` to return `nil` when the row does not exist.
* **Amazon Kinesis**
    * Patched an issue where `AWSKinesisRecorder` and `AWSFirehoseRecorder` may cause an infinite retry loop when the device is offline.
* **Amazon S3**
    * The SDK now invalidates the internal `NSURLSession` when `+ removeS3TransferUtilityForKey:` is called.
    * Fixed a memory issue for downloading a large object as an `NSData`.

### Misc Changes
* **SDK Core**
    * Changed the default logging level from `Error` to `Debug`.
* **Amazon Cognito Sync**
    * The source code for the Amazon Cognito Sync iOS client is now hosted in our [aws-sdk-ios](https://github.com/aws/aws-sdk-ios) repository instead of [amazon-cognito-ios](https://github.com/aws/amazon-cognito-ios). The AWS Mobile SDK for iOS is generally licensed under the Apache 2.0 License, with the Amazon Cognito Sync and Amazon Cognito Identity Provider subcomponents being licensed under the Amazon Software License. See `LICENSE`, `LICENSE.AMAZON`, and `LICENSE.APACHE` for more details.

## 2.3.6

### New Features
* **SDK Core**
    * Allows setting of `allowsCellularAccess` via `AWSNetworkingConfiguration`.
* **AWS Lambda**
    * Added `invoke` methods with completion handlers to `AWSLambdaInvoker`.

### Resolved Issues
* **SDK Core**
    * Fixed an issue that SDK does not return an error object for certain 4xx and 5xx exceptions.
    * Updated the API documentation to reflect the correct nullability annotations for some constructors.
    * Fixed an issue so that Twitter Fabric can properly initialize the AWS Mobile SDK for iOS.

## 2.3.5

### New Features
* **AWS Lambda**
    * Updated `AWSLambda` to add support for VPC.

### Resolved Issues
* **Amazon Cognito Sync**
    * Fixed a bug that `- registerDeviceInternal:` may not return a valid data type object.
* **SDK Core**
    * Updated podspecs to avoid conflicts with other projects that embed Mantle, libextobjc, and Fabric.

## 2.3.4

### New Features
* **AWS IoT**
    * Added support for MQTT over WebSocket connections to AWS IoT. WebSocket connections allow applications to connect, publish, and subscribe to topics on AWS IoT using the standard secure web port 443 without requiring a client certificate and private key.
* **SDK Core**
    * Added generics annotations to all low-level clients and `AWSS3TransferUtility`, `AWSS3PreSignedURLBuilder`, and `AWSLambdaInvoker`.
    * Added service call APIs with completion handlers to all low-level clients.

### Resolved Issues
* **Amazon Cognito Sync**
    * Fixed bug in `AWSCognito` `- subscribeAll` and `- unsubscribeAll` that caused `NSInvalidArgumentException` exception.
* **Amazon Mobile Analytics**
    * Addressed an issue that may cause an app to crash under certain situations.
* **SDK Core**
    * Fixed the build settings to fully enable bitcode support.

## 2.3.3

### New Features
* **Amazon Kinesis Firehose**
    * Added Amazon Kinesis Firehose support.
* **Asia Pacific (Seoul) Region**
    * Added Asia Pacific (Seoul) Region support. See `AWSServiceEnum.h` for more details.
* **Amazon S3**
    * Updated the Amazon S3 client model to the latest version.

## 2.3.2

### New Features
* **AWS IoT**
    * Added AWS IoT platform APIs.
    * Supports publishing and subscribing to MQTT topics with certificate-based authentication.
    * Supports device shadows via AWS IoT REST API.

### Resolved Issues
* **SDK Core**
    * Fixed the STS endpoint for the GovCloud region.
    * Fixed an issue where module map does not contain appropriate headers.
    * Suppressed the erroneous nullability warning.
* **Amazon API Gateway**
    * Resolved an issue where the SDK sometimes does not generate the URL path correctly.
* **Amazon Kinesis Recorder**
    * Resolved an issue where the SQLite vacuum may fail when there are many concurrent requests.
    * Improved the handling of concurrent `DELETE` requests to the SQLite database.

## 2.3.1

### New Features
* **Low-level Clients**
    * Added nullability annotations for the low-level service clients.
* **Frameworks**
    * The framework now includes the module map.
* **Twitter Fabric**
    * Added Twitter Fabric support for Amazon Cognito.

### Resolved Issues
* **SDK Core**
    * Updated the SDK so that the compiler no longer emits the deprecation warnings when the Base SDK is set to iOS 9.
    * Updated the following embedded third-party libraries: `Bolts`, `FMDB`, `TMCache`, and `UIKeyChainStore`.

## 2.3.0

### New Features
* **SDK Core**
    * The frameworks now include `bitcode` so that you can use them with Xcode 7 without modifying the project configuration. Please note the AWS Mobile SDK for iOS 2.3.0 supports Xcode 7 and above.
    * Added extra validation to ensure HTTP body is `nil` when HTTP method is either `GET` or `DELETE`.

## 2.2.7

### New Features
* **AWS Lambda**
    * Added support for AWS Lambda function versioning.

## 2.2.6

### New Features
* **Amazon DynamoDB**
  * Added support for Expressions syntax in DynamoDB Object Mapper.
* **Amazon S3**
  * Added support for Key Management Service (kms) in S3.

### Resolved Issues
* **Amazon S3**
    * [S3] Fixed an issue that failed large file uploads while using customer-provided encryption keys.


## 2.2.5

### Resolved Issues
* **Amazon S3 PresignedURL**
*   *  Fixed an issue in which `getPreSignedURL` may incorrectly returns credentials error under certain circumstance.
*   **Amazon S3 Transfer Utility**
*   * Fixed an issue in which `AWSS3TransferUtility` does not execute a completion handler when an expression is not provided.

## 2.2.4

### New Features
* **Amazon S3 Transfer Utility**
    * Added support for Amazon S3 Transfer Utility to simplify the data transfer between your iOS app and Amazon S3 in the background.
* **Amazon DynamoDB Object Mapper**
    * Added support for `ignoreAttributes` of the `AWSDynamoDBModeling` protocol.

### Resolved Issues
* **Amazon API Gateway**
    * Resolved a bug where an error object may not be serialized correctly.
* **Amazon Mobile Analytics**
    * Fixed an issue where the Amazon Mobile Analytics client overwrites the default configuration object and prevents other service clients from functioning properly.

## 2.2.3

### New Features
* **SDK Core**
    * Added AWS GovCloud (US) Region support.
* **Amazon S3**
    * Updated `AWSS3PreSignedURLBuilder` to use AWS Signature Version 4 for generating the pre-signed URLs.
    * Updated `AWSS3PreSignedURLBuilder` to accept additional request parameters to be included in pre-signed URLs.
* **Amazon DynamoDB Object Mapper**
  * Added support for Secondary Index Scan.

### Resolved Issues
* **Amazon S3**
    * Fixed an issue where an empty directory cannot be created.

## 2.2.2

### New Features
* **Amazon Mobile Analytics**
  *  Updated the Amazon Mobile Analytics client APIs so that the developer needs to write fewer lines of code to initialize it.
  *  Defaulted the SDK to send events over WAN.

### Resolved Issues
* **Amazon S3**
    * Fixed the issue in `S3TransferManager` that local downloaded files may be accidentally removed when the server returns 304 response.
    * Fixed the issue where the Amazon S3 client does not retry for the `SignatureDoesNotMatch` error.
    * Fixed the issue where `putBucketVersioning` does not return any response under certain situations.

## 2.2.1

### New Features
* **Amazon API Gateway** - Added a runtime library for the generated SDK of Amazon API Gateway. Amazon API Gateway makes it easy for AWS customers to publish, maintain, monitor, and secure application programming interfaces (APIs) at any scale.

### Resolved Issues
* **SDK Core** - Updated the CocoaPods podspec. Now the SDK is compatible with the `use_frameworks!` option.


## 2.2.0

### New Features
* **Service model updates** - The service models are updated for Amazon Cognito Identity, Amazon Cognito Sync, Amazon DynamoDB, Amazon EC2, and AWS Lambda.

### Resolved Issues
* **AWS Lambda** - Fixed an issue where the SDK does not properly serialize the response object when it contains `message` as a key.

### Misc Changes
* **SDK Core**
    * All third-party libraries are prefixed with `AWS` to avoid any conflicts with different versions of the third-party libraries. Please update all use of `BFTask` to `AWSTask`.
    * Removed the AWS service JSON files and imported them as source files to simplify the initial SDK installation.
* **Amazon Mobile Analytics** - Amazon Mobile Analytics is now provided as an independent service, and not a part of the AWS Core anymore. To use Amazon Mobile Analytics, please import `AWSMobileAnalytics.framework` or add `pod 'AWSMobileAnalytics'` to your `Podfile`. You need to update `#import <AWSCore/AWSCore.h>` to `#import <AWSMobileAnalytics/AWSMobileAnalytics.h>`.

## 2.1.2

### Resolved Issues
* **SDK Core** - Fixed an issue where the SDK does not return any response under certain situations.
* **Amazon Mobile Analytics** - Resolved an issue where `client_id` may be inadvertently changed.
* **Amazon S3**
    * Resolved an issue where the SDK cannot remove multiple objects.
    * Addressed an issue where concurrently downloading the same object to the same `filePath` may corrupt the data.

## 2.1.1

### New Features
* **AWS Lambda** - Added support for AWS Lambda.
* **Amazon Machine Learning** - Added support for Amazon Machine Learning.

### Resolved Issues
* **Amazon S3** - Fixed two memory issues:
    * When the request object is retained, `request.internalRequest` is not properly released after the operation completes.
    * The memory is not property released until all tasks finish when an app continuously downloads many files.

## 2.1.0

### Misc Changes
* **SDK Core**
    * Added `- initWithRegionType:identityPoolId:` to `AWSCognitoCredentialsProvider`. See `AWSCredentialsProvider.h` for further details.
    * Deprecated all `+ credentialsWith*` factory methods in `AWSCognitoCredentialsProvider`.
    * Added `+ registerSERVICEWithConfiguration:forKey:`, `+ SERVICEForKey:`, and `+ removeSERVICEForKey:` to each service client. See the service client headers for further details.
    * Deprecated `- initWithConfiguration:` in all service clients.
    * Deprecated `- serviceForKey:`, `- setService:forKey:`, and `- removeServiceForKey:` in `AWSServiceManager`.
    * Split the framework into per service frameworks.
    * Updated the SDK structure to support CocoaPods 0.36.0 with the `use_framework!` option.

### Resolved Issues
* **Amazon S3 Transfer Manager** - Fixed a bug where resume does not work as intended if the app restarts.

## 2.0.17

### Resolved Issues
* **Amazon DynamoDB Object Mapper** - Fixed a number format issue relating to the device locale setting.
* **Amazon Mobile Analytics** - Fixed an issue in `AWSMobileAnalyticsBufferedReader` that generated application errors if the underlying inputStream contained multi-byte characters.

## 2.0.16

### New Features
* **Amazon DynamoDB Object Mapper** - Added support for new data types: `BOOL`, `List`, and `Map`. `AWSDynamoDBModel` has been deprecated. Use `AWSDynamoDBObjectModel` instead.

### Resolved Issues
* **SDK Core** - Fixed a bug in the query string serializer that may cause `BatchPutAttributes` request failure in Amazon SimpleDB.

## 2.0.15

### Resolved Issues
* **SDK Core**
   * Fixed a bug in `AWSCognitoCredentialsProvider` where `identityId` was set to pool id when using simplified constructors.
   * Fixed a bug in `AWSCognitoCredentialsProvider` where credentials were not saved in the keychain when using simplified constructors.
   * Removed the third party libraries from `AWSiOSSDKv2.framework`.

* **Amazon S3** - Fixed an issue where the SDK does not automatically retry for the `SignatureDoesNotMatch` exception.

## 2.0.14

### New Features
* **Enhanced AWSCognitoCredentialsProvider** - Updated `AWSCognitoCredentialsProvider` to support new enhanced authentication flow. Reduced parameters necessary to initialize the provider.
* **Amazon DynamoDB Object Mapper** - Added three new save behaviors: `AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes`, `AWSDynamoDBObjectMapperSaveBehaviorAppendSet`, and `AWSDynamoDBObjectMapperSaveBehaviorClobber`.
* **Service definitions** - Updated the service model classes for Amazon Auto Scaling, Amazon Cognito Identity, Amazon DynamoDB, Amazon EC2, Amazon Kinesis, and Amazon S3.

### Resolved Issues
* **SDK Core**
    * Add reset logic to `AWSCognitoCredentialsProvider` when identity id has become invalid.
    * Renamed reserved keywords in Swift, Objective-C, and C++ to non-reserved words.
    * Updated `podspec` to make it less restrictive with Mantle, UICKeyChainStore, and Reachability libraries.
    * Fixed the exponential back off logic.
    * Set the maximum `maxRetryCount` to 10.
    * Updated the copyright year from 2014 to 2015.
* **Amazon S3**
  * Fixed the Amazon S3 date format issue.
  * Fixed a bug involving the potential for an invalid file URL to result in a crash.
  * Fixed the operation name mismatch issue.
* **Amazon DynamoDB Object Mapper**
    * Fixed the `- save:` method (Update behavior) where the method failed to remove `nil` value attribute(s) from a table.
    * Fixed the silent failure issue with the `- save:` method.
* **Amazon EC2** - Fixed the issue in which a value of `AWSEC2PlatformValues` was not parsed correctly in the response.

## 2.0.13

### New Features
* **Amazon Kinesis Recorder** - Amazon Kinesis PutRecords Rest API puts multiple records into an Amazon Kinesis stream in a single call. Amazon Kinesis Recorder now uses the PutRecords API to automatically batch requests, leading to higher throughput and optimized battery life. No developer change is required to benefit.

## 2.0.12

### New Features
* **Amazon Cognito Sync** - Amazon Cognito helps you save user data in the cloud and synchronize across all of an end user's devices. You can now choose to use push synchronization to synchronize data as soon as it is changed in the cloud.

### Resolved Issues
* **Amazon Cognito Identity** - An identity provider bug when using BYOI.

## 2.0.11

### Resolved Issues
* **Amazon Mobile Analytics** - Under certain circumstances, incorrect timestamps were submitted for custom events aggregation in the Amazon Mobile Service.

## 2.0.10

### Resolved Issues
* **Amazon Cognito Identity**
    * The AWS Mobile SDK for iOS 2.0.9 does not recognize identity IDs stored by the previous versions of the SDK.
    * `AWSCognitoCredentialsProvider` may return nil identity IDs when the Keychains service is not available.

## 2.0.9

### New Features
* **EU (Frankfurt) Region support** - The AWS Mobile SDK for iOS now supports EU (Frankfurt) Region.

### Resolved Issues
* **SDK Core**
    * The Objective-C ++ compatibility issue has been resolved.
    * The serializer bugs that may cause a crash and excessive access to Amazon Cognito Identity and Amazon STS have been fixed.
    * Xcode 5 Compatibility - The Xcode 5 backward compatibility issue has been resolved.
* **Amazon S3 PreSigned URL Builder** - `AWSS3PreSignedURLBuilder` now supports subdirectories. Also, the `AWSS3PreSignedURLBuilder` compatibility bug when used with `AWSCognitoCredentialsProvider` has been resolved.
* **Amazon Mobile Analytics** - The SDK now gracefully handles corrupted event data.

## 2.0.8

### New Features
* **Amazon Cognito Developer Authenticated Identities** - We are pleased to announce that we are adding support for your own identification management system in addition to existing support for a number of public login providers (Amazon, Facebook, and Google) and unauthenticated guests.
* **Amazon Mobile Analytics** - Amazon Mobile Analytics now has AWS Console generated application id's, which enables developers to set what an 'app' means to them. For instance this allows developers to have multiple flavors of an app all report into a single console report.

### Resolved Issues
* Amazon S3 - The Amazon S3 client now properly populates custom metadata headers.
* Amazon Mobile Analytics - The Amazon Mobile Analytics client handles non-ASCII app names correctly. The constant value changes resolve the duplicate symbols error when used with the Amazon A/B Testing SDK.
* Amazon DynamoDB Object Mapper - The Amazon DynamoDB Object Mapper client now supports schemas without a range key.

## 2.0.7

### New Features
* **SDK Core**
    * iOS 8 Support - The AWS Mobile SDK for iOS officially supports iOS 8.
    * Removed the dependency on `-ObjC` linker flag. - When importing frameworks, you no longer need to add -ObjC linker flag.
* **Amazon S3 PreSigned URL Builder** - The SDK now includes support for pre-signed Amazon Simple Storage Service (S3) URLs. You can use these URLS to perform background transfers using the NSURLSession class.
* **Amazon Cognito and Amazon Mobile Analytics** - The low level client names for Amazon Cognito and Mobile Analytics have been updated. e.g. `AWSCognitoIdentityService` becomes `AWSCognitoIdentity`.

### Resolved Issues
* **Amazon S3 Transfer Manager** - The SDK now immediately pauses/cancels multipart uploads without waiting for the current part to finish uploading.

## 2.0.6

### Resolved Issues

* **SDK Core**
  * A number of issues in the serializer are fixed.
  * AmazonCore is merged into AWSCore.
  * AWSEndpoint is moved to AWSServiceConfiguration.
  * AWSCognitoCredentialsProvider invalidates credentials when logins map is updated.
  * AWSWebIdentityCredentialsProvider takes into account the providerId.
* **Amazon Mobile Analytics** - The Mobile Analytics constructor is updated so that the developers do not have to manage instances of Mobile Analytics clients on their own.
* **Amazon DynamoDB Object Mapper and Amazon S3 Transfer Manager** - The low-level clients are hidden from S3TransferManager and DynamoDBObjectMapper in order to simplify the high-level clients.

## 2.0.5

### Resolved Issues
* **Query String Serializer** - Now the SDK correctly constructs the query string requests from a JSON model.
* **S3 Serializer** - The S3 serializer URL encoding issue has been resolved.

## 2.0.4

### Resolved Issues
* **Amazon Cognito Offline Sync** - The SDK queues sync requests made when device is offline. The sync operation is automatically executed when internet connectivity is recovered in the same app session. It also enables the ability to synchronize over WiFi only.
* **Amazon Cognito Sync** - The update fixes the following Amazon Cognito client issues:
  * An issue where deleted records may show up in the list of records.
  * An issue where data synchronized from service would have the incorrect sync count locally.
* **Amazon Cognito Identity** - The update fixes an issue with AWSCognitoCredentialsProvider where it does not refresh the credentials properly under certain situations.
* **Amazon S3** - The update fixes an issue with the serializer where it does not serialize the response under certain situations.
* **Amazon SNS** - The update properly serializes the attributes property for AWSSNSCreatePlatformEndpointInput and AWSSNSCreatePlatformApplicationInput.
* **Amazon SimpleDB** - The update correctly encodes the SimpleDB query string.

## 2.0.3 - Initial Release

### New Features
* **Amazon Cognito** - is a simple user identity and synchronization service that helps you securely manage and synchronize app data for your users across their mobile devices. With Amazon Cognito, you can save any kind of data, such as app preferences or game state, in the AWS Cloud without writing any backend code or managing any infrastructure.
* **Amazon Mobile Analytics** - is a service for collecting, visualizing and understanding app usage data at scale. Amazon Mobile Analytics reports are typically updated within 60 minutes from when data are received. Amazon Mobile Analytics is built to scale with the business and can collect and process billions of events from millions of endpoints.
* **Amazon Kinesis Recorder** - enables you to reliably record data to an Amazon Kinesis data stream from your mobile app. Kinesis Recorder batches requests to handle intermittent network connection and enable you to record events even when the device is offline.
* **Amazon DynamoDB Object Mapper** - We have made it easier to use DynamoDB from the AWS SDK for iOS by providing the DynamoDB Object Mapper for iOS. The DynamoDB Object Mapper makes it easy to set up connections to a DynamoDB database and supports high-level operations like creating, getting, querying, updating, and deleting records.
* **Amazon S3 Transfer Manager** - We have rebuilt the S3TransferManager to utilize BFTask in AWS SDK for iOS. It has a clean interface, and all of the operations are now asynchronous.
* **ARC support** - The AWS SDK for iOS is now ARC enabled from the ground up to improve overall memory management.
* **BFTask support** - With native BFTask support in the AWS SDK for iOS, you can chain async requests instead of nesting them. This makes the logic cleaner while keeping the code more readable.
* **Conforming Objective-C recommendations** - The AWS SDK for iOS conforms to Objective-C best practices. The SDK returns NSErrors instead of throwing exceptions. iOS developers will now feel at home when using the AWS Mobile SDK.
* **Official CocoaPods support** - Including the AWS SDK for iOS in your project is now easier than ever. You just need to add pod "AWSiOSSDKv2" and pod "AWSCognitoSync" to your Podfile.
