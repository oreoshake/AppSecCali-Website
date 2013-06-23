SecureHeaders::Configuration.configure do |config|
  config.csp = {
  	:default_src => 'self',
  	:script_src => 'self https://platform.twitter.com http://platform.twitter.com',
  	:style_src => 'self inline',
  	:img_src => 'https://si0.twimg.com',
  	:frame_src => 'https://www.youtube.com http://www.youtube.com http://platform.twitter.com https://platform.twitter.com https://maps.google.com http://maps.google.com',
  	:enforce => true
  }
end