class AddTitle < ActiveRecord::Migration
  def change
    add_column :speakers, :presentation_title, :string
  end
end
