class WelcomeController < ApplicationController
	def location

	end

	def training
		@speakers = Speaker.all
	end

	def index
		@beta_request = BetaRequest.new
	end

	def code_of_conduct

	end

  def splash
    @beta_request = BetaRequest.new
    render :splash, :layout => 'splash'
  end
end
