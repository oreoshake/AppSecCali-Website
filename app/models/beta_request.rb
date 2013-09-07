class BetaRequest < ActiveRecord::Base
  validates :email, presence: true, email: true, uniqueness: {message: "You have already subscribed to announcements. Thanks!"}
  validates :name, presence: true
end
