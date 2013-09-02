class AddTraining < ActiveRecord::Migration
  def change
  	add_column :speakers, :training, :boolean
  end
end
