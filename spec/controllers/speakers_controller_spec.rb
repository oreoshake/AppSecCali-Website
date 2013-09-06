require 'spec_helper'

describe SpeakersController do
	describe "#show" do
		before(:each) do

		end
		it "has a 200 status code" do
			Speaker.stub(:find).and_return(double(:confirmed => true))
      get :index
      expect(response.status).to eq(200)
    end
	end
end	