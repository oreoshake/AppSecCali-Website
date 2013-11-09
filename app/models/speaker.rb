class Speaker < ActiveRecord::Base
	validates :email, email: true, presence: true
	validates_presence_of :abstract, :name

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
