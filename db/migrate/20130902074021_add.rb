class Add < ActiveRecord::Migration
  def change
  	add_column :speakers, :website, :string
  end
end
