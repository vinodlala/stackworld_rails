class Item < ActiveRecord::Base

  validates :name, presence: true
  validates :image_url, presence: true
  validates :description, presence: true
  validates :room_id, presence: true
  validates :x_coord, presence: true
  validates :y_coord, presence: true

  belongs_to :room
end
