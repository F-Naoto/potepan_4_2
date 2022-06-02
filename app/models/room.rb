class Room < ApplicationRecord
  belongs_to :user, optional: true
  # belongs_toの外部キーのnilを許可する
  has_many :reservations, dependent: :destroy
end
