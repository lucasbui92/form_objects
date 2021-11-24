class EmailRegistration
  include ActiveModel::Model

  attr_accessor :email, :terms_of_service

  validates :email, presence: true
  validates :terms_of_service, presence: true, acceptance: { accept: '1' }
end
