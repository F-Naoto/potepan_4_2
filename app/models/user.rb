class User < ApplicationRecord
before_save { self.email = email.downcase }
validates :name, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true, length: {in:1..30}
#正規表現でメールの制限をかける必要あり
# validates :self_introduction, length: {in:1..100}
has_secure_password
has_many :reservations, dependent: :destroy
has_many :rooms, dependent: :destroy
end
