class Room < ApplicationRecord
  belongs_to :user
  has_many   :reservations, dependent: :destroy
  #:imgはカラム名を指定している
  mount_uploader :img, RoomUploader
  validates :address, presence: true, length: {maximum:50}
  validates :img, presence: true
  validates :introduction, presence: true, length: {maximum:100}
  validates :name, presence: true, length: {maximum:20}
  validates :price, presence: true
end
