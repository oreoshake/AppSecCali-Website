class Speaker < ActiveRecord::Base
	validates :email, :allow_blank => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :twitter_handle, :allow_blank => true, :format => { :with => /\A@?\w+\z/ }
	validates :image_url, :allow_blank => true, :format => { :with => /\Ahttps?:\/\/.*\z/ }
	validates :website, :allow_blank => true, :format => { :with => /\Ahttps?:\/\/.*\z/ }
	validates_presence_of :abstract, :email, :name
end
