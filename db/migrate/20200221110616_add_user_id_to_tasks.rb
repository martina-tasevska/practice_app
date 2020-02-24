class AddUserIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :userId, :string
  end
end
