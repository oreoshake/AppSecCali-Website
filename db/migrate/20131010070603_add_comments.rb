class AddComments < ActiveRecord::Migration
  def change
    # aaaaaand the jank gets deeper already. The speakers table should be called submissions
    # and a speaker has_many :submissions. lololol
    add_column :speakers, :comments, :string
  end
end
