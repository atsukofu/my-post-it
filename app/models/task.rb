class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :status, presence: true
end
