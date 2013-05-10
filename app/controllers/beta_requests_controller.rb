class BetaRequestsController < ApplicationController
  def create
    beta_request = BetaRequest.new(beta_request_params)

    if beta_request.save
      render text: "Thanks for signing up!"
    else
      render text: beta_request.errors.full_messages.to_sentence, stats: 400
    end
  end

  private

  def beta_request_params
    params.require(:beta_request).permit(:name, :email)
  end
end
