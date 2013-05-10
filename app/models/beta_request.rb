class BetaRequest < ActiveRecord::Base
  validates :email, presence: true, email: true
  validates :name, presence: true
end
