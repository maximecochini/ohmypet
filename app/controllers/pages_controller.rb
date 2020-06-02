class PagesController < ApplicationController
  # Allow some pages to be shown without login
  # skip_before_action :authenticate_user!, only: :home

  # Configure more parameters for the sign up form
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def home
  end

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
