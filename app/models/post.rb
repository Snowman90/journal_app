class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :note, presence: true, length: { maximum: 140 }
end
