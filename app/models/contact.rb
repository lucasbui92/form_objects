class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :email, :message, :name
  validates :email, :message, :name, presence: true
end
