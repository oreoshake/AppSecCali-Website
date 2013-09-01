class CspController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def csp_report
		head :ok
	end
end