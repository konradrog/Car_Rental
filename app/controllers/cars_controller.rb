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
    @opinion = Opinion.new(car_id: @car.id)
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy

    redirect_to cars_path
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render "edit"
    end
  end

  def search
    @cars = Car.search(params[:q])
    render "index"
  end

  def highest_first
    @cars = Car.all.order(price: :desc)
  end

  def lowest_first
    @cars = Car.all.order(:price)
    render "index"
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model,
                                :year, :price, :description, :image)
  end

end
