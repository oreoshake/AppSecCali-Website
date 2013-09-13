class BetaRequestsController < ApplicationController
  def create
    beta_request = BetaRequest.new(beta_request_params)

    if beta_request.save
      Notifier.newletter_signup(beta_request.email).deliver
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      flash[:warning] = beta_request.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  http_basic_authenticate_with name: "admin", password: ENV['ADMIN_PASSWORD'] || 'ASDF', :except => :create

  def index
    @beta_requests = BetaRequest.all
  end

  private

  def beta_request_params
    params.require(:beta_request).permit(:name, :email)
  end
end
