class VolunteersController < ApplicationController
  VOLUNTEER_LIST_ID = 'd0f99b468b'
  before_filter :setup_mailchimp, only: :create

  def index
    @volunteer = Volunteer.new
  end

  def create
    volunteer = Volunteer.new(volunteer_params)
    if subscribe(VOLUNTEER_LIST_ID, volunteer.email, volunteer.name)
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

private
  # Only allow a trusted parameter "white list" through.
  def volunteer_params
    params.require(:volunteer).permit(:name, :email)
  end
end
