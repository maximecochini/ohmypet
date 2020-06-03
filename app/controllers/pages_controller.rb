class PagesController < ApplicationController
  # # Allow some pages to be shown without login
  # skip_before_action :authenticate_user!, only: :home

  # # Configure more parameters for the sign up form
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def home
  end

  def dashboard
    @sittings = current_user.sittings
    @pets = current_user.pets
  end
end
