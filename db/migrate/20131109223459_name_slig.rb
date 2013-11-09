class NameSlig < ActiveRecord::Migration
  def change
    add_column :speakers, :slug, :string
    add_index :speakers, :slug, :unique => true
    Speaker.all.each {|x| x.save!}
  end
end
