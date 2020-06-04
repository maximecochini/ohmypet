class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
    if params[:query].present?
      @pets = Pet.search_by_name_and_description(params[:query])
    else
      @pets = Pet.all
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render "new"
      p @pet
    end
  end

  def show
    @sitting = Sitting.new
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render "edit"
    end
  end

  def destroy
    @pet.destroy
    redirect_to dashboard_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :age, :description, :reward_per_day, :street_address, :postcode, :city, :country)
  end
end
