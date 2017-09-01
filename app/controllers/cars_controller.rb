class CarsController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end


end
