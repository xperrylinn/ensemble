class RemoveUserIdFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :user_id, :int
  end
end
