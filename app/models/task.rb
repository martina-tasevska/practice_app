class Task < ApplicationRecord
  belongs_to :user

  before_create do
    self.state = false
  end
end
