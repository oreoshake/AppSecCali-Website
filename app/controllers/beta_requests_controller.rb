class BetaRequestsController < ApplicationController
  before_filter :setup_mailchimp, only: :create
  NEWSLETTER_ID = '551468a674'

  def create
    beta_request = BetaRequest.new(beta_request_params)

    if beta_request.save && subscribe(NEWSLETTER_ID, beta_request.email, beta_request.name)
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  http_basic_authenticate_with name: "admin", password: ENV['ADMIN_PASSWORD'], :except => :create

  def index
    @beta_requests = BetaRequest.all
  end

  private

  def beta_request_params
    params.require(:beta_request).permit(:name, :email)
  end
end
