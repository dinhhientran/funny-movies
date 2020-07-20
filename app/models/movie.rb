class Movie < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :url, presence: true, url: true, uniqueness: true
  validates :embed_code, presence: true
end
