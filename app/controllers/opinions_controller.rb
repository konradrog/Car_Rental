class OpinionsController < ApplicationController
  def create
    @car = Car.find(params[:id])
    @opinion = Opinion.new(film_id: @film.id)
    @opinion.attributes = opinion_params

    if @opinion.save
      redirect_to film_path(@film)
    else
      render "car/show"
    end
  end

  def destroy
  end

  def show
  end

  private

  def opinion_params
    params.require(:opinion).permit(:author, :text)
  end
end
