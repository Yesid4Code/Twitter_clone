class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
  validates :username, presence: true,
            length: {minimum: 5, maximum: 25}
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: 50},
            format: {with: VALID_EMAIL_REGEX}
  
  before_save :sinitize_text
  has_many :tweets, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # follow another user
  def follow(other_id)
    active_relationships.create(followed_id: other_id)
  end

  #  unfollow a user
  def unfollow(other_id)
    active_relationships.find_by(followed_id: other_id).destroy
  end

  # is following a user?
  def following?(other_id)
    following.include?(other_id)
  end
  
  def sinitize_text
    self.username = username.downcase
    self.name = name.titleize
    self.email = email.downcase
  end

  #end
end
