class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  before_save :sinitize_text
  
  validates :username, presence: true,
            length: {minimum: 5, maximum: 25}
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: 50},
            format: {with: VALID_EMAIL_REGEX}
  


  def sinitize_text
    self.username = username.downcase
    self.name = name.titleize
    self.email = email.downcase
  end
  #end
end
