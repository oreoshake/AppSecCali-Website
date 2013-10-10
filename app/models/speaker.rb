class Speaker < ActiveRecord::Base
	validates :email, email: true, presence: true
	validates_presence_of :abstract, :name
end
