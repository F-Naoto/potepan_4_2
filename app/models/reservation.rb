class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates  :user_id,      presence: true
  validates  :room_id,      presence: true
  validates  :stay_number,  presence: true, length: {minimum:1, maximum:20}
  validates  :from_when,    presence: true
  validates  :to_when,      presence: true
  validates  :total_price,  presence: true
end