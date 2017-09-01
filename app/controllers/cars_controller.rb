class CarsController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.create(car_params)

    if @car.new_record?
      render "new"
    else
      redirect_to car_path(@car)
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model,
                                :year, :price, :description)
  end

end
