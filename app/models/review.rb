class Review < ApplicationRecord
  validates :comment, presence: true
  belongs_to :movie, counter_cache: true
  belongs_to :user
end
