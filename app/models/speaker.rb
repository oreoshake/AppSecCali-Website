class Speaker < ActiveRecord::Base
	validates :email, :allow_blank => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
	validates :twitter_handle, :allow_blank => true, :format => { :with => /@?\w+/ }
	validates :image_url, :allow_blank => true, :format => { :with => /\Ahttps?:\/\// }
end
