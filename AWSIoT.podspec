Pod::Spec.new do |s|
  s.name         = 'AWSIoT'
  s.version      = '2.41.0'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '12.0'
  s.source       = { :git => 'https://github.com/aws-amplify/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.41.0'
  s.source_files = 'AWSIoT/*.{h,m}', 'AWSIoT/**/*.{h,m}'
  s.private_header_files = 'AWSIoT/Internal/*.h'
  s.resource_bundle = { 'AWSIoT' => ['AWSIoT/PrivacyInfo.xcprivacy']}
end
