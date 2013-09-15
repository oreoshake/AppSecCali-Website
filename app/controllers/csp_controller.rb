class CspController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def csp_report
		Rails.logger.error((params['csp-report']||{}).merge('user-agent' => request.env["HTTP_USER_AGENT"]))
		head :ok
	end
end