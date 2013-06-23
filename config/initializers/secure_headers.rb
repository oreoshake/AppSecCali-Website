SecureHeaders::Configuration.configure do |config|
  config.csp = {
  	:default_src => 'self',
  	:script_src => 'self https://platform.twitter.com',
  	:style_src => 'self inline',
  	:img_src => 'https://si0.twimg.com',
  	:frame_src => 'https://www.youtube.com https://maps.google.com',
  	:enforce => true
  }
end