class City < ApplicationRecord
  belongs_to :weather
  has_many :posts

  validates :name, presence: true
end
