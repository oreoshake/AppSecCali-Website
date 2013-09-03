SecureHeaders::Configuration.configure do |config|
  config.csp = {
  	:default_src => 'self',
  	:script_src => 'self http://www.google-analytics.com https://www.google-analytics.com https://platform.twitter.com http://platform.twitter.com https://*.twimg.com http://*.twimg.com',
  	:style_src => 'self inline https://platform.twitter.com http://platform.twitter.com',
  	:img_src => 'self https: https://si0.twimg.com http://www.google-analytics.com https://www.google-analytics.com',
  	:frame_src => 'https://cloudfront.net https://www.youtube.com http://www.youtube.com http://*.twitter.com https://*.twitter.com https://twitter.com http://twitter.com https://maps.google.com http://maps.google.com',
    :report_uri => '/csp_report',
  	:enforce => true
  }
end