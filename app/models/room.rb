class Room < ApplicationRecord
  belongs_to :user
  # belongs_toの外部キーのnilを許可する
  belongs_to :reservation, optional: true
end
