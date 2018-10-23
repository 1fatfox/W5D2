class UpdateSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :user_id, :integer
    add_index :subs, :user_id
  end
end
