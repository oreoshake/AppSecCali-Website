class WelcomeController < ApplicationController

	def location

	end

	def index
		@beta_request = BetaRequest.new
	end

  def splash
    @beta_request = BetaRequest.new
    @speakers = Speaker.all
    render :splash, :layout => 'splash'
  end
end
