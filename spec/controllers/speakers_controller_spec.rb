require 'spec_helper'

describe SpeakersController do
	describe "#show" do
		it "has a 200 status code" do
			Speaker.should_receive(:find).and_return(double(:confirmed? => true))
      get :show, :id => 1
      expect(response.status).to eq(200)
    end

		it "has a 404 status code if not confirmed" do
			Speaker.should_receive(:find).and_return(double(:confirmed? => false))
			expect {
      	get :show, :id => 1
      }.to raise_error(ActiveRecord::RecordNotFound)
    end    
	end
end	