# frozen_string_literal: true

class CreatePostForm
  include ActiveModel::Model

  attr_accessor :note, :city_name, :user_id, :temperature

  validates :note, presence: true, length: { maximum: 500 }
  validates :city_name, presence: true
  validates :user_id, presence: true
  validates_presence_of :temperature, message: "can't be read, provide valid city"

  def save
    return false unless valid?

    post.save
  end

  private

  def post
    @post = Post.new(
      note: note,
      city: city,
      user_id: user_id,
    )
  end

  def city
    @city = City.find_or_create_by(name: city_name, weather: weather)
  end

  def weather
    @weather = Weather.find_or_create_by(temperature: temperature)
  end
end
