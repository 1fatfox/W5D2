class UpdateSubs2 < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :subs
    add_timestamps :posts
  end
end
