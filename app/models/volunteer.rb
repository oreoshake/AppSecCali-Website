class Volunteer < ActiveRecord::Base
  validates :email, presence: true, email: true
  validates :name, presence: true
end
