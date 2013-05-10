class CreateBetaRequests < ActiveRecord::Migration
  def change
    create_table :beta_requests do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
