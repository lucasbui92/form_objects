class User < ApplicationRecord
  has_one :location

  validates :email, uniqueness: true, allow_blank: true
end
