class Activity < ApplicationRecord
  belongs_to :user
  enum name: [:Running, :Yoga, :HIIT, :Cycling, :Weight_Training, :Swimming, :Hiking, :Jogging, :Pilates, :Dancing, :other]
  validates :name, presence: true
  validates :duration_minutes, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1440 }
  validates :date_field, presence: true


end
