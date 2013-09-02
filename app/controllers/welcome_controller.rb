class WelcomeController < ApplicationController
	caches_page :location, :training, :code_of_conduct, :contact

	def training
		@speakers = Speaker.all
	end

	def index
		@beta_request = BetaRequest.new
	end

  def splash
    @beta_request = BetaRequest.new
    render :splash, :layout => 'splash'
  end
end
