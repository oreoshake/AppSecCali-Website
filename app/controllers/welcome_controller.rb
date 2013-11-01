class WelcomeController < ApplicationController
  def registration

  end

	def training
		@speakers = Speaker.all
	end

	def index

	end

  def splash
    render :splash, :layout => 'splash'
  end
end
