class Registration
  include ActiveModel::Model
  extend ActiveModel::Translation

  attr_accessor :email, :password, :country, :city

  validate :validate_children

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      user.save!
      location.save!
    end
  end

  private

  def user
    @user ||= User.new(email: email, password: password)
  end

  def location
    @location ||= user.build_location(country: country, city: city)
  end

  def validate_children
    if user.invalid?
      promote_errors(user.errors)
    end

    if location.invalid?
      promote_errors(location.errors)
    end
  end

  def promote_errors(child_errors)
    child_errors.each do |attribute, message|
      errors.add(attribute, message)
    end
    # child_errors.each do |error|
    #   attribute = error.attribute
    #   message = error.message
    # end
  end
end
