class AddAbstract < ActiveRecord::Migration
  def change
  	add_column :speakers, :abstract, :text
  end
end
