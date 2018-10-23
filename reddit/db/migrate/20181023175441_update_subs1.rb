class UpdateSubs1 < ActiveRecord::Migration[5.2]
  def change
    change_column :subs, :user_id, :integer, null: false
  end
end
