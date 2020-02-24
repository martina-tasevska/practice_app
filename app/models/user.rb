class User < ApplicationRecord
  has_secure_password
  has_many :tasks

  def user_tasks
    Task.where("user_id = ?", id)
  end
end
