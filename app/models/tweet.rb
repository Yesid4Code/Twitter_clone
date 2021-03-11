class Tweet < ApplicationRecord
  belongs_to :user
  validates :tweet, length: {maximum: 280}
end
