class Sitting < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, presence: true, type: Date
  validates :end_date, presence: true, type: Date
end
