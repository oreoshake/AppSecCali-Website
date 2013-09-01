class WelcomeController < ApplicationController
  def index
    @beta_request = BetaRequest.new
    @speakers = Speaker.all
  end
end
