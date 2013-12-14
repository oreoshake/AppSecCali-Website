class AddSched < ActiveRecord::Migration
  def change
  	add_column :speakers, :sched_id, :integer, default: 0
  end
end
