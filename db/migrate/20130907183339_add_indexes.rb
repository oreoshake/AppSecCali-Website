class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :speakers, :id
  	add_index :speakers, :twitter_handle
  	add_index :beta_requests, :id
  end
end
