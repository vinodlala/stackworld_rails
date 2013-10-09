class Room < ActiveRecord::Base
  validates :name, presence: true

  has_many :connections, :foreign_key => "starting_room_id"
  has_many :endings_rooms, :through => :connections

  has_many :items

  belongs_to :creator, :class_name => "Player"
end
