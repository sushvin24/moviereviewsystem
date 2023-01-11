class User < ApplicationRecord
  validates :email, :encrypted_password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_mail
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  def send_welcome_mail
    UserMailer.welcome_email(self).deliver
  end
end
