class AddPresentationFormat < ActiveRecord::Migration
  def change
    add_column :speakers, :presentation_format, :string
  end
end
