class BioText < ActiveRecord::Migration
  def change
  	change_column :speakers, :bio, :text, :limit => nil
  end
end
