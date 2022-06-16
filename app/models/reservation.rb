class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates  :user_id,      presence: true
  validates  :room_id,      presence: true
  validates  :stay_number,  presence: true
  validates  :from_when,    presence: true
  validates  :to_when,      presence: true
  validates  :total_price,  presence: true
  validate  :start_end_check
  validate  :day_before_start

  def start_end_check
    errors.add(:"終了日", "は開始日以降の日を登録してください") unless
    from_when == nil || to_when == nil || from_when < to_when 
  end
  
  def day_before_start
   errors.add(:"開始日", "は今日以降のものを選択してください")if from_when != nil && to_when != nil && from_when < Date.today
  end
  
  def total_day
    (self.to_when - self.from_when).to_i if !self.to_when.nil? && !self.from_when.nil?
  end

  def total_price
     self.total_day.to_i * self.stay_number.to_i * self.room.price
  end
end