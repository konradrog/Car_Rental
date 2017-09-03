class OpinionsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @opinion = Opinion.new(car_id: @car.id)
    @opinion.attributes = opinion_params

    if @opinion.save
      redirect_to car_path(@car)
    else
      render "cars/show"
    end
  end

  def destroy
    opinion = Opinion.find(params[:id])
    opinion.destroy

    redirect_to car_path(opinion.car)
  end

  private

  def opinion_params
    params.require(:opinion).permit(:author, :text)
  end
end
