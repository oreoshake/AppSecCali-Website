require 'spec_helper'

describe BetaRequest, 'validations' do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }

  it "validates the email address is properly formatted" do
    beta_request = BetaRequest.new(name: 'John Doe', email: 'john@example.com')
    expect(beta_request).to be_valid
    beta_request.email = 'jerry'
    expect(beta_request).not_to be_valid
  end
end
