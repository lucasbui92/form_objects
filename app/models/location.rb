class Location < ApplicationRecord
  belongs_to :user

  validates :country, presence: true, length: { minimum: 10 }
  validates :city, presence: true
end
