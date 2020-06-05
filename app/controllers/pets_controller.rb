class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query].present?
      @pets = Pet.search_by_name_description_species_and_reward_per_day(params[:query])
    elsif params[:species]
      @pets = Pet.where(species: params[:species])
    elsif params[:order] == 'created_at'
      @pets = Pet.all.order(created_at: :desc)
    elsif params[:order]
      @pets = Pet.all.order(params[:order])
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
    @review = Review.new
    if @pet.geocoded?
      @markers = [{lat: @pet.latitude, lng: @pet.longitude}]
    end
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
    params.require(:pet).permit(:name, :species, :age, :description, :reward_per_day, :street_address, :postcode, :city, :country, :photo)
  end
end
