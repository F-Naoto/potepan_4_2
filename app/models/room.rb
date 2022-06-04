class Room < ApplicationRecord
  belongs_to :user
  # belongs_toの外部キーのnilを許可する
  has_many :reservations, dependent: :destroy
  #:imgはカラム名を指定している
  mount_uploader :img, RoomUploader
  validates :address, presence: true
  validates :img, presence: true
  validates :introduction, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
