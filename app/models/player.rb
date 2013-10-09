class Player < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :avatar_image, presence: true

  has_many :rooms, :foreign_key => "creator_id"
end
