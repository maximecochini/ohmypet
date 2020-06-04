class Pet < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  SPECIES = ["dog", "cat", "rabbit", "donkey", "snake", "horse", "pig"]

  belongs_to :user
  has_many :sittings, dependent: :destroy

  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
  validates :reward_per_day, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :age, presence: true

  def self.get_species
    SPECIES
  end
end
