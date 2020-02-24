class RemoveUserIdFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :userId, :string
  end
end
