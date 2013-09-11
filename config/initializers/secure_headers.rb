SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 20.years.to_i, :include_subdomains => true}
  config.csp = {
  	:default_src => 'self https:',
  	:script_src => 'self http://www.google-analytics.com https://www.google-analytics.com https://platform.twitter.com http://platform.twitter.com https://*.twimg.com http://*.twimg.com',
  	:style_src => 'self inline https://platform.twitter.com http://platform.twitter.com',
  	:img_src => 'self https: https://si0.twimg.com http://www.google-analytics.com https://www.google-analytics.com',
  	:frame_src => 'https: https://www.ssllabs.com https://cloudfront.net http://*.twitter.com https://*.twitter.com https://twitter.com http://twitter.com',
    :report_uri => '/csp_report',
  	:enforce => true
  }
end