class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @email_registration = EmailRegistration.new(email: params[:registration][:email], terms_of_service: params[:terms_of_service])

    if @email_registration.invalid?
      redirect_to root_url, notice: 'Registration failed!' and return
    end

    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to root_url, notice: 'Registration successful!'
    else
      render :new
    end
  end

  private

  def email_registration_params
    params.require(:registration).permit(:email)
  end

  def registration_params
    params.require(:registration).permit(:email, :password, :country, :city)
  end
end
