require 'spec_helper'

describe BetaRequest, 'validations' do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
end
