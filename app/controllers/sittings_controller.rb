class SittingsController < ApplicationController
  before_action :set_pet, only: [:new, :create]
  before_action :set_sitting, only: [:show, :destroy]

  def new
    @sitting = Sitting.new
  end

  def create
    @sitting = Sitting.new(sitting_params)
    @sitting.user = current_user
    @sitting.pet = @pet

    if @sitting.save
      redirect_to dashboard_path
    else
      render "show"
    end
  end

  def show
    @pet = @sitting.pet
    @owner = @pet.user
  end

  def destroy
    @sitting.destroy
    redirect_to dashboard_path
  end

  private

  def sitting_params
    params.require(:sitting).permit(:start_date, :end_date)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_sitting
    @sitting = Sitting.find(params[:id])
  end
end
