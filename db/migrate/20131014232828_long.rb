class Long < ActiveRecord::Migration
  def change
    change_column :speakers, :name, :text
    change_column :speakers, :comments, :text
    change_column :speakers, :email, :text
    change_column :speakers, :image_url, :text
    change_column :speakers, :twitter_handle, :text
    change_column :speakers, :title, :text
    change_column :speakers, :company, :text
    change_column :speakers, :presentation_format, :text
  end
end
