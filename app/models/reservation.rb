class Reservation < ApplicationRecord
  belongs_to :user,    optional: true
  belongs_to :room,    optional: true
  
  validates  :user_id, presence: true
  validates  :room_id, presence: true
end
