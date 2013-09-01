class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :bio
      t.string :email
      t.string :image_url
      t.string :twitter_handle
      t.string :title
      t.string :company

      t.timestamps
    end
  end
end
