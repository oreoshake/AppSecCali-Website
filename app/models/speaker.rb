class Speaker < ActiveRecord::Base
	validates :email, email: true, presence: true
	validates :twitter_handle, allow_blank: true, format: { with: /\A@?\w+\z/ }
	validates :image_url, allow_blank: true, format: { with: /\Ahttps:\/\/.*\z/ }
	validates :website, allow_blank: true, format: { with: /\Ahttps?:\/\/.*\z/ }
	validates_presence_of :abstract, :name
end
