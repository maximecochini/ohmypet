class Pet < ApplicationRecord

  SPECIES = ["dog", "cat", "rabbit", "donkey", "snake", "horse", "pig"]

  belongs_to :user
  has_many :sittings

  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
  validates :description, presence: true
  validates :reward_per_day, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :country, presence: true

end
