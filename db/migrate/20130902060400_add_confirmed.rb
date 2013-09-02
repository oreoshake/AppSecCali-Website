class AddConfirmed < ActiveRecord::Migration
  def change
  	add_column :speakers, :confirmed, :boolean, :default => false
  end
end
