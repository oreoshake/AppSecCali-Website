require 'spec_helper'
require 'net/http'

describe "Basic authentication" do
	http_auth = ActionController::HttpAuthentication::Basic.encode_credentials('fail', 'fail')

	it "protects sensitive pages" do
		[beta_requests_path, edit_speaker_path(1)].each do |path|
	  	get path, 'HTTP_AUTHORIZATION' => http_auth
	  	response.status.should == 401
	  end

	  [speaker_path(1)].each do |path|
	  	put path, 'HTTP_AUTHORIZATION' => http_auth
	  	response.status.should == 401
	  	patch path, 'HTTP_AUTHORIZATION' => http_auth
	  	response.status.should == 401
	  end

	  [speaker_path(1)].each do |path|
	  	delete path, 'HTTP_AUTHORIZATION' => http_auth
	  	response.status.should == 401
	  end
	end
end