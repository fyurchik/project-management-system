class Task < ApplicationRecord
  belongs_to :project

  enum :status, [:new_task, :in_progress, :completed]
  validates :title, presence: true
end
