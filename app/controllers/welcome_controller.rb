class WelcomeController < ApplicationController
  def registration
    @title = "Register Now"
  end

	def index

	end

  def splash
    render :splash, :layout => 'splash'
  end
end
