class User < ApplicationRecord
before_save { self.email = email.downcase }

#正規表現でメールの制限をかける必要あり
has_secure_password
has_many :reservations, dependent: :destroy
has_many :rooms, dependent: :destroy
#:imgはカラム名を指定している
mount_uploader :user_img, UserUploader
validates :email, presence: true,  uniqueness: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
validates :name, presence: true,  uniqueness: true
validates :self_introduction, length: {maximum:100}, presence: true, unless: -> { validation_context == :create || :edit }
validates :user_img, presence: true, unless: -> { validation_context == :create || :edit }
end
