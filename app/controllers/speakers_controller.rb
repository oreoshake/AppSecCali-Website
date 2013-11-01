class SpeakersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: ENV['ADMIN_PASSWORD'], :except => [:cfp, :new, :create, :index, :show, :privacy]
  before_action :set_speaker, only: [:edit, :update, :destroy]
  before_filter :setup_mailchimp, only: [:create]
  CFP_LIST_ID = 'e9e26c9eb4'

  def index
    @title = "Speakers - AppSec California 2014"
    @speakers = Speaker.all
  end

  def cfp
  end

  def privacy
  end

  def show
    @speaker = Speaker.find(params[:id])
    @title = "AppSec California 2014 - Speaker.name"
    raise ActiveRecord::RecordNotFound .new('Not Found') unless @speaker.confirmed?

  end

  def new
    @title = "AppSec California 2014 CFP Submission"
    @speaker = Speaker.new
  end

  def edit
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      if Rails.env.production? || Rails.env.test?
        subscribe(CFP_LIST_ID, @speaker.email, @speaker.name)
        Notifier.cfp_submission(@speaker).deliver
      end
      flash[:notice] = "Thanks for submitting!"
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def update
    if @speaker.update(speaker_params)
      redirect_to @speaker, notice: 'Speaker was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @speaker.destroy
    redirect_to speakers_url, notice: 'Speaker was successfully destroyed.'
  end

  private
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    def speaker_params
      params.require(:speaker).permit(:name, :bio, :email, :image_url, :twitter_handle, :title, :company, :website, :training, :abstract, :presentation_format, :comments, :presentation_title)
    end
end
