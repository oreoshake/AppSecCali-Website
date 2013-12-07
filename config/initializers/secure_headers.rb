SecureHeaders::Configuration.configure do |config|
  config.hsts = {
    max_age: 20.years.to_i,
    include_subdomains: true
  }
  config.csp = {
  	default_src: 'self',
  	script_src: 'self https://syndication.twitter.com https://ssl.google-analytics.com http://owaspappseccalifornia2014.sched.org https://www.google-analytics.com https://platform.twitter.com https://*.twimg.com',
  	style_src: 'self inline https://platform.twitter.com',
  	img_src: 'self https: https://si0.twimg.com http://www.google-analytics.com https://www.google-analytics.com',
  	frame_src: 'http://owaspappseccalifornia2014.sched.org https://www.ssllabs.com https://cloudfront.net http://*.twitter.com https://*.twitter.com https://twitter.com',
    report_uri: '/csp_report',
    disable_chrome_extension: true,
  	enforce: false
  }


end